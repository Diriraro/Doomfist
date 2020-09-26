<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 > DoomFood | 회원정보</title>   
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>

	<div class="container">
		<div class="row">
		  <div class="page-header text-center text-info">
		   <div><img src="${pageContext.request.contextPath}/resources/images/memupdate.png"> </div> 
    <br></br>
    <br></br>
  </div>
			<form class="form-horizontal" action="./memberUpdate" method="post">
			<br>
	<div  style="width: 560px; border-top: 3px #80d6ff solid; border-left:1px #dfdfdf solid;border-right:1px #dfdfdf solid; border-bottom:1px #dfdfdf solid; margin-left:300px; ">
	<br>
	<div align="center"><img src="${pageContext.request.contextPath}/resources/images/mypage.png"> </div> 
	<br>	
<table class="text-info Shadow" style="width: 500px;  margin-left:30px;">
   <tbody>
    <tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;아이디 : </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 70px;">&nbsp;<input style="border: 0 none;" type="text" id="id" readonly="readonly" value="${member.id}" name="id"> 아이디는 변경불가합니다<td>
		<hr></hr>
    </tr>

	<tr>
      	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;E-Mail : </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 70px;">&nbsp;<input  value="${member.email}" type="email"  id="email"  name="email"><td>
    </tr>

	<tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;이름 : </th>
     	<td style="border-bottom: 1px #dfdfdf solid; height: 70px;">&nbsp;<input  value="${member.name}" type="text"  id="name"  name="name"><td>
    </tr>

	<tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;연락처 : </th>
     	<td style="border-bottom: 1px #dfdfdf solid; height: 70px;">&nbsp;<input  value="${member.phone}" type="text"  id="phone"  name="phone"><td>
    </tr>
    </tbody>
    </table>
    <br>

    </div>
    <br>

				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="image" id="upbtn" style="outline: 0; margin-left: 300px; " src="${pageContext.request.contextPath}/resources/images/upsuc.png">
					</div>
				</div>
			</form>
		</div>
	</div>


<footer style="margin-top: 4.2%">
	<c:import url="../template/footer.jsp" ></c:import>
</footer>




</body>
</html>