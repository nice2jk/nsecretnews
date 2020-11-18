package com.nsecretnews.controller.rest;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
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
		System.out.println("getArticles" + " : " + offset + ", " + search);
		
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
		System.out.println("article write");
		
		return articleService.setArticle(requestMap);
	}
	
}
