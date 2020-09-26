<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<title>${vo.st_name}| Store Information</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>

	<div class="container">

		<p class="gap">
			<br>
		</p>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators //현재 사용 안함-->
			<ol class="carousel-indicators">
				<c:forEach items="${stfile}" var="stfile" varStatus="status">

					<c:if test="${status.index eq 0}">
						<li data-target="#myCarousel" data-slide-to="${status.index}"
							class="active"></li>
					</c:if>
					<c:if test="${status.index ne 0}">
						<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
					</c:if>
				</c:forEach>

			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<c:forEach items="${stfile}" var="stfile" varStatus="status">

					<c:if test="${status.count eq 1}">
						<div class="item active">
							<img src="../resources/qna_images/${stfile.stfile_name}"
								alt="${stfile.stfile_oriname}"
								style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 1140px; height: 600px;">
							<div class="carousel-caption">
								<p></p>
							</div>
						</div>
					</c:if>

					<c:if test="${status.count ne 1}">
						<div class="item">
							<img src="../resources/qna_images/${stfile.stfile_name}"
								alt="${stfile.stfile_oriname}"
								style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 1140px; height: 600px;">
							<div class="carousel-caption">
								<p></p>
							</div>
						</div>
					</c:if>

				</c:forEach>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div>
		<br>
			<div style="display: inline-block;">
				<h1>
					<b>${vo.st_name}</b>
				</h1>
			</div>
			<c:if test="${avg > 0}">
				<div style="display: inline-block;">
					<h2 style="color: #85e0e0">${avg}</h2>
				</div>
			</c:if>
		</div>
		<p class="gap">
			<br>
		</p>

		<div class="panel panel-default">
			<div class="panel-body">
				<div id="map"
					style="width: 250px; height: 250px; display: inline-block; float: right;"
					align="center"></div>
				<ul class="list"
					style="list-style-type: none; font-size: large; font: bold;">
					<li><h1>
					<img src="${pageContext.request.contextPath}/resources/images/selectinfo.png"> 
						</h1></li>
						<hr style="width: 800px; border-top: 3px #80d6ff solid;">
					<li>
					<br>
					<img alt=""
						src="${pageContext.request.contextPath}/resources/images/location.png"
						width="30px" height="30px"> 식당 주소 : ${vo.st_address} <input
						type="hidden" id="address" value="${vo.st_address}"></li>
						<br>
					<li><img alt=""
						src="${pageContext.request.contextPath}/resources/images/tel.png"
						width="30px" height="30px"> ${vo.st_phone}</li>
					<li style="visibility: hidden;">음식 종류 : ${vo.st_kind}</li>

					<c:if test="${not empty vo.st_tag}">
						<li>태그 :${vo.st_tag}</li>
					</c:if>

					<hr>

					<div>      

						<ul class="list" style="list-style-type: none; width: 1000px;">
							<br>
							<li style="align-self: center;"><h1>

								

							<img src="${pageContext.request.contextPath}/resources/images/selectmenu.png"> 
								</h1></li>
							<hr style="width: 800px; border-top: 3px #80d6ff solid;">

							<c:forEach items="${vo_sm}" var="vo">
								<li><div
										style="float: left; display: inline-block; width: 300px; overflow: hidden;">
										${vo.sm_menu}</div>
									<hr
										style="width: 500px; display: inline-block; margin-left: 50px; overflow: hidden;">
									<div style="float: right; display: inline-block;">
										${vo.sm_price} 원</div> <br>
							</c:forEach>
							<li align="right" style="margin-right: 40px;"></li>
						</ul>
						<div style="float: right;">
							<a
								href="../payment/payFirstSelect?st_key=${vo.st_key}&pf_stname=${vo.st_name}&id=${sessionScope.member.id}">
								<img
								src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"
								alt="kpay">
							</a>
						</div>
					</div>

				</ul>
			</div>
		</div>

		<p class="gap">
			<br>
		</p>


		<p class="gap">
			<br>
		</p>

		<div class="panel panel-default">
			<div align="center">
				<h2>
					<img src="${pageContext.request.contextPath}/resources/images/review.png"> 
					<hr style=" border-top: 3px #80d6ff solid;">
					<!-- 티몬체로 추가 -->
				</h2>
			</div>
			<!-- <form action="./storeReviewWrite" method="get"> -->
			<div class="panel-body" align="center">
				<table class="table">

					<c:forEach items="${vor}" var="vor">
						<tr style="vertical-align: top">
							<td style="width: 200px;"><img
								src="${pageContext.request.contextPath}/resources/images/user.png"
								style="width: 50px; height: 50px;"> <br> ${vor.id}</td>
							<td>${vor.re_date}<br>
								<p>${vor.re_contents}</p><hr> <c:forEach items="${vof1}"
									var="vof11" varStatus="status">
									<c:forEach items="${vof11}" var="vof2" varStatus="status2">
										<c:if test="${vor.re_num eq vof2.re_num}">
											<img alt="${vof2.refile_oriname}"
												src="../resources/review_images/${vof2.refile_name}"
												style="cursor: pointer; width: 250px; height: 250px; max-height: 150px; max-width: 150px; float: left; margin-right: 15px; margin-top: 15px;"
												onclick="doImgPop('../resources/review_images/${vof2.refile_name}')">
										</c:if>
									</c:forEach>
								</c:forEach>
							</td>

							<td align="right"><span><img alt=""
									src="${pageContext.request.contextPath}/resources/images/${vor.re_rating}point.png">
									<br> <c:if test="${vor.re_rating eq 5}">	맛있다!</c:if> <c:if
										test="${vor.re_rating eq 3}">	괜찮다.</c:if> <c:if
										test="${vor.re_rating eq 1}">	별로...</c:if> <br> <c:if
										test="${sessionScope.member.id eq 'admin' or sessionScope.member.id eq vor.id}">
										<br>
										<input type="button" class="btn btn-danger" style=" width: 100px; height: 40px; background-image: url('${pageContext.request.contextPath}/resources/images/delete.png');"  onclick="location.href='./storeReviewDelete?st_key=${vo.st_key}&re_num=${vor.re_num}'">
									
									</c:if> </span></td>
						</tr>

						<tr style="height: 10px;"></tr>
					</c:forEach>


					<tr>

					</tr>


				</table>
				<hr>
				<!-- 로그인을 안한사람 / 관리자계정으로 로그인한사람 / 식당주인 / 식당에서 구매를 하지 않은사람은 리뷰 작성 버튼 안보임 -->
				<c:forEach items="${scvo}" var="scvo">
				<c:if
					test="${not empty sessionScope.member.id and sessionScope.member.id ne 'admin' and sessionScope.member.id ne vo.id
							and sessionScope.member.id eq scvo.selb_id}">
					
					<a href="./storeReviewWrite?st_key=${vo.st_key}"> <input type="button" style=" width: 120px; height: 38px; background-image: url('${pageContext.request.contextPath}/resources/images/review_write.png');" class="btn btn-info" >
					</a>
					
				</c:if>
				</c:forEach>

			</div>
			<!-- </form> -->
		</div>


		<!-- container 끝 -->
	</div>

	<script type="text/javascript">
		function doImgPop(img) {
			img1 = new Image();
			img1.src = (img);
			imgControll(img);
		}

		function imgControll(img) {
			if ((img1.width != 0) && (img1.height != 0)) {
				viewImage(img);
			} else {
				controller = "imgControll('" + img + "')";
				intervalID = setTimeout(controller, 20);
			}
		}

		function viewImage(img) {
			W = img1.width;
			H = img1.height;
			O = "width=" + W + ",height=" + H + ",scrollbars=yes";
			imgWin = window.open("", "", O);
			imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
			imgWin.document.write("<body topmargin=0 leftmargin=0>");
			imgWin.document
					.write("<img src="
							+ img
							+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
			imgWin.document.close();
		}
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a912020624eca9979dbed7aaa0e913b&libraries=services"></script>
	<script>
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 4
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${vo.st_address}',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.st_name}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

		function displayMarker(place) {

			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			kakao.maps.event.addListener(marker, 'click', function() {
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	</script>


	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>