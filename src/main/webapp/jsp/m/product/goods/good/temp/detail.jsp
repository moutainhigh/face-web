<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
/** ueditor控件相关 */
UE.getEditor('editor');
function getContent() {return UE.getEditor('editor').getContent();}
</script>
<tr>
	<th style="vertical-align:top">商品详情：</th>
	<td>
		<input type="hidden" id="goodContent" name="goodContent"/>
		<script id="editor" type="text/plain" style="width:100%;height:500px;">${good.goodContent}</script>
	</td>
</tr>