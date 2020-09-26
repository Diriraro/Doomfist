<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지정보</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">

		<div class="page-header text-center text-info">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/images/notice_2.png">
			</div>
			<br></br> <br></br>
			<hr style=" border-top: 3px #80d6ff solid;">

		</div>


		<div class="panel panel-info"
			style="text-align: center; font-size: 15px; font: normal; ">
			<div class="panel-heading col-sm-1">#</div>
			<div class="panel-heading col-sm-5">TITLE</div>
			<div class="panel-heading col-sm-2">작성자</div>
			<div class="panel-heading col-sm-2">날짜</div>
			<div class="panel-heading col-sm-2">조회수</div>
		</div>
		<div class="panel"
			style="text-align: center; font-size: 15px;">
			<div class="panel-heading col-sm-1">${vo.no_num}</div>
			<div class="panel-heading col-sm-5" style="font-weight: bold;">${vo.title}</div>
			<div class="panel-heading  col-sm-2">관리자</div>
			<div class="panel-heading  col-sm-2">${vo.regDate}</div>
			<div class="panel-heading  col-sm-2">${vo.likes}</div>
			<br>
			<hr>
		</div>

		<br>
		<div class="panel panel-info">
			<div class="panel-body"
				style="width: 100%; overflow: hidden; word-wrap: break-word;">
				${vo.contents}</div>
		</div>
		

		<div></div>
		<br> <br>
		<div>
			<c:choose>
				<c:when test="${member.id eq 'admin'}">
					<a href="./${board}Update?num=${vo.no_num}" class="btn btn-info"><span
						class="glyphicon glyphicon-edit"></span>Update</a>
					<a href="./${board}Delete?num=${vo.no_num}"
						class="btn btn-danger pull-right"><span
						class="	glyphicon glyphicon-remove-sign"></span>Delete</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>