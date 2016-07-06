<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<%@include file="../../common/base.jsp"%>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"  content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>消费记录</title>
<%@ include file="../../common/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${resourcePath }member/css/main.css">
</head>
<body>

<div id="box">

	<div class="list-tabs">
		<ul>
			<li><a href="javascript:void(0);"><span>1 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>2 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>3 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>4 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>5 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>6 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>7 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>8 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>9 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>10 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>11 月</span><span>2015</span></a></li>
			<li><a href="javascript:void(0);"><span>12 月</span><span>2015</span></a></li>
		</ul>
	</div>
	
	<div class="purchase-tit"><b>您的所有消费详情：</b></div>
	<c:if test="${empty consumeList}">
		亲，你还没有产生消费账单哦
	</c:if>
	<c:if test="${!empty consumeList }">
	<div class="purchase-info">
		<table class="table table-bordered">
			<thead>
				<tr class="active">
					<th>日期</th>
					<th>消费(元)</th>
					<th>积分</th>
				</tr>
			</thead>
			<tbody class="table">
				<c:forEach items="${consumeList }" var="consume">
					<tr>
						<td>${consume.date }</td>
						<td>${consume.money }</td>
						<td>${consume.integral }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	
	<%@ include file="../../common/nav.jsp"%>
</div>

<script type="text/javascript">
	function toAttention(){
		art.dialog({
			lock:true,
			width:'100%',
			title:"是否要关注该品牌？",
			content:document.getElementById('j-toAttention'),
			button:[{
				name:"取消",
				focus:true,
				callback:function(){
					
				}
			},{
				name:"关注",
				callback:function(){
					location.href='member-share.html';
				}
			}]
		});
	};
	$('.list-tabs li').click(function(){
		$(this).parent().children(".active").removeClass("active");	
		$(this).addClass("active");
		var month=$(this).find('span:first').text();
		var year=$(this).find('span:last').text();
		var monthInt = month.substring(0, month.length-1);
		$('.purchase-tit b').empty().text(monthInt+"月份的消费账单");
		$.post("/wap/${sessionShopNo}/buy/member/consume/listByTime.htm", {'year':year, 'month':monthInt}, function(jsonData) {
			var data = JSON.parse(jsonData);
			if(data == null || data.length==0) {
				$(".purchase-info").empty().text("亲，没有这个月份的消费账单哦");
			} else {
				$(".purchase-info").empty();
				$(".purchase-info").html("<table class='table table-bordered'><thead><tr class='active'><th>日期</th><th>消费(元)</th><th>积分</th></tr></thead><tbody class='table'></tbody></table>")
				for(var i=0; i < data.length; i++) {
					$("tbody[class='table']").append("<tr><td>"+data[i].date+"</td><td>"+data[i].money+"</td><td>"+data[i].integral+"</td></tr>");
				}
			}
			
		});
	});
</script>

</body>
</html>