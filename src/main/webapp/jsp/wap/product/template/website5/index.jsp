<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../common/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>${titleShopName}</title>
<%@include file="../common/top.jsp" %>
<link rel="stylesheet" type="text/css"	href="${resourcePath }template/page/website5/css/main.css">
</head>
<body>

<div id="slider" data-width="100%" data-height="59.375%">
	<ul>
		<c:forEach items="${carouselList}" var="carousel">
			<li><a href="${carousel.resourcePath }"><img src="${carousel.imgPath }" alt=""/></a></li>
		</c:forEach>
	</ul>
</div>

<ul class="column-list">
	<c:forEach items="${modularList}" var="modular">
		<li>
			<a href="${modular.resourcePath }" data-background>
				<span class="column-list-pic"><img src="${modular.imgPath }"  alt="" ></span>
				<var class="column-list-info" data-font>${modular.nameZh}</var>
			</a>
			<i class="column-list-shadow"></i>
		</li>
	</c:forEach>
</ul>
<%@include file="../../../common/popularize.jsp"%>
</body>

<script type="text/javascript">
//字体颜色、背景颜色、背景透明度、字号可修改
//后端传来的数据
var data = JSON.parse('${json}');
</script>
</html>
