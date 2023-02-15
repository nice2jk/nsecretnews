<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3843225232663919" crossorigin="anonymous"></script>

	<title>쓰잘데기 12.0</title>

	<script type="text/javascript">
		var offset = 0;
		
		$( document ).ready(function() {	
			getContents();
		});
		
		function getContents() {
			$.ajax({
	        	type: "GET",
	        	url: "articles?offset=${offset}&search=${search}",
	            success:function(data){
	                $('#clist').html("");
	                var writehtml = "";	                
	    			offset = data.offset;
	                writehtml += "<h6 class='border-bottom border-gray py-3 mb-0 font-weight-bold text-primary'><a href='/articles.do'>[썰 게시판]</a><a href='write.do'><img src='/images/write.png' alt='...' class='img-thumbnail mx-2'></a></h6>";	                  
	                
	                for(i = 0; i < data.contentList.length; i++) {
		                writehtml += "<div class='media text-muted pt-2'>";
		                writehtml += "<div class='media-body pb-2 mb-0 lh-125 border-bottom border-gray'>";
		                writehtml += "<div class='d-flex justify-content-between mb-2 small align-items-center w-100'>";
		                writehtml += "<span class='font-italic'>" + data.contentList[i].aid + "  <img src='/images/view.png' alt='...' class='img-thumbnail mx-2'>" + data.contentList[i].vcount + "</span>";
		                writehtml += "<span class='text-success'>" + new Date(data.contentList[i].ctime).toISOString() + "</span>";
		                writehtml += "</div>";
		                writehtml += "<div class='d-flex justify-content-between mb-0 align-items-center w-100'>";
		                writehtml += "<strong style='text-overflow: ellipsis; overflow: hidden;'><a href='article.do?aid=" + data.contentList[i].aid + "' class='text-info'>" + data.contentList[i].title + "</a></strong>";
	                	writehtml += "<span class='font-weight-bold'><img src='/images/reply.png' alt='...' class='img-thumbnail mx-2'>" + data.contentList[i].count + "</span>";
		                writehtml += "</div></div></div>";
	                }
	                $('#clist').html(writehtml);
	            },
	            fail: function(error){
	            	alert("통신 데이터 값 2: ");
	            },
	            dataType: "json",
				contentType: "application/json; charset=utf-8"
	        })
		}
		
		function setGrade2(data, grade) {
			if(grade == 1) {
				grade = 2;
			} else {
				grade = 1;
			}
			
			$.ajax({
			    type       : 'POST',			    
			    contentType: 'application/json',
			    data : JSON.stringify({"id":data, "grade":grade}),			    
			    url        : 'grade',
			    success:function(data){
			    	getContents();
			    },
			    fail:function(error){
			    	alert(data);
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
				<li class="nav-item"><a class="nav-link" href="/contents.do?category=funp">유머픽</a></li>
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

	<!-- <div class="container my-3 bg-primary rounded shadow">
		<div class="d-flex justify-content-between mb-2 small align-items-center w-100">
			<div class="btn-group" role="group">
			<button type="button" class="btn btn-link font-weight-bold text-warning" onclick="location.href='/contents.do'">베스트</button>
			</div>
			<div class="btn-group" role="group">
			<button type="button" class="btn btn-link font-weight-bold text-warning" onclick="location.href='/soccerepl.do'">EPL</button>
			</div>
			<div class="btn-group" role="group">
			<button type="button" class="btn btn-link font-weight-bold text-warning" onclick="location.href='/soccerepl.do?category=WC2022'">2022 Worldcup</button>
			</div>
		</div>
	</div> -->

	<div class="container my-3 bg-white rounded shadow">
		<form class="form-inline justify-content-center" action="https://yandex.com/images/search" target="_blank">	  
			<div class="form-group mx-sm-3 mb-2 mr-2">
			<input type=text name="text" maxlength=255 class="form-control" placeholder="Yandex Search" required />  
			</div>
			<input type=submit class="btn btn-warning mb-2" value="검색" />
		</form>				
	</div>		
	
    <div id="clist" class="container my-3 bg-white rounded shadow-sm">
      
    </div>
	
	<nav aria-label="pagination">
	  <ul class="pagination justify-content-center">
	  	<c:choose>
	  		<c:when test="${offset == 0 }">
	  			<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">최신</a>
			    </li>
	  		</c:when>
	  		<c:otherwise>
		  		<c:choose>
					<c:when test="${empty search }">
						<li class="page-item"><a class="page-link" href="/articles.do?&offset=${offset-20}">< 다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/articles.do?&offset=${offset-20}&search=${search}">< 다음</a></li>
					</c:otherwise>
		  		</c:choose>
	  		</c:otherwise>
	  	</c:choose>
	    <li class="page-item disabled mr-2 ml-2"><a class="page-link" href="#">현재 페이지</a></li>
	    <c:choose>
	    	<c:when test="${empty search }">
	    		<li class="page-item"><a class="page-link" href="/articles.do?&offset=${offset+20}">이전 ></a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item"><a class="page-link" href="/articles.do?&offset=${offset+20}&search=${search}">이전 ></a></li>
	    	</c:otherwise>
	    </c:choose>	    
	  </ul>
	</nav>
	
	<form class="form-inline justify-content-center" action="/articles.do">	  
	  <div class="form-group mx-sm-3 mb-2 mr-2">
	    <label for="inputPassword2" class="sr-only">검색어</label>
	    <input type="hidden" name="category" value="${category}">		
	    <input type="search" class="form-control" name="search" placeholder="검색어" required>
	  </div>
	  <button type="submit" class="btn btn-primary mb-2">검색</button>
	</form>

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