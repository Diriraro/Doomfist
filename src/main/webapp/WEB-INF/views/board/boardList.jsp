<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>DoomFood | 공지사항</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>   
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<div class="row">
		   <div class="page-header text-center text-info">
		   <div><img src="${pageContext.request.contextPath}/resources/images/notice_2.png"> </div> 
    <br></br>
    <br></br>
    <hr style=" border-top: 3px #80d6ff solid;">
  </div>
		  <form style="margin-left: 16px;" action="./${board}List" class="form-inline">
		  <div class="input-group input-group-sm col-xs-2">
		  	<select class="form-control" id="sel1" name="kind">
				    <option value="bt">Title</option>
				    <option value="bc">Contents</option>
				  </select>
			</div>	  	
		    <div class="input-group input-group-sm col-xs-4">

		      <input type="text" class="form-control" placeholder="Search" name="search">
		      <div class="input-group-btn">
		        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
		      </div>
		    </div>
		  </form>
		</div>
		<table class="table" style="text-align: center;">
			<tr style="background-color: #e6f5ff;">
				<td></td>
				<td>제목</td>
				<td>작성날짜</td>
				<td>조회수</td>
			</tr>
			<br>
			<c:forEach items="${list}" var="vo">
			<tr style="border-bottom:1px; background-color: white;" >
				<td>${vo.no_num}</td>
				<td>
				<c:catch>				
				<!-- for(int i=0;i<=0;i++) -->
				<c:forEach begin="1" end="${vo.depth}">
				</c:forEach>
				</c:catch>
				<a href="./${board}Select?num=${vo.no_num}" style="font-weight: bold; font-size: large;">${vo.title}</a></td>
				<td>${vo.regDate}</td>
				<td>${vo.likes}</td>
			</tr>
			</c:forEach>
			
		
		</table>
		
		<div>
			<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
			<li><a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
			</c:if>
			</ul>
		</div>
				
		<c:catch>
		<c:choose>
			<c:when test="${board eq 'notice'}">
				<c:if test="${member.id eq 'admin'}">
					<div>
						<a href="./${board}Write" class="btn btn-info pull-right"><span class="glyphicon glyphicon-pencil"></span>공지쓰기</a>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty member}">
					<div>
						<a href="./${board}Write" class="btn btn-info pull-right"><span class="glyphicon glyphicon-pencil"></span>공지쓰기</a>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		</c:catch>
		
	</div>
<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>