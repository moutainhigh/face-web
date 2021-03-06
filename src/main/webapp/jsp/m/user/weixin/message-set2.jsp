<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8" />
<title>消息管理-自动回复消息</title>	
<!-- top -->
<%@ include file="../../common/base.jsp" %>
<%@ include file="../../common/validate.jsp" %>
<script type="text/javascript" src="${resourcePath}plugins/ajaxupload3.9.js"></script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="${resourcePath}js/wechat.js"></script>
<!--top end -->
<script type="text/javascript">
$(function(){
	tab("message");
	
	restSelect('${messageSetting.recoveryMode}','${messageSetting.eventType}',
			'${messageSetting.keyWord }', '${messageSetting.matchingType }');
	
	$('.content').find("button[name='uploadImg']").each(function(index){
		uploadimg($(this));
	});
	
	$("#j-select2").change(function() {
		var str = $(this).val();
		var eventType = ${messageSetting.eventType};
		var param = "&eventType="+eventType;
		var name = $("#messageName").val();
		if(3==eventType) {
			var keyWord = $("#keyWord").val();
			var matchingType = $("#matchingType").val();
			if(''!=keyWord) {
				param += "&keyWord="+keyWord+"&matchingType="+matchingType;
			}else {
				param += "&matchingType="+matchingType;
			}
			param += "&name="+name;
		}
		if (str == 1) {
			window.location.href='${ctx}/u/weixin/chooseReplyMode.htm?recoveryMode=1'+param;
		} else if (str == 2) {
			window.location.href='${ctx}/u/weixin/chooseReplyMode.htm?recoveryMode=2'+param; 
		} else if (str == 3) {
			window.location.href='${ctx}/u/weixin/chooseReplyMode.htm?recoveryMode=3'+param; 
		} else {
			$("#j-txt").addClass("hide");
			$("#j-txtimg").addClass("hide");
			$("#j-txtimgmore").addClass("hide");
		}
	});
	
	UE.getEditor('editor');

	wechat.delft();
});

function saveMessage() {
	var flg = wechat.submitFrom();
	var keyword = $("#keyWord").val();
	var messageName = $("#messageName").val();
	if('${messageSetting.eventType}'=='3') {
		if(keyword=='' || keyword.length>32) {
			flg = false;
			wechat.pageTips('关键词不能为空并且不能超过32个字符');
		};
		if(messageName =='' || messageName.length > 16) {
			flg = false;
			wechat.pageTips('消息名称不能为空并且不能超过16个字符');
		};
	}
	if(flg) {
		$(".j-loading").show();
		$("#form").submit();
	}
}

</script>
<script type="text/javascript">
/**
* ueditor控件相关
*/
UE.getEditor('editor');
function getContent() {
    return UE.getEditor('editor').getContent();
}
</script>
<script type="text/javascript">
/**
 * 上传图片
 */
 function uploadimg(btn){
	    var url = "${ctx}/any/files/upload${ext}";
	    new AjaxUpload(btn, {
	        action: url,
	        autoSubmit: true,
	        responseType: 'json',
	        onSubmit: function(file,ext){
	        	var imageSuffix = new RegExp('${imageSuffix}');
	        	if (!(ext && imageSuffix.test(ext.toUpperCase()))){
	            	art.dialog.alert("只支持上传jpg|jpeg|png格式图片");
	                return false;               
	            }
	        },
	        onComplete: function(file, response){
	        	if(response.flag == "SUCCESS") {
	        		$('#showImg').show();
	        		$('#showImg').attr("src","${picUrl}"+ response.source);
	        		$('#editorImg').show();
	        		$('#editorImg').attr("src","${picUrl}"+ response.source);
	        		$('#picPath').val(response.path);
	        		if(wechat.elNum != 1){
	        			wechat.setPic("${picUrl}"+ response.source);
	        		}else{
	        			wechat.setPic("${picUrl}"+ response.source);
	        		}
	        		$('.appmsg_pathimg').find('img').show().prev().hide();
	        	} else {
	        		art.dialog.alert(response.info);
	        	}
	        }
	    });
	}
</script>
</head>
<style>
.appmsg_title{padding-top:0px; height:30px;z-index:10;}
</style>
<body>
	<!-- header -->
	<%@include file="../../common/header.jsp" %>
	<!-- header end -->
	
	<!-- body -->
	<div class="container" id="j-content">
		<div class="row">
			<div class="col-md-2 navleft-sidebar">
				<!--nav-left -->
				<%@include file="../../common/left.jsp" %>
				<!--nav-left end-->
			</div>
			<div class="col-md-10">
				
						<c:set var="crumbs" value="message"/>
						<%@include file="../../common/crumbs.jsp"%>
					<div class="row">
						<div class="box">
							<div class="title">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#members-set" data-toggle="tab">消息管理</a></li>
								</ul>
							</div>
							<div class="content"  style="min-height:650px;">
							<form id="form" action="${ctx}/u/weixin/addMessage${ext}" method="post">
							<input id="weixinItem" type="hidden" name="weixinItem">
							<input type="hidden" name="eventType" value="${messageSetting.eventType}">
								<table class="table table-thleft table-noborder">
									<tbody>
										<c:if test="${messageSetting.eventType == 3 }">
											<tr data-name>
												<th width="10%">名称</th>
												<td><input type="text" id="messageName" name="name" value="${messageSetting.name }" class="form-control"></td>
											</tr>
										</c:if>
										<tr data-module>
											<th width="10%">回复模式</th>
											<td><select name="recoveryMode" class="form-control" id="j-select2">
													<option value="1">文字模式</option>
													<option value="2">单图文模式</option>
													<option value="3" selected="selected">多图文模式</option>
											</select></td>
										</tr>
										<c:if test="${messageSetting.eventType == 3 }">
											<tr data-key>
												<th width="10%">关键词</th>
												<td><input id="keyWord" name="keyWord" type="text" class="form-control"></td>
											</tr>
											<tr data-type id="j-keyword" title="关键词">
												<th width="10%">匹配类型</th>
												<td><select id="matchingType" name="matchingType" class="form-control">
														<option value="1">模糊匹配</option>
														<option value="2">精确匹配</option>
												</select></td>
											</tr>
										</c:if>
									</tbody>
								</table>

								<div class="main_bd" id="j-txtimgmore">
									<div class="media_preview_area">
										<div class="appmsg  editing">
											<div id="js_appmsg_preview" class="appmsg_content">
											<div id="appmsgItem1" data-id="1" class="js_appmsg_item">
										        <div class="appmsg_info">
										            <em class="appmsg_date"></em>
										        </div>
										        <div class="cover_appmsg_item">
										            <h4 class="appmsg_title"></h4>
										            <div class="appmsg_thumb_wrp">
										                <img class="js_appmsg_thumb appmsg_thumb" src="">
										                <i class="appmsg_thumb default">封面图片</i>
										            </div>
										            <div class="appmsg_edit_mask">
										                <a onclick="wechat.editId(this)" class="edit_gray js_edit" data-id="1" href="javascript:;">编辑</a>
										            </div>
										        </div>
										    
										</div>
											<div id="appmsgItem2" data-fileid="" data-id="2" class="appmsg_item js_appmsg_item ">
											    <img class="js_appmsg_thumb appmsg_thumb" src="">
											    <i class="appmsg_thumb default">缩略图</i>
											    <h4 class="appmsg_title">标题</h4>
											    <div class="appmsg_edit_mask">
											        <a class="edit_gray js_edit" data-id="2" onclick="wechat.editId(this)" href="javascript:void(0);">编辑</a>
											        <a class="del_gray js_del" data-id="2" onclick="wechat.editDel(this)" href="javascript:void(0);">删除</a>
											    </div>
											</div>
											</div>
											<a onclick="wechat.editAdd()" class="create_access_primary appmsg_add" id="js_add_appmsg" href="javascript:void(0);">
								                <i class="glyphicon glyphicon-plus" style="font-size:20px;line-height:74px;color:#d9dadc;"></i>
								            </a>
										</div>

									</div>

								<div class="media_edit_area">
									<div id="js_appmsg_editor">
									<div class="appmsg_editor" style="margin-top: 0px;">
										<div class="inner">
											<div class="appmsg_edit_item">
												<label for="" class="frm_label">标题<span class="fontcor-red">*</span></label>
												<span class="frm_input_box"><input type="text" class="frm_input j-datawx" onkeyup="wechat.blurText(this)" name="title"></span>
											</div>
											<div class="appmsg_edit_item">
												<label for="" class="frm_label">
													<strong class="title">封面<span class="fontcor-red">*</span></strong>
													<p class="js_cover_tip tips">（建议大图360*200PX,小图200*200PX）</p>
													<input class="j-datawx" type="hidden" id="picPath" name="picPath">
												</label>
												<div class="upload_wrap">
													<button type="button" name='uploadImg' class="btn btn-default">上传</button>
												</div>
												<p class="appmsg_pathimg"><span>图文</span><img id="editorImg" class="j-datawx" name="pic" src="" alt="" style="height:78px;display:none;"></p>
											</div>

											<div class="appmsg_edit_item">
												<label for="" class="frm_label">正文<span class="fontcor-red">*</span>（正文和链接类型选择填写一样）</label>
												<div class="js-ueditor" style="width:393px;">
													<script id="editor" type="text/plain" style="height:120px;"></script>
												</div>
											</div>

											<p style="margin-bottom:5px;">
												<select class="form-control input-short-5 j-linkaddr j-datawx" name="linkType">
													<option value="2">链接地址</option>
													<option value="1">首页</option>
												</select>
											</p>
											<p style="margin-bottom:5px;">（注：选择链接至首页时，正文内容不显示）</p>
											<div class="js_url_area appmsg_edit_item">
												<span class="frm_input_box"><input type="text" class="js_url frm_input j-datawx" name="linkPath"></span>
											</div>
										</div>
										<i class="arrow arrow_out" style="margin-top: 0px;"></i>
										<i class="arrow arrow_in" style="margin-top: 0px;"></i>
									</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="text-center" style="border-top:1px solid #ccc;margin-top:20px;padding-top:20px;">
									<button type="button" onclick="saveMessage();" class="btn btn-default">发布</button>
								</div>
								</div>
							</form>
							</div>
						</div>
					</div>
				
			</div>
		</div>
	</div>
	<!-- body end -->

	<!-- footer -->
	<%@include file="../../common/footer.jsp" %>
	<!-- footer end -->
	</body>
</html>