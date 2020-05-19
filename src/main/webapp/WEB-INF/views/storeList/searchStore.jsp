<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
	<div class="row" id="result">
	
	</div>	
	</div>
		<div align="center" style="margin-top: 20px; margin-bottom: 20px; background-color:lightgray; display: flex; justify-content: center; height: 50px;">
			<button id="more" title="${last}">더보기</button>
		</div>
		
		<script type="text/javascript">
		var count=1;
		function getList(curPage) {
			$.get("getList?curPage="+curPage, function(result) {
				$("#result").append(result);
			});	
		}
		
		getList(count);		
		
		$("#more").click(function() {
			count++;
			console.log($("#more").attr("title"));
			if(count <= $("#more").attr("title")){
				getList(count);
			}else{
				$("#more").remove
			}
		});	
		
		</script>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>