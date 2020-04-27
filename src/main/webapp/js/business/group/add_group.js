//添加分组
function addGroup(categoryIds,groupName,groupType,deptNumber,index){
	  if(categoryIds==""){
		  layer.msg('至少勾选一个答辩方向',{icon: 2});
		  setTimeout(function(){
			  openGroup();
	           layer.close(index);
	        },1000);
		  return;
	  }
	  if(groupName==""||groupName.length==0){
		  layer.msg('组名不能为空',{icon: 2});
		  setTimeout(function(){
			  openGroup();
	           layer.close(index);
	        },1000);
		  return;
	  }
	
	     layer.confirm('您确定要添加该分组?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: 'GroupAllot_add.action',
					dataType : "json",
					data : {
						"categoryIds":categoryIds,
						"model.groupName" : groupName,
						"model.groupType" : groupType,
						"model.deptNumber":deptNumber
					},success : function(result) {
						layer.close(index); 
						if (result) {
							layer.alert('添加分组成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('添加分组失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('添加分组失败',{icon: 2});
					}
				});
  });
}

