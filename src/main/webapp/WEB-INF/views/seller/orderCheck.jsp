<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${stvo.st_name} 주문 현황</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container" style="width: 90%">
		<div class="row">
			<h1>${stvo.st_name} 주문 현황</h1>
			<input type="hidden" value="${stvo.st_key}" id="st_key">
			<div>
			<form action="./orderCheck" method="post">
			
			<table class="table table-hover">
				<tr>
					
					<td>구매자아이디<td> 
					<td>구매자 전화번호</td> 
					<td>주문한 음식</td>	
					<td>주문 날짜</td>
					<td>배달할 주소</td>
					<td>배달 현황</td>
					<td>배달 완료 버튼</td>
					<td>배달 취소 버튼</td>
					<td>완료/취소 주문 삭제</td>

				</tr>
				
				<tr> <!-- 칸맞추기 -->
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
				
				<c:forEach items="${se_list}" var="vo" varStatus="i">
					
					<tr>
						<td id="id${i.index}">${vo.selb_id}</td>
						<td>
						<c:catch>
						<!-- for(int i=0; i<1 i++ -->
							<c:forEach begin="1" end="${vo.depth}" >
								--
							</c:forEach>
						</c:catch>
						</td>
						<td>${vo.selb_phone}</td>
						<td>${vo.sel_meco}</td>
						<td>${vo.sel_date}</td>
						<td>${vo.sel_address}</td>
						
						<!-- 오늘 이전에 들어온 주문내역들 중 삭제되지 않은 주문내역 -->
						<c:if test="${vo.sel_okcheck eq 0}">
							<c:if test="${vo.sel_date ne today}">	
								<td>오늘 들어온 주문이 아닙니다!</td>
								<td>구매자에게 배달이 되었는지</td>
								<td>전화하여 확인해주세요.</td>
								<td>
								<input type="button" class="btn btn-info sel_del" id="${vo.sel_key}"
								style="background: url('${pageContext.request.contextPath}/resources/images/listDel.png');no-repeat 0 0; width: 100px; height: 40px;">
								</td>
							</c:if>
						</c:if>
						
						<c:if test="${vo.sel_okcheck eq 1}">
							<td><img src="${pageContext.request.contextPath}/resources/images/deliOK.png"></td>
							<td></td>
							<td></td>
							<td>
							<input type="button" class="btn btn-info sel_del" id="${vo.sel_key}"
							style="background: url('${pageContext.request.contextPath}/resources/images/listDel.png');no-repeat 0 0; width: 100px; height: 40px;">
							</td>
						</c:if>
						<c:if test="${vo.sel_okcheck eq 2}">
							<td><img src="${pageContext.request.contextPath}/resources/images/deliNO.png"></td>
							<td></td>
							<td></td>
							<td>
							<input type="button" class="btn btn-info sel_del" id="${vo.sel_key}" 
							style="background: url('${pageContext.request.contextPath}/resources/images/listDel.png') no-repeat 0 0; width: 100px; height: 40px;">
							
							</td>
						</c:if>
					
						<c:if test="${vo.sel_okcheck eq 0}">
							<c:if test="${vo.sel_date eq today}">		<!-- 오늘 들어온 주문만  -->
								<td></td>
								<td><input type="hidden" name="sel_key" value="${vo.sel_key}" id="sel_key">
								<input type="hidden" name="st_key" value="${vo.st_key}">
								<input type="hidden" name="selb_id" value="${vo.selb_id}">
								<button name="sel_okcheck"  value="1"><img src="${pageContext.request.contextPath}/resources/images/OKdeli.png"></button></td>
								<td><button name="sel_okcheck" value="2"><img src="${pageContext.request.contextPath}/resources/images/NOdeli.png"></button></td>
								<td></td>
							</c:if>
						</c:if>
					
					
					</tr>
				</c:forEach>
				
			</table>
			</form>
			</div>

			
		</div>
	</div>
	<script type="text/javascript">

		$(".sel_del").click(function() {
			var result = confirm("삭제하면 복구가 불가능합니다. 삭제하시겠습니까?");
			if(result){
				location.href="./orderDel?sel_key="+$(this).attr("id")+"&st_key="+$("#st_key").attr("value");
			}
		});
	</script>
	<div style="margin-top: 500px;">
	<c:import url="../template/footer.jsp"></c:import>
	</div>
</body>
</html>