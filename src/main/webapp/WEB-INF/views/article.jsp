<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<title>쓰잘데기 10.0</title>
	
	<script type="text/javascript">		
		
		$( document ).ready(function() {	
			getContents();
		});
		
		function getContents() {
			$.ajax({
	        	type: "GET",
	        	url: "article?aid=${aid}",			
	            success:function(data){
	                $('#adetail').html("");
	                var writehtml = "";
	                writehtml += "<h6 class='border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary'><a href='articles.do'>[썰 게시판]</a><a href='/write'><img src='/images/write.png' alt='...' class='img-thumbnail mx-2'></a></h6>";
	                writehtml += "<h5 class='border-bottom border-gray py-2 my-3 font-weight-bold'>" + data.title + "</h5>";
	                writehtml += "<div class='d-flex justify-content-between py-2 mb-2 small align-items-center w-100 border-bottom border-gray'>";
	                writehtml += "<span class='font-weight-bold'>" + data.aid + "<img src='/images/view.png' alt='...' class='img-thumbnail mx-2'>" + data.vcount + "<img src='/images/reply.png' alt='...' class='img-thumbnail mx-2'>" + data.comments.length + "</span>";
	                writehtml += "<span class='text-success'>" + new Date(data.ctime).toISOString() + "</span>";
	                writehtml += "</div>";
                	writehtml += "<p class='pb-2'/>" + data.body;

	                $('#adetail').html(writehtml);
	                
	                writeComment(data.comments);
	            },
	            fail: function(error){
	            	alert("통신 데이터 값 2: ");
	            },
	            dataType: "json",
				contentType: "application/json; charset=utf-8"
	        })
		}
		
		function writeComment(comments) {			
			
			$('#cdetail').html("");
			var writehtml = "";			
			for(i = 0; i < comments.length; i++) {
				writehtml += "<div class='row border-bottom border-gray py-2 mx-1'>";
				writehtml += "<div class='col'>" + comments[i].body;
				writehtml += "</div>";
				writehtml += "<div class='col text-right'>";
				writehtml += "<small><span class='text-muted'>" + comments[i].user_id + " | </span><span class='text-success'>" + new Date(comments[i].ctime).toISOString() + "</span></small>";
				writehtml += "</div>";
				writehtml += "</div>";
			}
			
			$('#cdetail').html(writehtml);
		}
		
		function goInput() {
			var form = document.getElementById("inputFormm");
			
			if(form.cbody.value == "") {
				alert("No body");
				return;
			}
			
			var userId = Math.floor(Math.random() * 10000);
			
			$.ajax({
			    type       : 'POST',
			    contentType: 'application/json',
			    data : JSON.stringify({"aid":"${aid}", "body":form.cbody.value, "uid":userId}),			    
			    url        : 'comment',
			    success:function(data){
					var writehtml = "";					
					writehtml += "<div class='row border-bottom border-gray py-2 mx-1'>";
					writehtml += "<div class='col'>" + form.cbody.value;
					writehtml += "</div>";
					writehtml += "<div class='col text-right'>";
					writehtml += "<small><span class='text-muted'>" + userId + " | </span><span class='text-success'>" + new Date().toISOString() + "</span></small>";
					writehtml += "</div>";
					writehtml += "</div>";
					$('#cdetail').append(writehtml);
			    },
			    fail:function(error){
			    	alert("comment error");
			    }
			});
		}
		
		function goList() {
			window.location.href = "/articles.do";
		}
		
		function goRemove() {
			var forms = document.deleteForm;
			var raid = forms.aid.value;
			var rapw = forms.apw.value;
			
			$.ajax({
			    type       : 'DELETE',
			    contentType: 'application/json',
			    data : JSON.stringify({"aid":raid, "apw":rapw}),			    
			    url        : 'article',
			    success:function(data){
					alert("삭제 완료");
					window.location.href = "/articles.do";
			    },
			    error:function(error){
			    	alert("비밀번호를 확인하세요.");
			    }
			});
			
			
			
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/"><img src="/images/trash2.png" alt="..." class="img-thumbnail mr-2">쓰잘데기</a>
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

	<div id="adetail" class="container my-3 p-3 bg-white rounded shadow">

	</div>
	
	<div id="cdetail" class="container my-3 p-3 bg-white rounded shadow">

	</div>

	<div id="fdetail" class="container my-3 p-3 bg-white rounded shadow">
		<form id="inputFormm">
			<div class="input-group mb-3">
				<input type="hidden" id="aid" name="aid" value="${aid}"/>
				<input type="text" name="cbody" class="form-control" placeholder="댓글 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
		  	<button class="btn btn-outline-secondary" onclick="goInput()" type="button" id="button-addon2">입력</button>
  			</div>
			</div>
		</form>
	</div>
	
	<div class="d-flex justify-content-between p-3 mb-2 small align-items-center w-100 border-bottom border-gray">
		<button onclick="goList()" class="btn btn-primary">목록</button>
		<form name="deleteForm">
			<div class="input-group-prepend">
				<input type="hidden" id="aid" name="aid" value="${aid}"/>
				<input type="text" name="apw" id="basic-label" maxlength="4" placeholder="비밀번호 입력 (4자리)" aria-label="Username" aria-describedby="inputGroup-sizing-lg" required>
				<button type="button" class="btn btn-primary ml-2" onclick="goRemove()">삭제</button>				
			</div>
		</form>
	</div>
	
	<p>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
	          <a href="#">Back to top</a>
	        </p>	
			<p>Copyrightⓒ Secret 4 News.</p>
			<p>All Rights Reserved.</p>
		</div>
	</footer>	
		
</body>
</html>