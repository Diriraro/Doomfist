<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.st_name} 리뷰 작성</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>
<div class="container">

		<form action="./storeReviewWrite" id="frm"  method="POST" enctype="multipart/form-data">
		
			<div class="form-group">
				 <input type="hidden"class="form-control" id="id" value="${sessionScope.member.id}"  placeholder="Enter writer"
					name="id" >
			</div>	
			
			<div class="form-group" style=" background-color: white">
				<label for="re_rating" style="font-size: 40px;">${vo.st_name} 어떠셨나요?</label>
				<p></p>
				<hr style=" border-top: 3px #80d6ff solid;"> 
				<input type="radio" class="5p" name="re_rating" value="5" checked="checked"><!-- #e6f5ff -->
				<img alt="" src="${pageContext.request.contextPath}/resources/images/5point.png" class=""> <span class="5p">맛있어요!</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="3p" name="re_rating" value="3">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/3point.png" class=""> <span class="3p">괜찮아요!</span>&nbsp;&nbsp;&nbsp;
				
				<input type="radio" class="1p" name="re_rating" value="1">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/1point.png" class=""> <span class="1p">별로...</span>&nbsp;&nbsp;&nbsp;
				<hr>
			</div>			
			
			<div class="form-group">
				<label for="re_contents" style="font-size: large;">식당을 리뷰해 주세요!</label> <textarea class="form-control"
				row="20" id="re_contents" name="re_contents"></textarea>
			</div>
			
			<div class="form-group">
			
				<input type="hidden" class="form-control" id="st_key" value="${vo.st_key}"	name="st_key" >
			</div>	
			
			<input type="button" style="width: 120px; height: 38px; background-image: url('${pageContext.request.contextPath}/resources/images/pic_in.png');" id="add" class="btn btn-default" >
			
			<div id="file" >
			<br>	
			</div>
			<hr>
			 
			<button type="button" style="width: 120px; height: 38px; background-image: url('${pageContext.request.contextPath}/resources/images/rw_suc.png');" id="btn" class="btn btn-default"></button>
		</form>
	</div>
	<br><br>
<script type="text/javascript" src="../resources/boardForm2.js">
</script>	


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>