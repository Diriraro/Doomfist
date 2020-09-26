<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 식당수정</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container">
		<div class="page-header text-center text-info">
			<hr>
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/images/storeinfo.png">
			</div>
			<br>

		</div>

		<div>
			<div>
				<form class="form-horizontal" action="./storePageUpdate" id="form"
					name="form" method="POST" enctype="multipart/form-data">
					
					<div style="width: 800px; border-top: 3px #80d6ff solid; margin-left:150px;">
					<br>
			<br>
					
					<input type="hidden" id="st_key" name="st_key"
						value="${liststore.st_key}">

					<div class="form-group" align="center">
						<div
							style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>식당 이름</b>
						</div>
						<input type="text" style="width: 342px; display: inline-block;"
							class="form-control" id="st_name" placeholder="식당이름"
							value="${liststore.st_name}" name="st_name">
					</div>
					
					<hr style="width: 500px; margin-left: 150px;">

					<div class="form-group">
						<input type="hidden" class="form-control" style="width: 342px;"
							id="id" value="${sessionScope.member.id}"
							placeholder="Enter writer" name="id">
					</div>

					<div class="form-group" align="center">
						<div
							style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>전화 번호</b>
						</div>
						<input type="text" numberOnly
							style="width: 342px; display: inline-block;" class="form-control"
							id="st_phone" placeholder="전화 번호는 -을 뺴고 입력해 주세요"
							value="${liststore.st_phone}" name="st_phone">
					</div>
					<hr style="width: 500px; margin-left: 150px;">

					<div class="form-group" align="center">
						<div
							style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>음식점 주소</b>
						</div>
						<input style="width: 342px; display: inline-block;" type="text"
							id="st_address" name="st_address" class="form-control"
							value="${liststore.st_address}" required="true"
							readonly="readonly" /> <br>
						<br>
						<div
							style="width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row"></div>
						<button type="button" class="btn btn-warning active"
							onClick="goPopup()" style="width: 342px;">
							<span class="glyphicon glyphicon-search"></span>주소검색
						</button>

						<br>
					</div>


					<hr style="width: 500px; margin-left: 150px;">
					<div align="center" class="form-group">
						<div
							style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<b>식당 카테고리</b>
						</div>
						<select id="st_kind" name="st_kind"
							style="width: 180px; display: inline-block;" class="form-control">
							<option>${liststore.st_kind}</option>
							<option>한식</option>
							<option>분식</option>
							<option>카페,디저트</option>
							<option>돈까스,회,일식</option>
							<option>치킨</option>
							<option>피자</option>
							<option>아시안,양식</option>
							<option>중국집</option>
							<option>족발,보쌈</option>
							<option>야식</option>
							<option>찜,탕</option>
							<option>도시락</option>
							<option>패스트 푸드</option>
						</select>
						<div style="display: inline-block; width: 166px; height: 20px;"></div>
					</div>
					<hr style="width: 500px; margin-left: 150px;">

					<!-- 태그 시작 -->
					<div align="center" class="form-group">
						<div style="background-color: #e6f5ff; width: 492px;">태그는
							한줄로, 각 태그 앞에 ' # ' , 태그 뒤에 ' '(공백) 를 붙여주세요</div>
					</div>


					<div align="center" class="form-group">
						<div
							style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;"
							scope="row">
							<img
								src="${pageContext.request.contextPath}/resources/images/tag.png"
								style="width: 30px" height="30px"> 태그
						</div>
						<div style="display: inline-block;">
							<input type="text" id="st_tag" name="st_tag" class="form-control"
								placeholder="#태그  #태그 ..." value="${liststore.st_tag}"
								style="width: 342px">
						</div>
					</div>
					<hr style="width: 500px; margin-left: 150px;">
					<!-- 태그 끝 -->     
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10"> 
							<button style="margin-left: 29.5%; width: 140px; height: 40px; background-image: url('${pageContext.request.contextPath}/resources/images/update_icon.png');" type="submit"
								class="btn btn-default"></button>
						</div>
					</div>
					<br>
					</div>
				</form>
			</div>
		</div>
		<hr>
		<div style="margin-left: 35%;">
			<img
				src="${pageContext.request.contextPath}/resources/images/menuinfo_1.png">
		</div>
		<hr>
					<div style="width: 800px; border-top: 3px #80d6ff solid; margin-left:150px;">
					<br>
			<br>
		<div>

			<!-- 메뉴 추가 -->
			<div align="center">
				<img
					src="${pageContext.request.contextPath}/resources/images/menu.png"
					style="width: 50px" height="50px">
					
				<!--<input type="button" id="addmenu" class="btn btn-info active" value="메뉴 추가하기"> -->
				<a href="" onclick="javascript:openWin2();">메뉴 추가</a> &nbsp; &nbsp;
				<a href="" onclick="javascript:openWin();">메뉴 수정</a>
			</div>


 
			<c:forEach items="${listmenu}" var="vo">
				<form class="form-horizontal" action="./storeMenuDelete" id="form"
					name="form" method="POST" enctype="multipart/form-data">
					<div class="menuu2" style="margin-top: 15px; margin-bottom: 15px;" align="center">
						<input type="hidden" id="st_key" name="st_key" value="${vo.st_key}"> 
						<input type="hidden" id="sm_key" name="sm_key" value="${vo.sm_key}">
						<input value="${vo.sm_menu}" title="${a}" type="text" id="sm_menu" name="sm_menu" disabled="disabled" style="margin-right: 30px; display: inline-block;" class="form-group">
						<input value="${vo.sm_price}" type="text" id="sm_price" name="sm_price" class="sm_price form-group" disabled="disabled" style="display: inline-block; margin-right: 15px;">
						<button type="submit" class="btn btn-default" style="width: 54px; height: 34px; background-image: url('${pageContext.request.contextPath}/resources/images/delete_icon.png')"></button>
					</div>
				</form>
			</c:forEach>

			<div id="menuu" align="center"></div>
		</div>
		<br></br>


		<!-- 음신 사진 추가 
			<div align="center">
				<img src="${pageContext.request.contextPath}/resources/images/fileimg.png" style="width: 50px" height="50px"> 음식 사진 추가 
				<input type="button" id="add" class="btn btn-info active" value="음식사진 추가"> 
			</div> 
			<div align="center"> 
				<input type="file" class="form-control files" name="files" style="width: 300px; display: inline-block; margin-bottom: 15px;">
			</div>
			<div id="file" align="center"></div>-->
		<div align="center"> 
			<a href="http://localhost:8080/s1/storeList/storePage"><button
					type="button" class="btn btn-default" style="width: 140px; height: 40px;  background-image: url('${pageContext.request.contextPath}/resources/images/list_icon.png')"></button></a>
					<br><br> 
		</div>
	</div>
	<input type="hidden" id="a" value="${a}">
</div>     	


	<script type="text/javascript">
		function openWin() {
			window
					.open(
							"http://localhost:8080/s1/storeList/storeMenuUpdate?st_key=${liststore.st_key}",
							"메뉴수정",
							"width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes")

		}

		function openWin2() {
			window
					.open(
							"http://localhost:8080/s1/storeList/storeMenuInsert?st_key=${liststore.st_key}",
							"메뉴추가",
							"width=600, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes")

		}

		var countm = 1 + $("#a").attr("value") * 1;

		function setCountm(cc) {
			countm = countm + cc;

		}

		$("#menuu").on("click", ".remove", function() {
			$(this).parent().remove();
			countm--;
		});

		$(".menuu2").on("click", ".remove", function() {
			$(this).parent().remove();
			countm--;
		});

		$("#addmenu")
				.click(
						function() {
							if (countm < 11) {
								$("#menuu")
										.append(
												'<div style="margin-top: 15px; margin-bottom: 15px;"> <input type="text" id="sm_menu" name="sm_menu" placeholder="메뉴를 입력해주세요" style="margin-right: 15px; margin-left:15px"> <input type="text" id="sm_price" name="sm_price" class="sm_price" placeholder="가격을 입력해주세요"> <i class="glyphicon glyphicon-remove remove"></i> </div>');

								countm++;
							} else {
								alert("메뉴등록은 최대 10개 까지입니다.");
							}

						});

		var countt = 1;
		function setCountt(tt) {
			countt = countt + tt;
		}

		$("#tagg").on("click", ".removet", function() {
			$(this).parent().remove();
			countt--;
		});

		$("#addtag")
				.click(
						function() {
							if (countt < 10) {
								
								$("#tagg")
										.append(
												'<div style="margin-top: 15px; margin-bottom: 15px;"> <input type="text" id="tag_name" name="tag_name" placeholder="태그를 입력해주세요" style="margin-right: 15px; margin-left:15px"> <i class="glyphicon glyphicon-remove removet"></i> </div>');

								countt++;
							} else {
								alert("태그등록은 최대 10개 까지입니다.")
							}

						});

		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("../popup/jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			window.document.form.st_address.value = roadFullAddr;

		}
	</script>

	<script type="text/javascript"
		src="../resources/boardForm.js?v=<%=System.currentTimeMillis()%>">
		
	</script>   
	
		<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>