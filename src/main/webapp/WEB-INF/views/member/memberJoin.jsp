<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoomFood | 회원가입</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
<c:import url="../template/header_sub.jsp"></c:import>

<div class="container">
  <div class="page-header text-center text-info">

		   <div><img src="${pageContext.request.contextPath}/resources/images/sign_up_2.png"> </div> 
    <br></br>
    <br></br>
  </div>
  <form class="form-horizontal Shadow" id="frm" action="./memberJoin" method="post" enctype="multipart/form-data" >
  <font style="color: red; margin-left: 780px;">*</font>&nbsp;<font style="font-size: 12px;">항목은 필수 표기 항목입니다</font> 
  <div  style="width: 800px; border-top: 3px #80d6ff solid;   margin-left:150px; ">
 <table class="text-info Shadow" style="width: 100%; border-top: 3px white solid;">
   <tbody>
    <tr>

     	<th style="border-bottom: 1px #dfdfdf solid;" scope="row">&nbsp;&nbsp;아이디 <font style="color: red;">*</font> </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 60px;"><input type="text" id="id" name="id"> (영문소문자/숫자, 5~10자)<td>
		<br>
    </tr>
    
	<tr>
      	<th style="border-bottom: 1px #dfdfdf solid; width: 150px;" scope="row">&nbsp;&nbsp;비밀번호 <font style="color: red;">*</font> </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 60px;"><input type="password" class="pwd" id="pw"  name="pw"></td>
	</tr>

	<tr>
    	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;비밀번호 확인 <font style="color: red;">*</font> </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 50px;"><input type="password"  class="pwd" id="pw2"  name="pw2"><font id="chpw"></font><td>
     	
    </tr> 

	<tr>
      	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;E-Mail <font style="color: red;">*</font> </th>
      	<td style="border-bottom: 1px #dfdfdf solid; height: 50px;"><input value="${sessionId}" type="email"  id="email"  name="email"><td>
    </tr>

	<tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px;" scope="row">&nbsp;&nbsp;이름 <font style="color: red;">*</font> </th>
     	<td style="border-bottom: 1px #dfdfdf solid; height: 50px;"><input value="${sessionName}" type="text"  id="name"  name="name"><td>
    </tr>

	<tr>
     	<th style="border-bottom: 1px #dfdfdf solid; width: 150px; " scope="row">&nbsp;&nbsp;연락처 <font style="color: red;">*</font> </th>
     	<td style="border-bottom: 1px #dfdfdf solid; height: 50px;"><input type="text"  id="phone"  name="phone"><td>
    </tr>
    </tbody>
    </table>
    </div>
       <hr></hr>
       <div id="result">
        <textarea style="width: 100%; height: 120px;" name="" id="" readonly="readonly">제1조(목적)
이 약관은 둠피스트 주식회사(전자상거래 사업자)가 운영하는 둠피스트 푸드 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리,의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “몰”이란 게임피아 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호,모사전송번호,전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 소프라노 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회,배송책임,환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경)
① “몰”은 다음과 같은 업무를 수행합니다.
  1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
  2. 구매계약이 체결된 재화 또는 용역의 배송
  3. 기타 “몰”이 정하는 업무
② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
       </textarea>
       <hr></hr>
       <font style="color: red;">(필수)</font> 이용약관에 동의하십니까? <input class="check" type="checkbox" id="check1">&nbsp;동의함
       <hr></hr>
       <textarea style="width: 100%; height: 120px;" name="" id="" readonly="readonly">1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

나. 회원 관리

회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달

2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보

3. 개인정보의 보유기간 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회사 내부 방침에 의한 정보 보유 사유

o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년

나. 관련 법령에 의한 정보보유 사유

o 계약 또는 청약철회 등에 관한 기록

-보존이유 : 전자상거래등에서의소비자보호에관한법률

-보존기간 : 5년
       </textarea>
       <hr></hr>
		 <font style="color: red;">(필수)</font>개인정보 수집 및 이용에 동의하십니까? <input class="check" type="checkbox" id="check2">&nbsp;동의함
		<hr></hr>
		 <font style="color: red;">(필수)</font>이용약관 및 개인정보수집 및 이용에 모두 동의합니다. <input type="checkbox" id="checkAll">&nbsp;동의함
		<hr></hr>
		</div>
    <!-- <button type="submit" id="btn" class="btn" style="outline: 0px;"><img alt="" border="0" src="${pageContext.request.contextPath}/resources/images/joinbtn.png"></button> -->
    <input type="image" id="joinbtn" style="outline: 0;margin-left: 44%; " src="${pageContext.request.contextPath}/resources/images/joinbtn_3.png">
    
  </form>
</div>
<footer style="margin-top: 1%">
<c:import url="../template/footer.jsp" ></c:import>
</footer>

<script type="text/javascript">

$("#id").blur(function() {
	var id = $("#id").val();
	
	$.ajax({
		type : "post",	//메서드형식
		url : "./memberIdCheck", //url 주소
		data : {
			id : id}, //parameter
		success: function(r) {
			if ($("#id").val()!=""&& r==0) {
				alert("중복된 아이디입니다"); 
				location.reload();
			}else if($("#id").val()!=""&&r==1&&(id.length<5||id.length>11)){
				alert("아이디를 범위에 맞게 지정해주세요");
				location.reload();
			}else if ($("#id").val()!=""&&r==1) {
				alert("사용가능한 아이디 입니다.");
			}
			
		},
		error: function() {
			alert("error 발생")
		}
	
		
	});
});

$("#email").blur(function() {
	var email = $("#email").val();
	
	$.ajax({
		type : "post",	//메서드형식
		url : "./memberEmailCheck", //url 주소
		data : {
			email : email}, //parameter
		success: function(e) {
			if ($("#email").val()!=""&& e==0) {
				alert("중복된 이메일입니다"); 
				location.reload();
			}else if ($("#email").val()!=""&&e==1) {
				alert("사용가능한 이메일 입니다.");
			}
			
		},
		error: function() {
			alert("error 발생")
		}
	
		
	});
});



$(function(){
    $('#pw').keyup(function(){
      $('#chpw').html('');
    });

$('#pw2').keyup(function() {
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();

	if (pw==pw2) {
		$('#chpw').html('비밀번호 일치함');
        $('#chpw').attr('color', '#199894b3');
	}else{
		$('#chpw').html('비밀번호 일치하지 않음');
        $('#chpw').attr('color', '#f82a2aa3');
	}
	});
});

$("#joinbtn").click(function() {
	var pw = $("#pw").val();
	var pw2 = $("#pw2").val();
	var email = $("#email").val();
	var name = $("#name").val();
	var id = $("#id").val();
	var phone = $("#phone").val();
	
	if (id=="") {
		alert("아이디를 입력해주세요");
		return false;
	}else if (pw!=pw2){
		alert("비밀번호를 확인해주세요");
		return false;
	}else if (email=="") {
		alert("이메일을 입력해주세요")
		return false;
	}else if (name=="") {
		alert("이름을 입력해주세요")
		return false;
	}else if (phone=="") {
		alert("연락처를 입력해주세요")
		return false;
	}else if ($('#checkAll').is(":checked") == false) {
		alert("이용 및 약관에 동의해주세요");
		/* console.log(email); */
		return false;
	}else if (pw==pw2) {
		$("#frm").submit();
		
	}


});

// 전체체크
var checkAll = document.getElementById("checkAll");
var check = document.getElementsByClassName("check");

checkAll.addEventListener("click", function(){
	
	for(i=0;i<check.length;i++){
		check[i].checked = checkAll.checked;
	}
});

// 하나씩 체크
for (var i = 0; i < check.length; i++) {
check[i].addEventListener("click", function() {
	//전체 검증 결과를 담을 변수
	var result = true;
	
	for (var j = 0; j < check.length; j++) {
		if (!check[j].checked) {
			result=false;
			break;
		}
	}
	checkAll.checked=result;
})
}



</script>

</body>
</html>