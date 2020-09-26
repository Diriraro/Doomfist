<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 > DoomFood | 회원정보</title>
</head>
<body>
<div align="center">
<img alt="" src="${pageContext.request.contextPath}/resources/images/idfind.png">
</div>
<hr>
<form class="form-horizontal" action="./memberIdFindResult" method="post">
<h3 align="center">아이디는 '${member.id}' 입니다 </h3>
</form>
</body>
</html>