<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.pf_stname}</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>

</head>
<!-- 뒤로가기  -->
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>


<!-- <body> -->
<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">

	<c:import url="../template/header_sub.jsp"></c:import>
	<!-- 결제 준비 페이지  -->
	<div class="">
		<div class="panel-body"
			style="text-align: center; font-size: 30px; border: 0 none;">
			<ul class="list" style="list-style-type: none;">
				<%-- <li>식당 이름 : ${vo.pf_stname}</li> --%>
				<%-- <li>아이디 : ${vo.id}</li> --%>
				<%-- <li>결제일  : ${vo.pf_date}</li> --%>
				<!-- 사진 넣을곳   -->
				<img src="${pageContext.request.contextPath}/resources/images/main.png" alt="main">
				
			</ul>
		</div>
	</div>
	<div class="container" id="result"	style="width: 65%; font-size: 20px; background-color: #e6f5ff;">

		<div class="row" style="min-height: 800px;">
			<form action="./paySecondInsert" method="post" id="frm">
				<div style="border-top: 3px #80d6ff solid; " align="center">
				<br>
					<label for="address"><img src="${pageContext.request.contextPath}/resources/images/ads_2.png" >	</label>
					<button type="button" class="btn btn-warning active"
						onClick="goPopup()">
						<span class="glyphicon glyphicon-search"></span>주소검색
					</button>
					<br> <input style="width: 30%;" type="text" id="buy_address"
						name="buy_address" class="form-control" placeholder="Enter Addr"
						required="true" readonly="readonly" /> <br>
				</div>

				<input type="hidden" value="${vo.pf_key}" name="pf_key">

				<!-- <li><h2>메뉴와 가격</h2></li> -->
				<br>
				<div style="overflow: hidden; height: auto;">
					<c:forEach items="${vo_sm}" var="vo" varStatus="i">
						<!-- 반복해서 나눌거  -->
						<div class="col-sm-4" style="float: left; min-width: 195px;">
							<div class="panel panel-info"
								style="max-width: 1000px; height: 250px;">

								<input type="hidden" value="${vo.sm_menu}" name="ps_menu">
								<div class="panel-heading"></div>
								<div class="panel-body" align="center" style="height: 250px; min-height: 270px;">
									<span>${vo.sm_menu}</span> <br><span style="font-weight: bold;">${vo.sm_price}원 </span>
									<br><br>
									<img src="${pageContext.request.contextPath}/resources/images/pay2.png" alt="pay2">								
									<input type="text" id="menu${i.index}" value="0"
										name="ps_multi" class="menu btn btn-info" readonly="readonly" size="2" style="font-size: 20px;">
								<br>
									<!-- 기존 가겨  -->
									<input type="hidden" id="menus${i.index}"
										value="${vo.sm_price}"> <br> <input type="button"
										id="pl${i.index}" title="${i.index}" class="btn pl" value="+">
									<input type="text" id="count${i.index}" value="0"
										name="ps_count" readonly="readonly" class="btn btn-default" size="1">
									<input type="button" id="mi${i.index}" title="${i.index}"
										class="btn mi" value="-">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div align="center">
					<h2>
						<img src="${pageContext.request.contextPath}/resources/images/pay3.png" alt="pay3">	 <input type="text" id="total" value="0" name="totalPrice"
							readonly="readonly" class="btn btn-info" style="font-size: 20px;" size="3">						
						<button type="submit" id="btn" class="btn "><img
		src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"
		alt="kpay"></button>
		</div>
			</form>
			<!-- <button class="btn btn-danger pull-right" id="re">수량 초기화</button></h2> -->
			<!-- 리모콘 고정 -->
			 <div
				style="position: fixed; top: 43%; right: 5%; height: 150px; background-color: #e6f9ff ;border-top: 3px #80d6ff solid;">
				<span style="margin-left: 26px;"><img src="${pageContext.request.contextPath}/resources/images/pay3.png" alt="pay3">	  </span><br>
				<input type="button" id="total2" value="0" name="totalPrice"
					class="btn btn-info" style="font-size: 20px; margin-left: 30px"> <input
					type="hidden" id="total2" value="0" name="totalPrice"> <br>
				<button type="submit" id="btn2" class="btn "><img
		src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"
		alt="kpay"></button>
			</div> 
		</div>
		<!-- row 끝 -->


		<%-- <a href="./paySecondSelect"> <img
		src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"
		alt="kpay">
	</a>  --%>
	</div>


	<script type="text/javascript">
		var result = 0;
		//수량 버튼 클릭시 +
		$(".pl").click(function() {
			var btn = $(this).attr("title")
			//alert(bt);
			if ($("#count" + btn).val() == 10) {
				alert("최대수량 10");
			} else {
				/* var count = $("#count"+btn).val();
				//테스트
				$("#count"+btn).val(count*1+1);
				//console.log("count 값은 :"+ $("#count"+btn).val());
				//메뉴 값도 변경			
				//console.log(" 값 확인"+$("#count"+btn).val() * $("#menus"+btn).val());
				$("#menu"+btn).val($("#count"+btn).val() * $("#menus"+btn).val());
				
				//	총합더하기계산
					result = result + $("#menus"+btn).val()*1;
					$("#total").val(result); */
				// test
				var count = $("#count" + btn).val();
				$("#count" + btn).val(count * 1 + 1);
				hap(btn);

			}//else 긑

		});
		//수량 - 버튼 클릭시
		$(".mi").click(function() {
			var btn = $(this).attr("title")
			//alert(bt);
			if ($("#count" + btn).val() == 0) {
				alert("최소 수량은 0입니다.");

			} else {/* 
												var count = $("#count"+btn).val();
												$("#count"+btn).val(count*1-1);
												//console.log(($("#menus"+btn).val()*count)-$("#menus"+btn).val());
												$("#menu"+btn).val(($("#menus"+btn).val()*count)-$("#menus"+btn).val());
												//총합 마이너스
												result = result - $("#menus"+btn).val()*1;
												$("#total").val(result);
			 */
				var count = $("#count" + btn).val();
				$("#count" + btn).val(count * 1 - 1);
				hap(btn);
			}

		});

		// ***  합계  실시간 조회
		function hap(num) {
			var p = $("#menus" + num).val();
			var c = $("#count" + num).val();
			var h = p * c;
			$("#menu" + num).val(h);
			h = 0;
			$(".menu").each(function() {
				h = h + $(this).val() * 1;
			});
			$("#total").val(h);
			/*리모콘 가격  */
			 $("#total2").val(h); 
		}

		//전송 
		$("#btn").click(function() {
			var buy = $("#buy_address").val();
			var chb = buy != "";
			if ($("#total").val() > 0 && chb) {
				alert("결제 페이지로 이동합니다.");
				$("#frm").submit();
			} else if (chb == false) {
				/* console.log(chb);
				console.log($("#total").val()); */
				alert("주소가 없습니다.");
				event.preventDefault();//이벤트 막기
			} else if ($("#total").val() == 0) {
				alert("주문내역이 없습니다.");
				event.preventDefault();//이벤트 막기
			} else {
				alert("모두 입력해 주세요");
				event.preventDefault();//이벤트 막기
			}
		});
		// 리모콘에서 전송
		$("#btn2").click(function() {
			var buy = $("#buy_address").val();
			var chb = buy != "";
			if ($("#total").val() > 0 && chb) {
				alert("결제 페이지로 이동합니다.");
				$("#frm").submit();
			} else if (chb == false) {
				/* console.log(chb);
				console.log($("#total").val()); */
				alert("주소가 없습니다.");
				event.preventDefault();//이벤트 막기
			} else if ($("#total").val() == 0) {
				alert("주문내역이 없습니다.");
				event.preventDefault();//이벤트 막기
			} else {
				alert("모두 입력해 주세요");
				event.preventDefault();//이벤트 막기
			}
		});

		$("#re").click(function() {
			/* console.log("새로고침"); */
			location.reload();
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
			$("#buy_address").attr("value", roadFullAddr);

		}
	</script>
</body>
<hr>
<br>
<c:import url="../template/footer.jsp"></c:import>
</html>