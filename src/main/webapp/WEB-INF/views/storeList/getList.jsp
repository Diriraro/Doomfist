<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:forEach items="${list}" var="vo" varStatus="i">
	<div class="col-sm-4" style="display: inline-block;">
		<div class="panel panel-info"
			style="max-width: 1000px; max-height: 800px; cursor: pointer;"
			onclick="location.href='./storeListSelect?st_key=${vo.st_key}'">
			<%-- 
				<div class="panel-body" align="center">
				 	${vo.st_name}
					<img src="${pageContext.request.contextPath}/resources/qna_images/${file[i.index]}"
					class="img-responsive" style="overflow: hidden; display: flex; align-items: center;
					justify-content: center; width: 348px; height: 340px;" alt="Image">
		
				</div> --%>

			<div class="img" style="background-image: url('${pageContext.request.contextPath}/resources/qna_images/${file[i.index]}')">
				<div class="content">
					<h1 style="margin-bottom: 30px;">${vo.st_name}</h1>
					<h5>${vo.st_tag}</h5>
				</div>
				<div class="img-cover"></div>
			</div>

		</div>
	</div>
</c:forEach>

<style>

	 .img{
        position: relative;
        background-image: url('${pageContext.request.contextPath}/resources/qna_images/${file[i.index]}');                                                               
        height: 400px;
        background-size: cover;
    }

    .img-cover{
       position: absolute;
       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.7);                                                                 
       z-index:1;
    }

    .img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         font-size:5rem;
         color: white;
         z-index: 2;
         text-align: center;
    }
	
</style>
	



