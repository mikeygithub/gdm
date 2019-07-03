/**
 * 基于layer的查看图片
 * @param {Object} url  图片地址
 * 备注：  需要导入layer.js和 layer.ext.js
 */

function photo(url){
	if($.trim(url)==''){
		layer.msg("地址不能为空",{time:1000});
	}else{
		var json={"data":[{"src":url}]};
	
	  	layer.photos({
	  		shift:'left',
	  		offset:['10%',''],
		    closeBtn:true,
		    photos: json
		});
	}
}