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
 <form class="form-horizontal" action="./memberIdFind" method="post">
 <div style="width: 440px; border-top: 3px #80d6ff solid; border-left: 1px #dfdfdf solid; border-right: 1px #dfdfdf solid; border-bottom: 1px #dfdfdf solid;">
    <div class="form-group">

    <table class="text-info Shadow" style="width: 100%; border-top: 3px white solid;">
    <tr>
      	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;E-Mail : </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 60px;"><input value="${sessionId}" type="email"  id="email"  name="email"><td>
    </tr>
    
    <tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;이름 : </th>
     	<td style="border-bottom: 1px #dfdfdf solid; height: 60px;"><input value="${sessionName}" type="text"  id="name"  name="name"><td>
    </tr>
    
    </table>
    </div>
    <br>
    <div align="center">
    <button class="btn btn-default" style="border: 0 none; width: 100px; height: 39px; background-image: url('${pageContext.request.contextPath}/resources/images/joinjoin.png');" type="submit" class="btn btn-primary"></button>
    </div>
  	<br>
    <!-- <a href="#">아이디 또는 비밀번호를 잊으셨습니까?</a>
    <br></br>
	<a href="${pageContext.request.contextPath}/member/memberJoin">아이디가 없으신가요? 지금 생성하세요.</a>
	<br></br> -->
<br>
</div>
</form>



</body>
</html>