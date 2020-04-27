
/**
 * 全选或者反选
 * @param selectId
 */
function checkAll(formId,selectId) {
	var form = document.getElementById(formId);
	if(selectId.type=="checkbox"){
			selectId.checked = !selectId.checked;
	}
	var checkbox = form.getElementsByTagName("input");
	for(var i=0;i<checkbox.length;i++){
		if(checkbox[i].type=="checkbox"){
			checkbox[i].checked = !checkbox[i].checked;
		}
	}
}

/**
 * 批量删除记录
 * @param formId
 * @param url
 * @param selectId
 * @returns {Boolean}
 */
function del_submit(formId, url, selectId) {
	if ($("input[name='" + selectId + "']:checked").length <= 0) {//大于等于1说明选中了一个以上
		alert("您还没有勾选您要删除的记录！");
		return false;
	}
	$("#" + formId + "").attr("action", url);
	$("#" + formId + "").submit();
}

/**
 * 跳转
 * @param formId
 * @param url
 */
function jump_submit(formId,url){
	$("#" + formId + "").attr("action", url);
	$("#" + formId + "").submit();
}

/**
 * 批量添加
 * @param formId
 * @param url
 * @param selectId
 * @returns {Boolean}
 */
function add_submit(formId, url, selectId) {
	if ($("input[name='" + selectId + "']:checked").length <= 0) {//大于等于1说明选中了一个以上
		alert("您还没有勾选您要添加的记录！");
		return false;
	}
	$("#" + formId + "").attr("action", url);
	$("#" + formId + "").submit();
}

/**
 * 返回
 * @param url
 */
function back(url){
	layer.close(commonpop);
}

/**
 * 打开模态对话框
 * @param url
 * @param dgName
 * @param width
 * @param height
 * @return
 */
function openDialog(url, dgName, width, height) {

	var result = window.showModalDialog(url, dgName, "dialogWidth=" + width
			+ "px;dialogHeight=" + height + "px");
}

/**
 *  var  代表弹出窗对象，即关闭弹窗时调用lay.close()
 * 统一弹出窗
 * @param hig 定义高度
 * @param wid 定义宽度
 * @param url 定义弹出界面路径
 */
var  commonpop;
function commonpopup(hig,wid,url){
	var hight = hig;
	var width = wid;
	var address = url;
	 commonpop = $.layer({
        type: 1,
        shift: 'top',
        offset: ['28%',''],
        title: false, //不显示默认标题栏
        shade: [0.5, '#000'], //遮罩
        area: [width+'px', hight+'px'],
      	page:{
      		url:address
				}
		});
}