<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoomFood | 회원리스트</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
<script type="text/javascript">
	$(function() {

		//////////////////////////////////
		$("#result").on("click", "#checkAll", function() {
			$(".check").prop("checked", $(this).prop("checked"));

		});

		///////////////////////////////////
		$("#result").on("click", ".check", function() {

			var result = true;
			$(".check").each(function() {
				if (!$(this).prop("checked")) {
					result = false;
				}
			});

			$("#checkAll").prop("checked", result);
		});

		///////////////////////////////////////////

		$("#result").on("click", "#del", function() {
			var ids = [];//빈 배열 생성
			$(".check").each(function() {
				if ($(this).prop("checked")) {
					ids.push($(this).attr("id"));

				}
			});

			var check = confirm("삭제하면 복구가 불가능합니다. 삭제하시겠습니까?");
			if(check){
				
				$.ajax({
					type : "get",
					url : "./memberDeletes",
					traditional : true,
					data : {
						ids : ids
					},
					success : function(data) {
					/* 	$.get("./memberLists", function(data) {
							$("#result").html(data);
						}); */
							alert("삭제되었습니다.");
							location.reload();
					}
				});
			}else{
				location.reload();
			}			
		});
	});
</script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	

	<div class="container">
		<div class="row">
		<div><img src="${pageContext.request.contextPath}/resources/images/memberinfoad.png"> </div> 
		<hr style=" border-top: 3px #80d6ff solid;">
			<form action="./memberList" class="form-inline">
				<div class="input-group input-group-sm col-xs-1">
					<select class="form-control" id="sel1" name="kind">
						<option value="mi">ID</option>
						<option value="mn">NAME</option>
						<option value="me">EMAIL</option>
						<option value="mp">PHONE</option>
					</select>
				</div>
				<div class="input-group input-group-sm col-xs-4">

					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<hr>
		<div id="result">
			<table class="table table-hover">
				<tr style=" background-color: #e6f5ff;">
					<td>ID</td>
					<td>NAME</td>
					<td>PHONE</td>
					<td>EMAIL</td>
					<td>회원 삭제 체크</td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>전체 체크 : <input type="checkbox" id="checkAll">
					</td>
				</tr>

				<c:forEach items="${list}" var="vo" varStatus="i">
					<tr>
						<td id="id${i.index}">${vo.id}</td>
						<td>${vo.name}</td>
						<td>${vo.phone}</td>
						<td>${vo.email}</td>
						<c:if test="${vo.id ne 'admin'}">
						<td><input type="checkbox" name="del" title="id${i.index}"
							id="${vo.id}" class="check"></td>
						</c:if>
						<c:if test="${vo.id eq 'admin'}">
						<td></td>
						</c:if>
					</tr>
				</c:forEach>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button class="btn btn-danger" id="del" style="width: 100px; height: 40px; background-image: url('${pageContext.request.contextPath}/resources/images/delete.png');"></button></td>
				</tr>

			</table>

			<div>
				<ul class="pagination">
					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./memberList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./memberList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./memberList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>