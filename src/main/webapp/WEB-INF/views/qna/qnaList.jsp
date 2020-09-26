<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoomFood | 맛집 신청 리스트</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="container">
		<div class="row">
		<div><img src="${pageContext.request.contextPath}/resources/images/storeappli.png"> </div> 
			<hr style="width: 1110px; border-top: 3px #80d6ff solid;">
			<form class="form-inline" action="./qnaList">
					<select class="form-control" id="sel1" name="kind">
						<option value="bt">식당이름</option>
						<option value="bc">내용</option>
						<option value="bw">아이디</option>
						
					</select>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
			<br>


			<table class="table table-hover">
				<tr style=" background-color: #e6f5ff;">
					<td>신청번호<td> <!-- qna_storekey -->
					<td>식당이름</td> <!-- qna_title -->
					<td>아이디</td>	<!-- id -->
					<td>식당주소</td> <!-- qna contents -->
					<td>날짜</td> <!-- qna_date -->
		
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.qna_storekey}</td>
						
						<td>
						<c:catch>
						<!-- for(int i=0; i<1 i++ -->
							<c:forEach begin="1" end="${vo.depth}" >
								--
							</c:forEach>
						</c:catch>
						</td>
						<td><a href="./qnaSelect?qna_storekey=${vo.qna_storekey}">${vo.qna_title}</a></td>
						<td>${vo.id}</td>
						<td>${vo.qna_contents}</td>
						<td>${vo.qna_date}</td>
					</tr>
				</c:forEach>

			</table>

			<div>
				<ul class="pagination">
					<c:if test="${pager.curBlock gt 1}">
						<li><a
							href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li><a
							href="./qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<li><a
							href="./qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
					</c:if>
				</ul>
			</div>

		<%-- 	<div>
				<a href="./${board}Write" class="btn btn-danger">WRITE</a>
				
				<c:catch>
				<c:choose>
					<c:when test="${board eq 'notice'}">
						<c:if test="${member.id eq 'admin'}">
							<div>
								<a href="./${board}Write" class="btn btn-danger">WRITE</a>
							</div>
						</c:if>
						</c:when>
					<c:otherwise>
						<c:if test="${not empty member}">
							<div>
								<a href="./${board}Write" class="btn btn-danger">WRITE</a>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
				</c:catch>
			</div>
 --%>
		</div>
	</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>