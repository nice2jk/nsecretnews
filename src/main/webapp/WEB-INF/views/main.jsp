<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

	<script data-ad-client="ca-pub-3843225232663919" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	
	<title>쓰잘데기 10.0</title>    

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
    
    <div class="container my-3 bg-white rounded shadow">
		<h5 class="border-bottom border-gray py-3 font-weight-bold"><a href="/contents.do">[베스트]</a><small>  최신 글</small></h5>			
		<c:forEach var="ct" begin="0" end="10" items="${contentList}" varStatus="status">
			<div class="media text-muted pt-2">
        		<div class="media-body pb-2 mb-0 lh-125 border-bottom border-gray">
          			<div class="d-flex justify-content-between mb-2 small align-items-center w-100">
            			<span class="font-italic">${ct.cpname}</span>
						<span class="text-success"><fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ssz" value="${ct.ctime}" timeZone="UTC"/></span>            
          			</div>
          			<div class="d-flex justify-content-between mb-0 align-items-center w-100">
          				<strong style="text-overflow: ellipsis; overflow: hidden;"><a href="${ct.link}" target="_blank" class="text-danger">${ct.title}</a></strong>          	
          				
          			</div>
        		</div>
      		</div>
		</c:forEach>
	</div>
	
	<div class="container my-3 bg-white rounded shadow">
		<h6 class="border-bottom border-gray py-3 font-weight-bold"><a href="/articles.do">[썰 게시판]</a><small>  최신 글</small></h6>			
		<c:forEach var="ct" begin="0" end="10" items="${articleList}" varStatus="status">
			<div class="media text-muted pt-2">
        		<div class="media-body pb-2 mb-0 lh-125 border-bottom border-gray">
          			<div class="d-flex justify-content-between mb-2 small align-items-center w-100">
            			<span class="font-italic">${ct.aid} | ${ct.vcount}</span>
						<span class="text-success"><fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ssz" value="${ct.ctime}" timeZone="UTC"/></span>            
          			</div>
          			<div class="d-flex justify-content-between mb-0 align-items-center w-100">
          				<strong style="text-overflow: ellipsis; overflow: hidden;"><a href="/article.do?aid=${ct.aid}" class="text-info">
        				<c:choose>
						<c:when test="${ct.count == 0}">
							${ct.title}</a></strong>					
						</c:when>
						<c:otherwise>
							${ct.title}</a> [${ct.count}]</strong>
						</c:otherwise>
						</c:choose>          				
          			</div>
        		</div>
      		</div>
		</c:forEach>
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