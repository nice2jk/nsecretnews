package com.nsecretnews.controller.rest;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nsecretnews.service.ContentService;
import com.nsecretnews.service.SoccerService;

@RestController
public class ContentAPI {

	@Autowired
	private ContentService contentService;

	@Autowired
	private SoccerService soccerService;
	
	@GetMapping("/contents")
	@ResponseBody
	public HashMap<String, Object> getCotents(
			@RequestParam(value="category", required=true, defaultValue="best") String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search) {
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		
		System.out.println(formatter.format(date) + " - Content : " + category + ", offset = " + offset + ", search = " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		requestMap.put("category", category);
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		requestMap.put("contentList", contentService.getContents(requestMap));
		
		return requestMap;		
	}

	@GetMapping("/soccerepl")
	@ResponseBody
	public HashMap<String, Object> getSoccerEpl(
			@RequestParam(value="category", required=true, defaultValue="EPL") String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search) {
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		
		System.out.println(formatter.format(date) + " - Soccer : " + category + ", offset = " + offset + ", search = " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		requestMap.put("category", category);
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		requestMap.put("contentList", soccerService.getSoccerEpl(requestMap));
		
		return requestMap;		
	}
	
	@PostMapping("/grade")
	public void grade(
			@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("grade " + requestMap);
		
		contentService.setGrade((int)requestMap.get("id"), (int)requestMap.get("grade"));
	}
}
