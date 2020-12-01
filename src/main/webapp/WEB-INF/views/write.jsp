<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <script data-ad-client="ca-pub-3843225232663919" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    
    <title>쓰잘데기 10.0</title>
    
    <script>
	 $(document).ready(function() {
	     $('#summernote').summernote();
	 });
	 
	 function goSubmit() {
	  	  var form = document.getElementById("writeForm");
	  	  
	  	  var markupStr = $('#summernote').summernote('code');
	  	  
	  	  if(form.atitle.value == "") {    		  
	  		  alert("제목을 입력해주세요.");
	  		  return;
	  	  }
	  	  
	  	  if($('#summernote').summernote('isEmpty')) {
	  		  alert("내용을 입력해주세요.");
	  		  return;
	  	  }
	  	  
	  	  if(form.apw.value == "") {
	  		  alert("비번을 입력해주세요.");
	  		  return;
	  	  }
	  	  
	  	//document.getElementById("abody").setAttribute('value', markupStr);
	  	
		  	$.ajax({
			    type       : 'POST',			    
			    contentType: 'application/json',
			    data : JSON.stringify({"atitle":form.atitle.value, "abody":markupStr, "apw":form.apw.value}),			    
			    url        : 'article',
			    success:function(data){					
					window.location.href = "/article.do?aid=" + data;
			    },
			    fail:function(error){
			    	alert("comment error");
			    }
			});
		}
	</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/"><img src="/images/trash2.png" alt="..." class="img-thumbnail mr-1">쓰잘데기</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=recm">추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/articles.do">썰 게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=best">베스트</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=xart">조공 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=news">뉴스 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=itct">IT 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=movi">영화 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=socc">축구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=base">야구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=girl">여성 시대</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=shop">쇼핑 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=stoc">주식 추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=devp">개발자</a></li>
			</ul>	
		</div>
	</nav>
	
	<div class="container my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary"><a href="/articles.do">[썰 게시판]</a></h6>
		<label for="basic-label" class="font-weight-bold my-3">글 등록하기</label>
		<form id="writeForm">
			<div class="input-group mb-1">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">제목</span>
				</div>
				<input type="text" class="form-control" name="atitle" id="basic-label" placeholder="제목 입력" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<label for="basic-body" class="font-weight-bold my-1">본문 :</label>
			<input type="hidden" id="abody" name="abody" value=""/>
			<textarea id="summernote" required></textarea>		
		  	<div class="input-group my-2">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="text" name="apw" id="basic-label" maxlength="4" placeholder="비밀번호 입력 (4자리)" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<button type="button" class="btn btn-primary mb-2" onclick="goSubmit()">등록</button>
	  	</form>
	</div>	
</body>
</html>