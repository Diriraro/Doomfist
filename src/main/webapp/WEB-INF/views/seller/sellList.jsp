<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | ${sessionScope.member.id}님의 식당 주문현황</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>


</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container">
		<div class="row">
			<img src="${pageContext.request.contextPath}/resources/images/sellList1.png">
			<br>
			<br>
			
			<div id="result">
			<table class="table table-hover">
				<tr>
					<td>식당고유번호</td> <!-- st_key -->
					<td>식당이름</td> <!-- st_title -->
					<td></td>
					<td>오늘 주문 받은 갯수!</td>

				</tr>
				
				
				<c:forEach items="${sel_list}" var="vo" varStatus="i">
					<tr>
						<td>${vo.st_key}</td>
						<td><a href="./orderCheck?st_key=${vo.st_key}">${vo.st_name}</a></td>
						<td></td>
						<td>${or_co[i.index]} 개</td>
					</tr>
				</c:forEach>
				
			</table>
			</div>


		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>