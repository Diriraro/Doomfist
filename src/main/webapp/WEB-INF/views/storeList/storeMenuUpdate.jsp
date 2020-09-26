<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 식당수정 > 메뉴수정</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<script type="text/javascript">


function Close_Event(){
    opener.document.location.reload();
}

</script>

<body onunload="Close_Event();">
<img alt="" src="${pageContext.request.contextPath}/resources/images/findimage.png">
	<div class="container">
		  <div class="page-header text-center text-info">

			
		
			
			
		
			
			
			
			<!-- 메뉴 추가 -->
				<div style="background-color: #e6f5ff; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row" align="center">
				<img src="${pageContext.request.contextPath}/resources/images/menu.png" style="width: 30px" height="30px"> 메뉴</div>
			
			
			    
			<c:forEach items="${listmenu}" var="vo">
			<form class="form-horizontal" action="./storeMenuUpdate" id="form" name="form" method="POST">
			<input type="hidden" id="st_key" name="st_key" value="${liststore.st_key}">
			<div class="menuu2" style="margin-top: 15px; margin-bottom: 15px;" align="center">
			<input type="hidden" id="sm_key" name="sm_key" value="${vo.sm_key}">
				<input value="${vo.sm_menu}" title="${a}"type="text" id="sm_menu" name="sm_menu" class="form-control" placeholder="메뉴를 입력해주세요" style="margin-right: 15px; width: 200px; display: inline-block;"> 
				<input value="${vo.sm_price}" type="text" id="sm_price" name="sm_price" class="sm_price form-control" placeholder="가격을 입력해주세요" style="width: 200px; display: inline-block;">
			
					<br><br>
				<button type="submit" id="btn" class="btn btn-default active" style="width: 126px; height: 49px;  background-image: url('${pageContext.request.contextPath}/resources/images/qna_submit.png')"></button>
			</div>
			</form>
			</c:forEach>
			
			
			 
			 
			
			
			
			<div id="menuu" align="center">
			

			
			<!-- 음신 사진 추가 
			<div align="center">
				<img src="${pageContext.request.contextPath}/resources/images/fileimg.png" style="width: 50px" height="50px"> 음식 사진 추가 
				<input type="button" id="add" class="btn btn-info active" value="음식사진 추가"> 
			</div> 
			<div align="center"> 
				<input type="file" class="form-control files" name="files" style="width: 300px; display: inline-block; margin-bottom: 15px;"> 
			</div>
			<div id="file" align="center"></div>-->	


			<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						
					</div>
				</div>
				</div>
				
				</div>
			
		
	</div>
	
	
	<input type="hidden" id="a" value="${a}">

	<script type="text/javascript">


	
	</script>
	
	<script type="text/javascript" src="../resources/boardForm.js?v=<%=System.currentTimeMillis() %>">
		
	</script>
</body >
</html>