<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-dialog modal-sm">
	<div class="modal-content">
		<div class="modal-header" style="border-bottom: 3px #80d6ff solid; text-align: center;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h2>${vo_pf1.pf_stname}</h2>
		</div>
		
		<div class="modal-body"
			style="text-align: center; font-size: 30px; margin-left: 10%; margin-right: 10%; ">
		
			<div style="margin-top: 15px; font-size: medium;">
				<hr>
				결제날짜 : ${vo_pf1.pf_date}
				<hr>
			</div>
		
			<ul class="list" style="list-style-type: none; ">		
		
				<c:set var="sum" value="${0}" />
				<br>
				<c:forEach items="${vo_ps}" var="vo2" varStatus="i2">
					<c:set var="sum" value="${sum+vo2.ps_multi}" />
					<li>
						<div style="font-size: medium;">
							${vo2.ps_menu} x ${vo2.ps_count}개 
							<p></p>
							 ${vo2.ps_multi}원
						</div>
					<br>
					</li>
		
				</c:forEach>
				<li>
					<hr> 
					<h2>
					<img alt="" src="${pageContext.request.contextPath}/resources/images/prstotal.png">
					</h2>
					
					<h2>
					${sum} 원
					</h2>					 
				</li>
		
			</ul>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" style=" background-image:url('${pageContext.request.contextPath}/resources/images/close.png'); width: 100px; height: 39px;"></button>
		</div>
		

	</div>		
</div>
			
