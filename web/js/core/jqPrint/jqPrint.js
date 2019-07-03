/**
 * 打印
 * @param {Object} divId   传入一个div的Id，打印div中的内容
 * 备注:  1.divid形式：   （#divId）
 * 		2.	需要导入jqprint包和jquery包（注：如果不行就换低版本的jquery.js）		
 */
function print(divId){
	$(divId).jqprint({
	   importCSS: true,//打印时是否引入css样式（如果是true，先会找$(“link[media=print]“)，若没有会去找$(“link”)中的css文件） 
	   printContainer: true//表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。 
	});
}