<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="panel panel-default">
  	<div class="panel-body" >
  		<ul class="list" style="list-style-type: none;">
  			<li>가게 상세정보</li>
  			<li>전화번호 : ${vo.st_phone}</li>
    		<li>식당 주소 : ${vo.st_address}</li> 
    		<li>음식 종류 : ${vo.st_kind}</li>

    		<c:if test="${not empty vo_tag}">
    		<li>태그 :
    		<c:forEach items="${vo_tag}" var="vo_tag" varStatus="i">
    			${vo_tag.tag_name}<c:if test="${!i.last}">,</c:if>
    		</c:forEach>
    		</li>
    		</c:if>
    		
  		</ul>
  	</div>
  </div>
  
  <div class="panel panel-warning">
  	<div class="panel-heading" align="center">
  		<ul class="list" style="list-style-type: none;">
  			<li>여기는 가게 메뉴와 가격이 적히는 곳입니다</li>
  			<c:forEach items="${vo_sm}" var="vo" >
  			<li>${vo.sm_menu} : ${vo.sm_price}</li>
  			</c:forEach>
	  		<li align="right" style="margin-right: 40px;a">
	  		<a href="../payment/payFirstSelect?st_key=${vo.st_key}&pf_stname=${vo.st_name}&id=${sessionScope.member.id}">
	  		</a>
	  		</li>
  		</ul>
  	</div>
  </div>
  
  				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">수정</button>
					</div>
				</div>

</body>
</html>