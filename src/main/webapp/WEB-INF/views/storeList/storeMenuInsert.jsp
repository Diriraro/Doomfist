<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 식당수정 > 메뉴추가</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>

<script type="text/javascript">


function Close_Event(){
    opener.document.location.reload();
}

</script>

<body onunload="Close_Event();">
<img alt="" src="${pageContext.request.contextPath}/resources/images/findimage.png">
	<div class="container">
		  <div class="page-header text-center text-info">

  
  	<div>

			
	<form class="form-horizontal" action="./storeMenuInsert" id="form" name="form" method="POST"
			enctype="multipart/form-data">
			<!-- 메뉴 추가 -->
			<div align="center" class="form-group">
				<div style="background-color: #e6f5ff; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row">
				<img src="${pageContext.request.contextPath}/resources/images/menu.png" style="width: 30px" height="30px"> 메뉴</div>
				<input type="button" id="addmenu" class="btn btn-info active" style="width: 342px; background-image: url('${pageContext.request.contextPath}/resources/images/qna_menu.png')"> 
			</div>  
			<input type="hidden" id="st_key" name="st_key" value="${liststore.st_key}">

				&nbsp; &nbsp;
			
			
				
		
			
			<%-- <c:forEach items="${listmenu}" var="vo">
			<div class="menuu2" style="margin-top: 15px; margin-bottom: 15px;" align="center">
			<input type="hidden" id="sm_key" name="sm_key" value="${vo.sm_key}">
				<input value="${vo.sm_menu}" title="${a}"type="text" id="sm_menu" name="sm_menu"  style="margin-right: 15px"> 
				<input value="${vo.sm_price}" type="text" id="sm_price" name="sm_price" class="sm_price" >
			</div>
			</c:forEach> --%>
			
			<div id="menuu" align="center"> 
			</div>    
			<button type="submit" id="btn" class="btn btn-default active" style="width: 126px; height: 49px;  background-image: url('${pageContext.request.contextPath}/resources/images/qna_submit.png')"></button>
			</form>
			</div>
			<br></br>


	</div>
	<input type="hidden" id="a" value="${a}">
	
	

	<script type="text/javascript">
	
		var countm = 1 + $("#a").attr("value")*1;

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
												'<div class="form-group" style="margin-top: 15px; margin-bottom: 15px;"><div style="width:150px; height:20px; display:inline-block;"></div> <input type="text" id="sm_menu" name="sm_menu" placeholder="메뉴를 입력해주세요" style="margin-right: 10px; margin-left:24px; width:166px; display: inline-block" class="form-control"> <input type="text" id="sm_price" name="sm_price" class="form-control" placeholder="가격을 입력해주세요 "style="width:166px; display: inline-block;" ><i class="glyphicon glyphicon-remove remove"></i></div>');

								countm++;
							} else {
								alert("메뉴등록은 최대 10개 까지입니다.");
							}

						});
		
		
		var countt = 1;
		function setCountt(tt) {
			countt = countt + tt;
		}

		
		function goPopup(){
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
			
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr){
				// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
				document.form.qna_contents.value = roadFullAddr;	
				
		}
		
	</script>

	</div>

</body>
</html>