<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<h1>${sessionScope.member.id}님의신청 현황</h1>
	<table class="table table-hover">
		<tr>
			<td>신청번호</td>
			<!-- qna_storekey -->
			<td>식당이름</td>
			<!-- qna_title -->
			<td>날짜</td>
			<!-- qna_date -->
			<td>승인 여부</td>
		</tr>

		
		<c:forEach items="${list}" var="vo" varStatus="i" >
			<tr>
				<td>${vo.qc_check}</td>
				<td>${vo.qc_title}</td>
				<td>${vo.qc_date}</td>
				<td id="check">
					<c:choose>
					<c:when test="${vo.qna_storekey > 0}">
						처리중
					</c:when>
					<c:otherwise>
						${result[i.index]}				
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>