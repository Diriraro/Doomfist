<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doom Food | 회원등급 정책</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>   
	<div  class="container" style="border: 1px solid #b3cccc; border-top: 3px #80d6ff solid; padding: 30px; margin-bottom: 15px;">         	   
		<div class="terms ng-scope">
			<div align="center"><h3><b>둠푸드 회원등급 정책</b></h3></div>   
			<br><br>
			<div class="stit"><b>제1조 [목적]</b></div>
			<br>
			<div style="margin-left: 30px;">   
				<ul style="list-style: none;">      
					<li>"둠푸드 회원등급 정책"은 둠푸드 서비스를 이용하는 회원에 대해서 적용되는 내용을 규정함을 그 목적으로
						합니다. 둠푸드 회원은 본 정책에 의해 등급에 따른 혜택(쿠폰)을 제공받을 수 있으며, 기타 특정 마케팅 활동 참여 시
						이에 대한 보상으로 포인트를 적립 받으실 수 있습니다.</li>
				</ul>
			</div>
			<br><br>
			<div class="stit"><b>제2조 [회원등급 및 혜택]</b></div>
			<div style="margin-left: 30px;">
				<ul style="list-style: none;">
					<li>① 회원 등급의 종류, 승급조건 및 이에 따른 혜택은 아래와 같습니다.
						<br><br>
						<table class="table table-bordered" style="border: 1px soild black">
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<tbody>
								<tr style="background-color: #EEEEEE; font-weight: bold;">
									<th>구분</th>
									<th>승급 조건</th>
									<th>혜택 (쿠폰)</th>
									<th>쿠폰 유효기간</th>
								</tr>
								<tr>
									<td><strong>둠VIP</strong></td>
									<td>직전 월 맛집주문 16회 이상</td>
									<td>총 4,000원 쿠폰 (2,000원권 2장)</td>
									<td>매월 5일부터 다음 월 4일까지</td>
								</tr>
								<tr>
									<td><strong>둠마스터</strong></td>
									<td>직전 월 맛집주문 11~15회</td>
									<td>총 2,000원 쿠폰 (1,000원권 2장)</td>
									<td>매월 5일부터 다음 월 4일까지</td>
								</tr>
								<tr>
									<td><strong>둠히어로</strong></td>
									<td>직전 월 맛집주문 6~10회</td>
									<td>1,500원 쿠폰</td>
									<td>매월 5일부터 다음 월 4일까지</td>
								</tr>
								<tr>
									<td><strong>둠패밀리</strong></td>
									<td>직전 월 맛집주문 3~5회</td>
									<td>1,000원 쿠폰</td>
									<td>매월 5일부터 다음 월 4일까지</td>
								</tr>
								<tr>
									<td><strong>둠프렌드</strong></td>
									<td>직전 월 맛집주문 0~2회</td>
									<td>500원 쿠폰</td>
									<td>매월 5일부터 다음 월 4일까지</td>
								</tr>
							</tbody>
						</table>
					</li>
					<li>② 직전 월 터치주문 수에 따라 회원등급 조정은 매월 5일에 적용됩니다. 직전 월에 대한 기준은 매월
						1일부터 말일까지를 의미합니다.</li>
					<li>③ 회원등급 승급 조건인 "터치주문"에는 전화주문은 포함되지 않습니다.</li>
					<li>④ 당사의 프로모션 진행으로 인하여 특정기간 동안 회원등급의 기준 및 등급별 혜택 등은 한시적으로 본
						정책과 다르게 운영될 수 있습니다.</li>
					<li>⑤ 프로모션 종료 후 기존 정책으로 복귀 시 프로모션 기간 동안 적용되었던 회원들의 등급은 본래의 정책
						기준에 따라 조정 될 수 있습니다.(예: 프로모션 기준으로는 "요기마스터"이나 본래 정책 기준으로는 "요기히어로"일
						경우, 프로모션 종료 후 "요기히어로"로 조정 됨)</li>
					<li>⑥ 상기 쿠폰을 사용한 주문이 취소되는 경우에는, 해당 쿠폰은 복원 처리 됩니다.</li>
				</ul>
			</div>
				<br><br>
			
			<div class="stit"><b>제3조 [포인트 적립]</b></div>
			<div style="margin-left: 30px;">
				<ul style="list-style: none;">
					<li>① 회원이 둠푸드 애플리케이션 내 서비스 화면 및 이벤트 화면에 명시된 미션 또는 마케팅 활동 진행 시,
						이에 따른 특정 금액의 포인트가 적립됩니다.</li>
					<li>② 시스템 오류, 조작 또는 기타 어뷰징 사례 등이 발견될 경우 포인트는 추후에라도 임의 차감 조치될 수
						있습니다.</li>
				</ul>
			</div>
				<br><br>

			<div class="stit"><b>제4조 [포인트 사용]</b></div>
			<div style="margin-left: 30px;">
				<ul style="list-style: none;">
					<li>① 적립된 포인트는 1원 이상일 때, 1원 단위로 앱 내 결제(현장결제 제외)를 통하여 현금처럼 사용
						가능합니다.</li>
					<li>② 포인트 1일 사용 횟수 및 최대사용금액의 제한은 없습니다. 또한 포인트만으로 전체 결제 가능하며,
						쿠폰과 포인트의 조합만으로도 결제 가능합니다. 포인트를 사용한 주문이 취소되는 경우, 사용하신 포인트 전액이 재 적립
						됩니다.</li>
					<li>③ 회원이 포인트를 사용하는 경우, 유효기간이 빠른 포인트부터 우선적으로 차감됩니다.</li>
				</ul>
			</div>
				<br><br>

			<div class="stit"><b>제5조 [포인트 사용 취소 및 유효기간]</b></div>
			<div style="margin-left: 30px;">
				<ul style="list-style: none;">
					<li>① 포인트를 사용한 주문이 취소되는 경우 사용하신 포인트 전액이 재 적립 됩니다.</li>
					<li>② 적립된 포인트의 유효기간은 포인트 적립일로부터 180일이며 유효기간이 지난 포인트는 자동적으로
						소멸됩니다. 회사는 포인트 소멸 30일 전에 모바일 애플리케이션 내에서 소멸에 대한 내용을 공지하며, 사용자의 개인
						이메일 등을 통하여 적립된 포인트 소멸 관련 정보를 추가적으로 제공할 수 있습니다.</li>
					<li>③ 회원은 마이 페이지에서 포인트의 누적 내역 및 각각의 유효기간 확인이 가능합니다.</li>
					<li>④ 회원을 탈퇴하는 경우, 적립된 포인트는 모두 소멸됩니다. 회원 탈퇴 후 재가입하더라도 이전에 소멸된
						포인트 복구는 불가능합니다.</li>
				</ul>
			</div>
				<br><br>

			<div class="stit"><b>제6조 [기타]</b></div>
			<div style="margin-left: 30px;">
				<ul style="list-style: none;"> 
					<li>① 둠푸드 회원등급 정책으로 발생하는 쿠폰 및 포인트는 일체 둠푸드가 부담합니다.</li>
					<li>② 본 내용은 당사의 사정에 따라 변경될 수 있습니다. 변경 사항과 관련한 상세내용은 둠푸드 공지사항에서
						확인하실 수 있습니다.</li>
				</ul>
			</div>
		</div>       

	</div>
 
	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>