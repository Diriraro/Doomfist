/**
 * 
 */

var count = 1;

function setCount(c) {
	count = count + c;
}

$("#file").on("click", ".remove", function() {
	$(this).parent().remove();
	count--;
});

$("#add")
		.click(
				function() {   
					if (count < 5) {
						$("#file")
								.append(
								'<div class="form-group"> <input type="file" class="form-control files" name="files" style="width: 342px; display: inline-block; margin-left: 182px;"> <i class="glyphicon glyphicon-remove remove"></i> </div>');
						count++;
					} else {
						alert("이미지는 최대 5개 까지입니다.")
					}

				});


// --------------------------------------------------------------------------------------------

// summernote에 이미지 올리기
//$('#contents').summernote({
//	height : 400,
//	callbacks : {
//		onImageUpload : function(files, editor) {
//			var formData = new FormData();// <form></form>
//			formData.append('files', files[0]); // <input type = "file" name
//												// ="">
//			$.ajax({
//				type : "post",
//				url : "../boardFile/fileInsert",
//				data : formData,
//				enctype : "multipart/form-data",
//				cache : false,
//				contentType : false,
//				processData : false,
//				success : function(imageName) {
//					imageName = imageName.trim();
//					$("#contents").summernote('editor.insertImage', imageName);
//
//				}
//			});
//		}, // onImageUpload
//		
//		onMediaDelete:function(files){	
//			
//			var fileName = $(files[0]).attr("src");
//			fileName = fileName.substring(fileName.lastIndexOf("/")+1);
//			console.log(fileName);
//	
//			$.ajax({
//				type:"post",
//				url:"../boardFile/summerDelete",
//				data:{
//					fileName:fileName
//				},
//				success:function(data){
//					console.log(data)
//				}
//				
//			});
//		}//OnMediaDelete
//		
//		
//		
//	}//callBack
//});

// --------------------------------------------------------------------------------------------

$("#btn").click(function() {

	// title, contents 데이터 유무 검증
	var title = $("#qna_title").val();
	var qna_contents = $("#qna_contents").val();
	var qna_kind = $("#qna_kind").val();
	var qna_menu = $(".qm_menu").val();
	var qna_price = $(".qm_price").val();
	
	var ch3 = true;
	var ch6 = true;
	var ch7 = true;

	$(".files").each(function() {
		if ($(this).val() == "") {
			ch3 = false;
		}
	});
	
	$(".qm_menu").each(function() {
		if ($(this).val() == "") {
			ch6 = false;
		}
	});
	
	$(".qm_price").each(function() {
		if ($(this).val() == "") {
			ch7 = false;
		}
	});
	var ch5 = false; //전화번호검사



		var regPhone =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

		ch5 = regPhone.test($("#qna_phone").val());
		
		if(ch5==false){
			alert('전화번호를 확인해주세요')
		}
	



	var ch1 = title != ""; //식당 이름
	var ch2 = qna_contents != "";//주소
	var ch4 = qna_kind !=""; //카테고리

	
	if (ch1 && ch2 && ch3 && ch4 && ch5 && ch6 && ch7) {
		// form 전송(submit event 강제 발생)
		// $("#con").val(contents);// contents Server null일때
		$("#form").submit();

	} else {
		// submit event 종료
		alert("항목들을 확인해 주세요");
		/*
		 * console.log(title==''); console.log(contents=="");
		 * console.log(title.length); console.log(contents.length);
		 */
	}

});


// $("선택자 ").action();
// $('#qna_contents').summernote({
// height : 400,
// callbacks:{
// onImageUpload : function(file){
// console.log("upload");
//				 
// }
// }
 //});

