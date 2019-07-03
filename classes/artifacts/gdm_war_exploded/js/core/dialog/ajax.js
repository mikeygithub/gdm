/**
 * 异步请求加载数据的方法
 * @date:   2017/10/06
 */

/********************默认参数****************************/
/**
 * 默认加载中提示
 */
var ajax_index = layer.load(1);
/**
 * 默认操作对象为空
 */
var alax_elment  = undefined ;
/**
 * 加载成功
 * @param result
 */
var ajax_success= function (result){
	 layer.close(ajax_index); 
	if (result) {
		layer.msg('操作成功',{icon: 1});
		setTimeout(function(){
			if(alax_elment==undefined||alax_elment==''){
				location.reload();
			}else{
				alax_elment.remove();
			} 
			}, 1000);
		
	}else{
		layer.msg('操作失败',{icon: 2});
	}
}
/**
 * 加载出错
 * @param result
 */
var ajax_error =  function(result){
	layer.close(ajax_index); 
	layer.msg('操作出错'+result,{icon: 2});
}
/************************************************************/
/**异步请求加载数据的方法
 * @param url 地址
 * @param data  数据{key:value} 键值对的方式
 * @param title 操作的提示信息
 * @param elment 需要操作的对象
 */
function ajax(url,data,title,elment){
	
	layer.confirm(title, {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		  ajax_default_config(url,data,elment);
	});  
}

/*
 * 默认配置
 */
function ajax_default_config(url,data,elment){
	var  type = 'post';
	var  cache = false;
	var  dataType = 'json';
	var  success = ajax_success;
	var error = ajax_error;
	alax_elment =  elment;
	ajax_base(ajax_config(type,cache,dataType,url,data,success,error));
}


/**
 * ajax异步 基础配置
 * @param type 请求类型：post/get
 * @param cache  数据缓存：true/false
 * @param dataType 数据请求返回类型 json/(text/html)/xml
 * @param url  请求地址
 * @param data 请求数据 {key：value} 键值对的方式
 * @param success 请求成功方法
 * @param error  请求失败方法
 * @returns
 */
function ajax_config(type,cache,dataType,url,data,success,error){
  console.log(data);
   var config =  {
    type:type,
    cache:cache,
    dataType :dataType,
    url: url,
	data :data,
	success :success,
	error :error
	};	
	 return config;
}


/**
 * 开始异步加载
 * @param ajax_config
 * @returns
 */
function ajax_base(ajax_config){
	 $.ajax(ajax_config);
}
