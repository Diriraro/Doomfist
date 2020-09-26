<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int forcount = 0;
%>

<div class="modal-header" id="result123"
	style="border-bottom: 3px #80d6ff solid; text-align: center;">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<input type="image" src="${pageContext.request.contextPath}/resources/images/pr1.png">
</div>

<div class="modal-body"
	style="text-align: center; font-size: 30px; margin-left: 10%; margin-right: 10%;">
	<ul class="list" style="list-style-type: none;">
		<c:forEach items="${vo_pf}" var="vo" varStatus="i">
		<br>
			<div>

				<div style="float: left;">${vo.pf_stname} | 
				<p style="display:inline-block;font-size: medium; margin-top: 10px">결제날짜 :${vo.pf_date}</p></div>
				
				<div style="font-size: medium; float: right;">
					<input type="hidden" id="${i.count}" value="${vo.pf_key}"
						title="${i.count}">
					<%forcount++;%>
					<button class="btn btn-info plz" title="${i.count}"
						id="btndt${i.count}" data-toggle="modal" data-target="#my3Modal" 
						style="background-image: url('${pageContext.request.contextPath}/resources/images/pr1check.png');no-repeat 0 0; width: 100px; height: 40px;">
						</button>
					<c:set var="sum" value="${0}" />
				</div>
				
				<br>
				<hr>
			</div>

		</c:forEach>

	</ul>


</div>
<div class="modal-footer" style="margin-top: 30px">
	<button type="button" class="btn btn-default" data-dismiss="modal"style=" background-image:url('${pageContext.request.contextPath}/resources/images/close.png'); width: 100px; height: 39px;">
	
	</button>
</div>

<script type="text/javascript">
	var co =<%=forcount++%>	* 1;
	
	for (var i = 1; i <= co; i++) {
		$("#btndt" + i).click(
				function() {

					var pf_key = [];

					var pfs = $(this).attr("title");
					pf_key.push($("#" + pfs).attr("value"));
					var pf_key2 = $("#" + pfs).val();

					$.ajax({
						type : "get",
						url : "/s1/payment/selectReceipt",
						traditional : true,
						data : {
							pf_key : pf_key2
						},
						success : function(data) {
							$.get("/s1/payment/payReceipts?pf_key=" + pf_key,
									function(data) {
										$("#my3Modal").html(data);
									});
						}
					});
				});
	}
</script>


