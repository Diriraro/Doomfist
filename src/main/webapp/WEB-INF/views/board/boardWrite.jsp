<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/style.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">



		<form action="./${board}Write" id="frm" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="20" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>

			
			<input type="button" id="btn" class="btn btn-default pull-right" value="Write">
		</form>

	</div>
	
	
	<!-- 외부 자바 스크립트 파일  가져오기 -->
	<script type="text/javascript">
		//$("선택자").action();
		//$("#contents").summernote("code",${vo.contents})
		$("#contents").summernote({
			height : 400, // set editor height
			minHeight : 300, // set minimum height of editor
			maxHeight : 500, // set maximum height of editor
			focus : true,
			placeholder: '최대 2048자까지 쓸 수 있습니다'
		// set focus to editable area after initializing summernote
		});

		
	
	</script>
	<script type="text/javascript" src="../resources/noticeForm.js">
	</script> 
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>