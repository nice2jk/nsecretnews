package com.nsecretnews.controller.rest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nsecretnews.service.ArticleService;

@RestController
public class ArticleAPI {

	@Autowired
	private ArticleService articleService;
	
	@GetMapping("/articles")
	@ResponseBody
	public HashMap<String, Object> getArticles(
		@RequestParam(value="offset", required=true, defaultValue="0") int offset,
		@RequestParam(value="search", required=false) String search) {
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());

		System.out.println(formatter.format(date) + " - getArticles" + " : " + offset + ", " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		requestMap.put("contentList", articleService.getArticleList(requestMap));
		
		return requestMap; 
	}
	
	@GetMapping("/article")
	@ResponseBody
	public HashMap<String, Object> getArticle(
			@RequestParam(value="aid", required=true) int aid) {
		System.out.println("getArticle" + " : " + aid);
		
		return articleService.getArticle(aid);
	}
	
	@PostMapping("/comment")
	public void setComment(
			@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("comment write");
		
		articleService.setComment(requestMap);
	}

	@PostMapping("/article")	
	public int writeArticle(
			@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("Write Article");
		
		return articleService.setArticle(requestMap);
	}
	
	@DeleteMapping("article")
	public ResponseEntity<String> deleteArticle(
			@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("Delete Article " + requestMap.get("aid") + ":" + requestMap.get("apw"));
		
		if(articleService.deleteArticle(requestMap)) {
			return new ResponseEntity<>(HttpStatus.OK);	
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
}
