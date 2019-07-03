/**
 * 关闭窗口，调用close()方法
 * @date:   2015/11/03
 */

function closeDialog(){
	   var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	   parent.layer.close(index);
}