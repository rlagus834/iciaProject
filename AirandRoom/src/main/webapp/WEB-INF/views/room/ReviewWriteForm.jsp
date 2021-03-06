<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child {
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child {
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child {
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr {
	
	padding-left:20px;
}
table td:first-child {
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
	border-bottom:0;
}
table tr:last-child td:first-child {
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
  #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
</head>
<script>
	function reviewWrite() {
		var Ccheck = document.getElementById("contents").value;
		if (Ccheck == "") {
			alert('후기내용을 기입해주십시오');
		}
		else if(Ccheck.length>500){
			alert('후기 내용은 500자 이하로 작성해주십시오.');
		}
		else if(Ccheck != ""){
			var formData = new FormData(document.getElementById("form"));
			$.ajax({
				type : "POST",
				url : "reviewWrite",
				processData : false, // 필수 
				contentType : false, // 필수 
				data : formData,
				dataType : "text",
				success : function(result) {
					if (result == "yes") {
						alert('등록 성공');
						self.close();

					} 
					else if (result == "no") {
						alert('등록실패');
					}

				},
				error : function() {
					alert('리뷰  작성중 에러 발생');
				}

			});

		}			
		}
	  function stars(s) {
			$("#grade").val(s);
	}
	  function contentlength(){
		  $("#contentslength").html($("#contents").val().length+"/500");
	  }
</script>
<body>
	<form id="form" enctype="multipart/form-data">
<table>
<input type="hidden" id="grade" name="grade" >		
<input type="hidden" name="rno" value="${rno}">
<tr>
<td>평가점수</td>
<td>
	<p id="star_grade">
		<a href="#" onclick="stars('1')">★</a> 
		<a href="#" onclick="stars('2')">★</a> 
		<a href="#" onclick="stars('3')">★</a>
		<a href="#" onclick="stars('4')">★</a> 
		<a href="#"onclick="stars('5')">★</a>
	</p>
</td>
</tr>
<tr>
<td>후기내용:</td>
		<td><textarea onkeyup="contentlength()" name="contents" id="contents" cols="30" rows="10"></textarea>
				<div id="contentslength" style="height:20px; text-align:right;">0/500</div>
		</td>
		</tr>
		<tr>
		<td>숙소사진:</td>
		<td><input type="file" multiple="multiple" name="pic"></td>
	</tr>
	<tr><td>
	   <h3>이미지 미리보기</h3>
	   </td><td>
<div id="imagePreview">
	<img id="img" />
</div>
</td></tr>
	<tr>
	<td colspan="2" style="text-align:center;">
	<button type="button" class="btn btn-success" onclick="reviewWrite()">작성 완료</button><br>
</td>
</tr>
</table>
	</form>
<script type="text/javascript">
  $(document).ready(function (e){
	  
	  		$('#star_grade a').click(function() {

	  			$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
	  			$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	  			return false;
	  		});

	  	
	  
	  
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#imagePreview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){
		var ext = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase();
		if (!(ext == "gif" || ext == "jpg" || ext == "png" || ext == "bmp")) {
			alert("이미지파일 (.jpg, .png, .gif,.bmp ) 만 업로드 가능합니다.");
			$("input[type='file']").val("");
			return false;
		}
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#imagePreview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#imagePreview');
        }
      });
    }
  });
</script>
</body>


</html>