<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 맛집 신청</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>   
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header_sub.jsp"></c:import>
	<div class="container">
		  <div class="page-header text-center text-info">
		   <div><img src="${pageContext.request.contextPath}/resources/images/apply_2.png"> </div> 
    <br></br>
    <br></br>
  </div>
  	<div>
		<form action="./qnaJoin" id="form" name="form" method="POST"
			enctype="multipart/form-data">
			<br>
			<div style="width: 800px; border-top: 3px #80d6ff solid; margin-left:150px;">
			<br>
			<br>

			<div class="form-group" align="center">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"> <b>식당 이름</b></div> <input type="text" style="width: 342px; display: inline-block;"
					class="form-control" id="qna_title" placeholder="식당이름"
					name="qna_title">
			</div>
			
			<hr style="width: 500px; margin-left: 150px;">
			
			<div class="form-group">
				<input type="hidden" class="form-control" style="width: 342px;"
					id="id"  value="${sessionScope.member.id}"
					placeholder="Enter writer" name="id">
			</div>
			
			<div class="form-group" align="center">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"> <b>전화 번호</b></div>  <input type="text" numberOnly style="width: 342px; display: inline-block;"
					class="form-control" id="qna_phone" placeholder="전화 번호는 -을 뺴고 입력해 주세요"
					name="qna_phone">
			</div> 
			
			<hr style="width: 500px; margin-left: 150px;"> 
			
			
			<div class="form-group" align="center">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"> <b>음식점 주소</b></div>
				<input style="width: 342px; display: inline-block;" type="text" id="qna_contents" name="qna_contents" class="form-control" placeholder="Enter Addr" required="true" readonly="readonly"/>
				<br><br>	
				<div style="width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"></div>
				<button type="button" class="btn btn-warning active" onClick="goPopup()" style="width: 342px;"><span class="glyphicon glyphicon-search"></span>주소검색</button>			
				
				<br>
			</div>
			
			
			<hr style="width: 800px; margin-left: 150px;"> 
			   
			<div align="center" class="form-group">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"> <b>식당 카테고리</b></div>
				<select id="qna_kind" name="qna_kind" style="width: 180px; display: inline-block;" class="form-control">
					<option value="">선택없음</option>
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
					<option>패스트푸드</option>
				</select>
				<div style="display: inline-block; width: 166px; height: 20px;"></div>
			</div> 
			
			<hr style="width: 500px; margin-left: 150px;">
		  
			<!-- 태그 추가 -->
			<div align="center" class="form-group">
				<div  style="background-color: #e6f5ff; width: 492px;">태그는 한줄로, 각 태그 앞에 ' # ' , 태그 뒤에  ' '(공백) 를 붙여주세요</div>
			</div>
			
			<div align="center" class="form-group">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row">
				<img src="${pageContext.request.contextPath}/resources/images/tag.png" style="width: 30px" height="30px"> 태그 </div>
				<div style="display: inline-block;"> <input type="text" class="form-control" id="qna_tag" name="qna_tag" placeholder="#태그  #태그 ..." value="#맛집" style="width: 342px"></div>
			</div>
			
			<hr style="width: 500px; margin-left: 150px;">
			
			<!-- 메뉴 추가 -->    
			<div align="center" class="form-group">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row">
				<img src="${pageContext.request.contextPath}/resources/images/menu.png" style="width: 30px" height="30px"> 메뉴</div>
				<input type="button" id="addmenu" class="btn btn-info active" style="width: 342px; background-image: url('${pageContext.request.contextPath}/resources/images/qna_menu.png')"> 
			</div>  
  		       
 			<div style="margin-top: 15px; margin-bottom: 15px;" align="center">
 				<div style="width: 150px; height: 20px; display: inline-block; margin-right: 10px;"></div>
				<input type="text" class="form-control" id="qm_menu" name="qm_menu" placeholder="메뉴를 입력해주세요" style="margin-right: 10px; display: inline-block; width: 166px"> <input type="text" numberOnly id="qm_price" class="form-control" name="qm_price" class="qm_price" placeholder="가격을 입력해주세요" style="width: 166px; display: inline-block;">
			</div>
			<div id="menuu" align="center"></div>   
				
			<hr style="width: 500px; margin-left: 150px;">
			 
			<!-- 음식 사진 추가 -->  
			<div align="center" class="form-group">
				<div style="background-color: ; width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row">
				<img src="${pageContext.request.contextPath}/resources/images/fileimg.png" style="width: 30px" height="30px"> 사진 추가 </div>
				<input type="button" id="add" class="btn btn-info active" style="width: 342px;  background-image: url('${pageContext.request.contextPath}/resources/images/qna_img.png')">
			</div> 
			
			<div align="center" class="form-group">
				<div style="width: 150px; border-bottom: 2px white solid; margin-right: 10px; display: inline-block;" scope="row"></div>
				<input type="file" class="form-control files" name="files" style="width: 342px; display: inline-block;"> 
			</div>
			<div id="file" align="center"></div>	
    		<hr style="width: 500px; margin-left: 150px;">
			<br> 
			<div align="center">
				<button type="button" id="btn" class="btn btn-default active" style="width: 120px; height: 45px;  background-image: url('${pageContext.request.contextPath}/resources/images/qna_submit.png')"></button>
			<br><br><br>
			</div>
		</div>
		 </form>
	</div>


	<script type="text/javascript">   
	
	//전화번호, 메뉴 가격 숫자만 들어가게 하기
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});

		var countm = 1;
		function setCountm(cc) {
			countm = countm + cc;
		}

		$("#menuu").on("click", ".remove", function() {
			$(this).parent().remove();
			countm--;
		});

		$("#addmenu")       
				.click(
						function() {   
							if (countm < 10) { 
								/* console.log(countm); */  
								$("#menuu")    
										.append(
										'<div class="form-group" style="margin-top: 15px; margin-bottom: 15px;"><div style="width:150px; height:20px; display:inline-block;"></div> <input type="text" id="qm_menu" name="qm_menu" placeholder="메뉴를 입력해주세요" style="margin-right: 10px; margin-left:24px; width:166px; display: inline-block" class="form-control qm_menu"> <input type="text" numberOnly id="qm_price" name="qm_price" class="form-control qm_price" placeholder="가격을 입력해주세요 "style="width:166px; display: inline-block;" ><i class="glyphicon glyphicon-remove remove"></i></div>');
								countm++;
								
								$("input:text[numberOnly]").on("keyup", function() {
								    $(this).val($(this).val().replace(/[^0-9]/g,""));
								});
							} else {    
								alert("메뉴등록은 최대 10개 까지입니다.")
							}

						});
		
		
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
	
	<script type="text/javascript" src="../resources/boardForm.js?v=<%=System.currentTimeMillis() %>">
		
	</script>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>