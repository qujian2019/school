//高亮变色
$(document).on("mouseover", ".liclass", function() {
	$(this).children().css("color", "#0055AA");
}).on("mouseout", ".liclass", function() {
	$(this).children().css("color", "#000000");
});

//高亮变色
$(document).on("mouseover", ".glxs_1", function() {
	$(this).css("color", "#0055AA");
}).on("mouseout", ".glxs_1", function() {
	$(this).css("color", "#000000");
});

Date.prototype.Format = function(fmt) { // author: meizz
	var o = {
		"M+": this.getMonth() + 1, // 月份
		"d+": this.getDate(), // 日
		"h+": this.getHours(), // 小时
		"m+": this.getMinutes(), // 分
		"s+": this.getSeconds(), // 秒
		"q+": Math.floor((this.getMonth() + 3) / 3), // 季度
		"S": this.getMilliseconds() // 毫秒
	};
	if(/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for(var k in o)
		if(new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

//两个时间的天数差 日期格式为 YYYY-MM-dd 
function daysBetween(DateOne, DateTwo) {
	var OneMonth = DateOne.substring(5, DateOne.lastIndexOf('-'));
	var OneDay = DateOne.substring(DateOne.length, DateOne.lastIndexOf('-') + 1);
	var OneYear = DateOne.substring(0, DateOne.indexOf('-')); 
	var TwoMonth = DateTwo.substring(5, DateTwo.lastIndexOf('-'));
	var TwoDay = DateTwo.substring(DateTwo.length, DateTwo.lastIndexOf('-') + 1);
	var TwoYear = DateTwo.substring(0, DateTwo.indexOf('-')); 
	var cha = ((Date.parse(OneMonth + '/' + OneDay + '/' + OneYear) - Date.parse(TwoMonth + '/' + TwoDay + '/' + TwoYear)) / 86400000); 
	return Math.abs(cha);
}

//若要显示:当前日期加时间(如:2009-06-12 12:00)
function CurentTime() {
	var now = new Date();

	var year = now.getFullYear(); //年
	var month = now.getMonth() + 1; //月
	var day = now.getDate(); //日

	var hh = now.getHours(); //时
	var mm = now.getMinutes(); //分

	var clock = year + "-";

	if(month < 10)
		clock += "0";

	clock += month + "-";

	if(day < 10)
		clock += "0";

	clock += day + " ";

	if(hh < 10)
		clock += "0";

	clock += hh + ":";
	if(mm < 10) clock += '0';
	clock += mm;
	return(clock);
}

//设置元素之间的内容
function setInnerText(element, content) {
	//判断element是否支持innnerText
	if(typeof element.innerText === 'string') {
		element.innerText = content;
	} else {
		element.textContent = content;
	}
}

//获取随机数 min - max
function getRandom(min,max){
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random()*(max - min+1))+min;
}


function uuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "-";
    var uuid = s.join("");
    var uuid2 = uuid.substring(0,13);
    return uuid2;
}