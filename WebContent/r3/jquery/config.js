var subpage_style = {
	top: '0px',
	bottom: '51px'
};
var backApp=null;
var config = {
	myyuming:'http://www.hngsxy.com',
	notH5:'http://www.hngsxy.com/notH5',
	item: "http://www.hngsxy.com/manage",
	ticket: {
		"ticket": "eqw5482e-7we2-4dd1-bdc7-a6fb3e806ddc1"
	},
	dbconfig: ""
};
// 检测更新
var checkUrl=config.item+"/wgtVer.jsp";
// 下载wgt文件
var wgtUrl=config.item+"/gsxy.wgt";
config.itemApi=config.item+"/api";
var islogin;//是否登陆
var auths_=[];//服务列表
var authsMap={};
function hidAllView(url){
	var wvs=plus.webview.all();
	for(var i=0;i<wvs.length;i++){
		theUrl=wvs[i].getURL();
		if(theUrl.slice(-10)!='/main.html'){
			if(!url||theUrl.slice(-url.length)!=url){
				wvs[i].hide();
			}
		}
	}
}
var hasGoUrl=null;
(function($, doc) {
		mui.plusReady(function() {
			var curview=plus.webview.currentWebview();
			hasGoUrl=curview.goUrl;
			backApp=hasGoUrl;
			if(hasGoUrl){
				$.back = function(event) {
//					if(hasGoUrl){
						plus.webview.getWebviewById(hasGoUrl).show();
//					}
				}
			}
		})
})(mui, document)
function getAuths(type){
	if(auths_.length==0){
		plus.oauth.getServices(function(services) {
			auths_ = services;
			for (var i in services) {
				var service = services[i];
				authsMap[service.id] = service;
			}
		}, function(e) {
			mui.toast("获取登录服务列表失败：" + e.message + " - " + e.code);
		});		
	}
	return authsMap[type];
}
//// 检测更新
function checkUpdate(backFun){
	plus.runtime.getProperty(plus.runtime.appid,function(inf){// 获取本地应用资源版本号
		wgtVer=inf.version;
		$('#version').text(wgtVer);
//		plus.nativeUI.showWaiting("检测更新...");
		var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			switch(xhr.readyState){
				case 4:
				plus.nativeUI.closeWaiting();
				if(xhr.status==200){
					console.log("检测更新成功："+xhr.responseText);
					var s_=xhr.responseText.trim().split(":");
					var newVer=s_[0];
					if(typeof backFun=="function"){
						$('#version_new').text(newVer);
						backFun(wgtVer&&newVer&&(wgtVer!=newVer)&&(s_[1]=="0"));//0不检测更新，以当前版本为最新
					}
				}
				break;
				default:
			}
		}
		xhr.open('GET',checkUrl);
		xhr.send();
	});
}
//// 下载wgt文件
function downWgt(){
	plus.nativeUI.showWaiting("下载更新文件...");
	plus.downloader.createDownload( wgtUrl, {filename:"_doc/update/"}, function(d,status){
		if ( status == 200 ) { 
			console.log("下载文件成功："+d.filename);
			installWgt(d.filename);	// 安装wgt包
		} else {
			console.log("下载更新失败！");
			plus.nativeUI.alert("下载更新失败！");
		}
		plus.nativeUI.closeWaiting();
	}).start();
}
// 更新应用资源
function installWgt(path){
	plus.nativeUI.showWaiting("安装更新文件...");
	plus.runtime.install(path,{},function(){
		plus.nativeUI.closeWaiting();
		console.log("更新成功！");
		plus.nativeUI.alert("应用资源更新完成！",function(){
			plus.runtime.restart();
		});
	},function(e){
		plus.nativeUI.closeWaiting();
		console.log("安装更新文件失败["+e.code+"]："+e.message);
		plus.nativeUI.alert("安装更新文件失败["+e.code+"]："+e.message);
	});
}
(function() {
	request = {
		send: function(do_url, param, fun) { // 权限请求处理
			if(do_url.indexOf("http") == -1) {
				do_url = config.item + do_url + "&_dbCongfig=" + config.dbconfig;
			}
			$.ajax({
				type: "post",
				contentType: "application/json",
				headers: config.ticket,
				url: do_url,
				data: JSON.stringify(param),
				success: function(data) {
					if(typeof(fun) == "function") {
						fun(data);
					}
				},
				error: function(data) {
					console.log("错误" + data.message);
				}
			});
		}
	}
})();

//list转map
function listTokey(data, keyFile) {
	var map = {};
	var row;
	for(var m in data) {
		row = data[m];
		if(!map[row[keyFile]]) {
			map[row[keyFile]] = row;
		}
	}
	return map;
}
function listKeyToList(data, keyFile) {
	var map = {};
	var row;
	for(var m in data) {
		row = data[m];
		if(!map[row[keyFile]]) {
			map[row[keyFile]]=[] ;
		}
		map[row[keyFile]].push(row);
	}
	return map;
}
String.prototype.format = function(args) {
    var result = this;
    if (arguments.length > 0) {
        if (arguments.length == 1 && typeof (args) == "object") {
            for (var key in args) {
                if(args[key]!=undefined){
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    var reg= new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}
function dateFrame(dateInt){
	var da = new Date(dateInt);
    var year = da.getFullYear();
    var month = ("0" + (da.getMonth()+1)).slice(-2);
    var date = ("0" + da.getDate()).slice(-2);
    var str=[year,month,date].join('-');
    return str;
}

function backButtonPress($){
		var backButtonPress = 0;
		$.back = function(event) {
			if(!hasGoUrl){
				backButtonPress++;
				if(backButtonPress > 1) {
					plus.runtime.quit();
				} else {
					plus.nativeUI.toast('再按一次退出应用');
				}
				setTimeout(function() {
					backButtonPress = 0;
				}, 1000);
				return false;
			}else{
				plus.webview.getWebviewById(hasGoUrl).show();
				hasGoUrl=backApp;
			}
		};

}
// 对Date的扩展，将 Date 转化为指定格式的String   
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
// 例子：   
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt1)   
{
	 var fmt="yyyy-MM-dd hh:mm:ss";
  if(fmt1){
  	 fmt=fmt1;
  }
 
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  

//上传到服务器
function uploadFile(fileSrc,site_id,picId,backFun){
    var wt=plus.nativeUI.showWaiting();
    var task=plus.uploader.createUpload(config.item+'/itemFile.do?site_id='+site_id+'&picId='+picId,
        {method:"POST"},
        function(t,status){ //上传完成
        	if(typeof backFun =='function'){
        		if(status==200){
	        		var jsonMao=JSON.parse(t.responseText);
		    		backFun(jsonMao);
	    		}
	    	}
        	wt.close(); //关闭等待提示按钮
        }
    );  
	task.setRequestHeader('ticket',config.ticket.ticket);
    task.addFile(fileSrc,{key:"dddd"});
    task.start();
} 


function closeView(id){
	var win=plus.webview.getWebviewById(id);
	if(win){
		win.close();
	}
}