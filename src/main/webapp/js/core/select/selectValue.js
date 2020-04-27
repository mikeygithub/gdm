/**
 * 下拉表的值
 */
function findSelectValue(selectID,url){	

	if($("#"+selectID+" option").size()<=1){
		$.ajax({
			   type: "POST",
			   url:url,
			   dataType: "json",
			   async:false,
			   success: function(json){								 
					 for(var i=0;i<json.length;i++){
					     var content="<option value='"+json[i].id+"'>"+json[i].name+"</option>";
					     $("#"+selectID).append(content);		      
					 }						
			      
			   },
		      error:function(){
			     layer.msg("数据加载失败！",{time:1000});
		      }		
	    });
	}		
};
