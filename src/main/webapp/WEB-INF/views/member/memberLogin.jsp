<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoomFood | LOGIN</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>

<c:choose>
<c:when test="${sessionId != null}">
<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
<h3>'${sessionId}' 님 환영합니다! </h3>
<h3><a href="http://localhost:8080/s1/">홈페이지 이용하기</a></h3>
<h3><a href="logout">로그아웃</a></h3>
</c:when>
<c:otherwise>
<!-- 폼넣기 -->
<div class="container">
<br>
<br>
		   <div><img src="${pageContext.request.contextPath}/resources/images/login_2.png"> </div> 
<br>
<br>
  <form class="form-horizontal" action="./memberLogin_HOME" method="post">
    <div class="form-group">
      <label for="inputlg">아이디:</label>
      <input type="text" style="width: 30%;"  class="form-control input-lg" value="${cookie.cId.value}" id="id" placeholder="Enter ID" name="id">
    </div>
    <div class="form-group">
      <label for="inputlg">비밀번호:</label>
      <input type="password" style="width: 30%;"  class="form-control input-lg" id="pw" placeholder="Enter PW" name="pw">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember">아이디 저장</label>
    </div>
    <br>
    <!--<button type="submit" class="btn btn-primary">로그인</button>-->
    <input type="image" id="joinbtn" style="outline: 0; " src="${pageContext.request.contextPath}/resources/images/loginbtn.png">
    <hr></hr>
    <a href="" onclick="javascript:openWin();">아이디를 잊으셨습니까?</a>
    <br></br>
	<a href="${pageContext.request.contextPath}/member/memberJoin" >아이디가 없으신가요? 지금 생성하세요.</a>
	<br></br>
	<div id="naverIdLogin"></div>
<br>
</form>
</div>

<!--  -->










<!--  -->


<!-- 네이버 로그인 창으로 이동 -->
<div class="container" id="naver_id_login" style="text-align:left;"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
</c:otherwise>
</c:choose>

<footer style="margin-top: 8%">
<c:import url="../template/footer.jsp" ></c:import>
</footer>
<!-- <div class="container">
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
	<div id="naverIdLogin"></div>
	
    <hr></hr>
  </form>
</div>-->

	<!-- 네이버 로그인 창으로 이동 -->
<!--<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>-->




<!-- <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "LguKBDvqrA_EBm7awPdH",
			callbackUrl: "http://localhost:8080/s1/member/callback",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();-->
	<script type="text/javascript">
	$("#naver_id_login").click(function() {
		alert("네이버로 로그인시 서비스이용(맛집신청, 주문결제 등)에 제한이 있을 수 있습니다. ")
	})
	
	function openWin() {
		window.open("http://localhost:8080/s1/member/memberIdFind","아이디찾기","width=470, height=330, toolbar=no, menubar=no, scrollbars=no, resizable=yes") 

	}
	</script>

	

</body>
</html>