<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<title>Doom Food | ${sessionScope.member.id}님의 식당</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>


</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container">
		<div class="row">
			<div style="font-size: 80px; height: 100px;">${sessionScope.member.id}&nbsp;<img src="${pageContext.request.contextPath}/resources/images/mystorelist.png"> </div>
			<hr style=" border-top: 3px #80d6ff solid;">
			<form class="form-inline" action="./storePage">
				<div class="input-group input-group-sm col-xs-2">
				</div>
				<div class="input-group input-group-sm col-xs-4">

				</div>
			</form>

			<div id="result">
			<table class="table table-hover" style="border-bottom: 1px #dfdfdf solid;">
				<tr style="background-color: #e6f5ff">
					<td width="100px">등록번호<td> <!-- st_key -->
					<td>식당이름</td> <!-- st_title -->
					<td hidden="" width="100px">아이디</td>	<!-- id -->
					<td>식당주소</td> <!-- st_address -->

				</tr>
				
				
				<c:forEach items="${liststore}" var="vo" varStatus="i">
					<tr>
						<td id="id${i.index}">${vo.st_key}</td>
						<td>
						<c:catch>
						<!-- for(int i=0; i<1 i++ -->
							<c:forEach begin="1" end="${vo.depth}" >
								--
							</c:forEach>
						</c:catch>
						</td>
						
						<td><a href="./storePageUpdate?st_key=${vo.st_key}">${vo.st_name}</a></td>
						<td hidden="">${vo.id}</td>
						<td>${vo.st_address}</td>
					</tr>
				</c:forEach>
				
			</table>
			</div>


		</div>
	</div>
	<br>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>