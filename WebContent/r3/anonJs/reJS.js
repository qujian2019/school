var conf = {
	apiUrl: "http://www.hngsxy.com/manage/",
	ticket: {
		"ticket": "eqw5482e-7we2-4dd1-bdc7-a6fb3e806ddc1"
	},
	dbconfig: ""
};
(function() {
	request = {
		send: function(do_url, param, fun) { // 权限请求处理
			if(do_url.indexOf("http") == -1) {
				do_url = conf.apiUrl + do_url ;//+ "&_dbCongfig=" + conf.dbconfig;
			}
			$.ajax({
				type: "post",
				contentType: "application/json",
				headers: conf.ticket,
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
		},
		myaAjax:function(do_url, param, fun){
			$.ajax({
				type: "post",
				contentType: "application/json",
				headers: conf.ticket,
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