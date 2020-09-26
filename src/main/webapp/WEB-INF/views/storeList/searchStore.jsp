<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 음식점 검색 </title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container" id="result">
		<div class="row" >
		<!-- getList 들어가는공간 -->
		</div>	
	</div>
	
	<!-- 검색어에 맞는 결과값이 나오지 않을경우 사용할 input -->
	<input type="hidden" id="ser" value="${listt}">

	<div id="dv" align="center" style="margin-top: 20px; margin-bottom: 20px; display: flex; justify-content: center; height: 50px;">
		<input class="btn btn-info" type="button" id="more" value="더보기" title="${last}" style="width: 1115px">
		<input class="btn btn-info" type="hidden" id="none" value="검색어에 맞는 식당이 없습니다." style="width: 1115px" disabled="disabled">
	</div>
	
		<script type="text/javascript">
		var count=1;
		var k = '${param.kind}';
		var s='${param.search}';
		var check=$("#ser").val();
		
		function getList(curPage, kind, search) {
			$.get("getList?curPage="+curPage+"&kind="+kind+"&search="+search, function(result) {
				$("#result").append(result);
			});	
		}
		
		getList(count, k, s);
		
		if(check==0){
			$("#more").attr("type", "hidden");
			$("#none").attr("type", "text");
		//	$("#dv").removeAttr("style");
		// 검색어에 맞는 식당이 없을경우 출력
		}
		
		if(count>$("#more").attr("title") || count==$("#more").attr("title")){
			$("#more").attr("type", "hidden");
			$("#dv").removeAttr("style");
			//처음 검색한 값이 9개 이하일경우 '더보기' 출력안하게 하기
		}
		
		$("#more").click(function() {
			
			
			if(count>$("#more").attr("title")){
				$("#more").attr("type", "hidden");
				$("#dv").removeAttr("style");
				//더보기를 누른 횟수가 검색했을때 총 페이지 보다 많으면 더보기 출력 안하게 바꾸기
			}else if (count==$("#more").attr("title")){
			count++;

			getList(count, k, s);
			$("#more").attr("type", "hidden");
			$("#dv").removeAttr("style");
			// 더보기를 누른 횟수가 검색했을때 총 페이지와 같으면 더보기출력 안하기
			}else{
				count++;
				getList(count, k, s);
			}
		});	
		
		
		</script>
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>