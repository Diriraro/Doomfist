<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 실패</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>

<div class="panel panel-default">
	<div class="panel-body" style="text-align: center;">
<img src="${pageContext.request.contextPath}/resources/images/main.png" alt="main">
	</div>
	<div class="panel-body" style="text-align: center;">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/payF.png" height="400px;">
	</div>
	<div class="panel-body" style="text-align: center;">
		<a href="../">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/payF2.PNG">
		</a>
	</div>
	
</div>
</body>
</html>