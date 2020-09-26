<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.id}님의 ${vo.qna_title} 맛집 신청서</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container">
		<div class="page-header text-center text-info">
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/images/apply_2.png">
			</div>
			<br></br> <br></br>
		</div>
		<div>
			<form action="./qnaJoin" id="form" name="form" method="POST"
				enctype="multipart/form-data">
				<br>
				<div
					style="width: 800px; border-top: 3px #80d6ff solid; margin-left: 150px;">
					<br> <br>

					<!-- 식당 이름 -->
					<div class="form-group" align="center">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>식당 이름</b>
						</div>
						<input type="text" style="width: 342px; display: inline-block;"
							class="form-control" id="qna_title" readonly="readonly"
							value="${vo.qna_title}" name="qna_title">
					</div>

					<hr style="width: 500px; margin-left: 150px;">

					<div class="form-group">
						<input type="hidden" class="form-control" style="width: 342px;"
							id="id" value="${sessionScope.member.id}"
							placeholder="Enter writer" name="id">
					</div>

					<!-- 식당 전화번호 -->
					<div class="form-group" align="center">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>전화 번호</b>
						</div>
						<input type="text" readonly="readonly"
							style="width: 342px; display: inline-block;" class="form-control"
							id="qna_phone" value="${vo.qna_phone}" name="qna_phone">
					</div>

					<hr style="width: 500px; margin-left: 150px;">

					<!-- 식당 주소 -->
					<div class="form-group" align="center">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>음식점 주소</b>
						</div>
						<input style="width: 342px; display: inline-block;" type="text"
							id="qna_contents" name="qna_contents" class="form-control"
							value="${vo.qna_contents}" required="true" readonly="readonly" />
						<br>
						<br>
						<div style="width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row"></div>
						<br>
					</div>


					<hr style="width: 500px; margin-left: 150px;">

					<!-- 식당 카테고리 -->

					<div align="center" class="form-group">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>식당 카테고리</b>
						</div>
						<input style="width: 150px; display: inline-block;" type="text"
							id="qna_kind" name="qna_kind" class="form-control"
							value="${vo.qna_kind}" required="true" readonly="readonly" />
						<div style="display: inline-block; width: 166px; height: 20px;"></div>
					</div>

					<hr style="width: 500px; margin-left: 150px;">

					<!-- 식당 태그 -->
					<div align="center" class="form-group"></div>
					<div align="center" class="form-group">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<img
								src="${pageContext.request.contextPath}/resources/images/tag.png"
								style="width: 30px" height="30px"> 태그
						</div>
						<div style="display: inline-block;">
							<input type="text" class="form-control" id="qna_tag"
								name="qna_tag" readonly="readonly" value="${vo.qna_tag}"
								style="width: 342px">
						</div>
					</div>

					<hr style="width: 500px; margin-left: 150px;">

					<!-- 메뉴 추가 -->
					<div align="center" class="form-group">
						<div
							style="background-color:; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<img
								src="${pageContext.request.contextPath}/resources/images/menu.png"
								style="width: 30px" height="30px"> 메뉴
						</div>

						<div
							style="width: 166px; margin-right: 10px; display: inline-block;">
							<strong><h4>메뉴 이름</h4></strong>
						</div>
						<div style="width: 166px; display: inline-block;">
							<strong><h4>메뉴 가격</h4></strong>
						</div>
					</div>


					<div style="margin-top: 15px; margin-bottom: 15px;" align="center">
						<c:forEach items="${vo_me}" var="vo_me">
							<input type="text" class="form-control" id="qm_menu"
								name="qm_menu" value="${vo_me.qm_menu}"
								style="margin-right: 10px; margin-left: 165px; margin-bottom: 15px; display: inline-block; width: 166px"
								readonly="readonly">
							<input type="text" numberOnly id="qm_price" class="form-control"
								name="qm_price" class="qm_price" value="${vo_me.qm_price}"
								style="width: 166px; display: inline-block;" readonly="readonly">
							<br>
						</c:forEach>
					</div>

					<hr style="width: 500px; margin-left: 150px;">

					<!-- 음식 사진 추가 -->
					<div align="center" class="form-group">
						<div style="width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row">
							<img
								src="${pageContext.request.contextPath}/resources/images/fileimg.png"
								style="width: 30px" height="30px"> 식당 사진
						</div>

					</div>  
     
					<div align="center" class="form-group">
						<c:forEach items="${vo_fi}" var="vo_fi">
						<div style="width: 150px; border-bottom: 2px white solid; margin-right: 10px;" scope="row">
							<img src="../resources/qna_images/${vo_fi.qf_filename}"
								alt="${vo_fi.qf_oriname}"
								style="max-height: 300px; max-width: 300px">
								
						</div>
						</c:forEach>
					</div>


					<br>
					<div align="center">
						<a href="../qnacheck/qnaOk?qna_storekey=${vo.qna_storekey}"
							style="width: 100px; height: 40px; margin-left:30px; display:inline-block; background-image: url('${pageContext.request.contextPath}/resources/images/allow.png')"></a>
						<a href="../qnacheck/qnaNo?qna_storekey=${vo.qna_storekey}"
							style="width: 100px; height: 40px; display:inline-block; background-image: url('${pageContext.request.contextPath}/resources/images/refuse.png')"></a>
						<br>
						<br>
						<br>
					</div>
				</div>
			</form>
		</div>

	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>