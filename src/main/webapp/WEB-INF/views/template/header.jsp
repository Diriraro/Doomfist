<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

	<div style="width: 1910px">
		<div class="jumbotron"
			style="height: 480px; background-size:cover;background-image: url('${pageContext.request.contextPath}/resources/images/food_3.jpg')">

			<div class="container text-center"></div>
		</div>
		<div style="width: 1910px;" align="center">

			<nav class="navbar"
				style="border-bottom: 1px solid #e9ebec; height: 65px;">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
							alt=""
							src="${pageContext.request.contextPath}/resources/images/doom_1.png"
							width="100px" ,height="50px"></a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">

							<li class="active">
								<div style="margin-top: 5.5px;" class="dropdown">
									<a href="${pageContext.request.contextPath}/">
										<button class="btn" id="drop" type="button"

											style="outline: 0; height: 65px;">
											&nbsp;<b>HOME</b>
										</button>
									</a>
								</div> <!-- <a href="${pageContext.request.contextPath}/">Home</a> -->
							</li>

							<li>
								<div style="margin-top: 7px;" class="dropdown">
									<a href="${pageContext.request.contextPath}/notice/noticeList">
										<button class="btn" id="drop" type="button"

											style="outline: 0; height: 65px;">
											&nbsp;<b>공지사항</b>
										</button>
									</a>
								</div> <!--<a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>-->
							</li>



							<c:if test="${not empty member}">
								<li>
									<div style="margin-top: 7px;" class="dropdown">
										<a href="${pageContext.request.contextPath}/qna/qnaJoin">
											<button class="btn" id="drop" type="button"

												style="border:0 none; outline:0px; height: 65px;">
												&nbsp;<b>맛집신청</b>
											</button>
										</a>
									</div>
								</li>
							</c:if>

							<c:if test="${empty member and empty sessionId}">
								<li>
									<div style="margin-top: 7px;" class="dropdown">

										<button class="btn notjoin" id="drop" type="button"
											style="height: 65px; border: 0 none; outline:0px; color: rgb(51,122,183);">
											&nbsp;<b>맛집신청</b>
										</button>
									</div> <!-- <a href="${pageContext.request.contextPath}/qna/qnaJoin">맛집신청</a>-->
								</li>
							</c:if>
							
							<c:if test="${not empty sessionId}">
								<li>
									<div style="margin-top: 7px;" class="dropdown">

										<button class="btn notnaver" id="drop" type="button"
											style="height: 65px; border: 0 none; outline:0px; color: rgb(51,122,183);">
											&nbsp;<b>맛집신청</b>
										</button>
									</div> <!-- <a href="${pageContext.request.contextPath}/qna/qnaJoin">맛집신청</a>-->
								</li>
							</c:if>

							<li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</li>
							<!-- 영호 추가 -->

							<!--<li><a><input type=button value="나의 신청 현황" onclick="javascript:openWin();"></a></li>
					 영호 추가 -->



							<li>
								<form class="form-inline" style="padding-top: 6px;"
									action="/s1/storeList/searchStore">
									<div style="margin-left: 35%; width: 100%;">
										<select style="height: 50px; margin-bottom: 50px;"
											class="form-control" id="sel1" name="kind">
											<option value="ln">식당이름</option>
											<option value="lk">카테고리</option>
											<option value="li">주소</option>
											<option value="lt">태그</option>
										</select>

										<fieldset style="margin-bottom: 4px;">
											<input type="search" placeholder="  맛집을 검색하세요!" name="search"
												style="background: #ffffff; border: 0 none; width: 350px; height: 50px; position: relative; padding: 0; display: inline-block; float: left;" />
											<button class="btn btn2" type="submit"
												style="width: 50px; height: 50px; position: relative; padding: 0; display: inline-block; float: left;">
												<i class="fa fa-search"></i>
											</button>
										</fieldset>
									</div>


									<!--  <input type="text" class="form-control" size="60%"
								placeholder="맛집을 검색하세요!"
								style="margin: 0px auto;" name="search">
							<button type="submit" class="btn btn-info"> 
							<span class="glyphicon glyphicon-search"></span>Search</button>
							-->


								</form>
							</li>




						</ul>
						<ul class="nav navbar-nav navbar-right">
							<c:if test="${empty member and empty sessionId}">

								<li>
									<div style="margin-top: 7px;" class="dropdown">
										<a href="${pageContext.request.contextPath}/member/memberJoin">

											<button class="btn" id="drop" type="button"
												style="height: 65px;">
												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>회원가입</b>
											</button>
										</a>
									</div> <!-- <a href="${pageContext.request.contextPath}/member/memberJoin"><span class="glyphicon glyphicon-user"></span>
							회원 가입</a>-->
								</li>

								<li>
									<div style="margin-top: 5.5px;" class="dropdown">
										<a
											href="${pageContext.request.contextPath}/member/memberLogin">

											<button class="btn" id="drop" type="button"
												style="height: 65px;">
												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>로그인</b>
											</button>
										</a>
									</div> <!-- <a href="${pageContext.request.contextPath}/member/memberLogin"><span class="glyphicon glyphicon-user"></span>
							로그인</a>-->
								</li>
							</c:if>

							<c:if test="${not empty member}">


								<!-- <li><a href="" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user dro"></span>
							회원 정보<b class="caret"></b></a></li>
							<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/member/memberPage">개인정보 수정</a> </li>
							</ul>-->

								<!-- admin 일떄 -->
								<c:if test="${member.id eq 'admin'}">
									<li>
										<div style="margin-top: 8px;" class="dropdown">
											<button class="btn dropdown-toggle" id="drop" type="button"

												data-toggle="dropdown" style="height: 65px;">
												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>관리자</b>
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a

													href="${pageContext.request.contextPath}/member/memberList">회원정보
														관리</a></li>
												<li class="divider"></li>
												<li><a
													href="${pageContext.request.contextPath}/qna/qnaList">
														맛집 신청 관리</a></li>
												<li class="divider"></li>
												<li><a
													href="${pageContext.request.contextPath}/storeList/storeListCheck">맛집
														리스트 관리</a></li>

											</ul>
										</div>
									</li>

								</c:if>

								<!-- 맴버일떄 -->
								<c:if test="${member.id ne 'admin'}">
									<li>
										<div style="margin-top: 8px;" class="dropdown">
											<button class="btn dropdown-toggle" id="drop" type="button"

												data-toggle="dropdown" style="height: 65px;">

												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>회원정보</b>
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu">

												<li><a
													href="${pageContext.request.contextPath}/member/memberPage">회원정보</a></li>

												<li class="divider"></li>
												<%-- <li><a href="${pageContext.request.contextPath}/payment/payReceipt?id=${sessionScope.member.id}">결제내역 </a></li> --%>
												<li><a href="/s1/payment/payReceipt?id=${member.id}"
													data-toggle="modal" data-target="#my2Modal">결제내역</a></li>
												<c:if test="${member.member_div eq 1}">
													<li class="divider"></li>
													<li><a href="/s1/qnacheck/Statuscheck?id=${member.id}"
														data-toggle="modal" data-target="#myModal">나의 신청 현황</a></li>
														<li><a href="/s1/seller/sellList">가게 주문 현황</a></li>

												</c:if>
												<li><a
													href="${pageContext.request.contextPath}/storeList/storePage">나의
														식당 </a></li>

											</ul>
										</div>
									</li>

								</c:if>
								<li>
									<div style="margin-top: 8px;" class="dropdown">
										<a
											href="${pageContext.request.contextPath}/member/memberLogout">

											<button class="btn" id="drop" type="button"
												style="height: 65px;">

												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>로그아웃</b>
											</button>
										</a>
									</div> <!-- <a href="${pageContext.request.contextPath}/member/memberLogout"><span class="glyphicon glyphicon-user"></span>
							로그아웃</a>-->
								</li>
							</c:if>
							<!-- 성민 추가 -->
							<c:if test="${not empty sessionId}">

								<li><a style="height: 52px; margin-top: 5px;"><img
										src="${pageContext.request.contextPath}/resources/images/naver.png">
										로그인 중</a></li>
								<!--  <li><a href="${pageContext.request.contextPath}/member/logout"><span class="glyphicon glyphicon-user"></span>
							로그아웃</a></li>-->

								<li>
									<div style="margin-top: 8px;" class="dropdown">
										<a href="${pageContext.request.contextPath}/member/logout">

											<button class="btn" id="drop" type="button"
												style="height: 65px;">
												<span class="glyphicon glyphicon-user"></span>&nbsp;<b>로그아웃</b>
											</button>
										</a>
									</div>

								</li>

							</c:if>
						</ul>
					</div>
				</div>
				<div id="loading">
					<img id="loading-image"
						style="display: flex; justify-content: center; height: 300px; width: 300px"
						src="${pageContext.request.contextPath}/resources/images/loading.gif"
						alt="Loading..." />
				</div>
			</nav>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<p>This is a large modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal2 -->
			<div class="modal fade" id="my2Modal" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						
					</div>
				</div>
			</div>
			
			
			<!-- Modal3 -->
			<div class="modal fade" id="my3Modal" role="dialog">
									
			</div>
		</div>
	</div>




	<!-- 추가 -->
	<!-- 영호 추가 -->
	<script type="text/javascript">

	
	setTimeout(() => {
		$(document).ready(function() {
		     $("#loading").hide();
		   });
			
		}, 800);
 
	$(".notjoin").click(function() {
		alert("로그인 후 이용해주세요")
	})
	
	$(".notnaver").click(function() {
		alert("네이버로 로그인 시 맛집신청은 제한됩니다.")
	})


	
	
	</script>
	
	
	
	<!-- 영호 추가 -->