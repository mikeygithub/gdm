
/**
 * * 对话框
 * @param {Object} width 宽度
 * @param {Object} height 高度
 * @param {Object} title 标题
 * @param {Object} url 地址 
 * @param {Object} isHasScroll  是否有滚动条   true：有   false：无
 * @param {Object} offset_x  距离父窗体宽度
 * @param {Object} offset_y  距离父窗体高度
 * @log: 1.创建方法  （mengyiwen）
 */

function dialog(width, height , title, url, isHasScroll, offset_x, offset_y){
	
	if(width==undefined){
		width='50%';
	}
	if(height==undefined){
		height='50%';
	}
	if(offset_x==undefined){
		offset_x=0;
	}
	if(offset_y==undefined){
		offset_x=0;
	}
	
	if(isHasScroll==false){  //没有滚动条
		layer.open({
		    type: 2,
		    title:title,
		    area: [width ,height],
		    offset: [offset_x, offset_y],
		    maxmin: true,
		    content: [url,'no']
	    });   
	}else{   //有滚动条( 默认：有)
		layer.open({
		    type: 2,
		    title:title,
		    area: [width ,height],
		    offset: [offset_x, offset_y],
		    maxmin: true,
		    content: url
	    });  
	}
}



function dialogReload(width, height , title, url, isHasScroll, offset_x, offset_y){
	
	if(width==undefined){
		width='50%';
	}
	if(height==undefined){
		height='50%';
	}
	if(offset_x==undefined){
		offset_x=0;
	}
	if(offset_y==undefined){
		offset_x=0;
	}
	
	if(isHasScroll==false){  //没有滚动条
		layer.open({
		    type: 2,
		    title:title,
		    area: [width ,height],
		    offset: [offset_x, offset_y],
		    maxmin: true,
		    content: [url,'no'],
		    end: function () {
                location.reload();
            }
	    });   
	}else{   //有滚动条( 默认：有)
		layer.open({
		    type: 2,
		    title:title,
		    area: [width ,height],
		    offset: [offset_x, offset_y],
		    maxmin: true,
		    content: url,
		    end: function () {
                location.reload();
            }
	    });  
	}
}

/**
 * 关闭窗口，调用close()方法
 * @date:   2015/11/03
 */

function closeDialog(){
	   var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	   parent.layer.close(index);
}