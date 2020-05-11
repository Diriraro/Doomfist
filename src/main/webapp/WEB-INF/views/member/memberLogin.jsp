<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>


<div class="container">
  <h1>로그인</h1>
  <br></br>
  <form class="form-horizontal" action="./memberLogin" method="post">
    <div class="form-group">
      <label for="inputlg">아이디:</label>
      <input type="text" class="form-control input-lg" id="id" placeholder="Enter ID" name="id">
    </div>
    <div class="form-group">
      <label for="inputlg">비밀번호:</label>
      <input type="password" class="form-control input-lg" id="pw" placeholder="Enter PW" name="pw">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember">아이디 저장</label>
    </div>
    
    <button type="submit" class="btn btn-primary">로그인</button>
    <hr></hr>
    <a href="#">아이디 또는 비밀번호를 잊으셨습니까?</a>
    <br></br>
	<a href="${pageContext.request.contextPath}/member/memberJoin">아이디가 없으신가요? 지금 생성하세요.</a>
	<br></br>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=3d40af6959ca5229244f5399b989263c&redirect_uri=http://localhost:8080/s1/member/memberLogin&response_type=code">
	<img src="${pageContext.request.contextPath}/resources/images/kakao_login_btn_medium_wide.png">
	</a>
	
    <hr></hr>
  </form>
</div>
<footer style="margin-top: 15%">
<c:import url="../template/footer.jsp" ></c:import>
</footer>
	

</body>
</html>