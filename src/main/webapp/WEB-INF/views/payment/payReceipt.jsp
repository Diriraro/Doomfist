<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보 확인</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body> --%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<div class="modal-body"
	style="text-align: center; font-size: 30px; margin-left: 10%; margin-right: 10%;">
	<h1 style="color: black;">${sessionScope.member.id}님결제내역</h1>
	<ul class="list" style="list-style-type: none;">

		<c:forEach items="${vo_pf}" var="vo" varStatus="i">
			<div style="margin-top: 50px">
				<hr>
				${vo.pf_stname} || 결제날짜 :${vo.pf_date}
			</div>
			<div style="font-size: medium;">
				<br> <a href="/s1/payment/payReceipts?pf_key=${vo.pf_key}"
				data-toggle="modal" data-target="#my3Modal">
				자세히보기
				</a>
				<c:set var="sum" value="${0}" />
			
				
			</div>
		</c:forEach>



	</ul>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>



<!-- </body>
</html> -->