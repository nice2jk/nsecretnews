package com.nsecretnews.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nsecretnews.dao.ArticleDAO;

@Service
public class ArticleService {

	@Autowired
	private ArticleDAO articleDAO;
	
	public List<HashMap<String, Object>> getArticleListForMain() {
		return articleDAO.getArticleListForMain();
	}
	
	public List<HashMap<String, Object>> getArticleList(HashMap<String, Object> hashmap) {
		return articleDAO.getArticleList(hashmap);
	}
	
	public HashMap<String, Object> getArticle(int aid) {
		articleDAO.updateViewCount(aid);
		HashMap<String, Object> responseMap = articleDAO.getArticle(aid);
		List<HashMap<String, Object>> commentList = articleDAO.getCommentList(aid);
		
		responseMap.put("comments", commentList);
		
		return responseMap;
	}
	
	@Transactional
	public void setComment(HashMap<String, Object> requestMap) {
		articleDAO.setComment(requestMap);
	}
	
	@Transactional
	public int setArticle(HashMap<String, Object> requestMap) {
		articleDAO.setArticle(requestMap);
		
		return Integer.valueOf(requestMap.get("aid").toString());
	}
	
	@Transactional
	public boolean deleteArticle(HashMap<String, Object> requestMap) {
		if(articleDAO.checkArticlePw(requestMap) == 1) {
			articleDAO.deleteArticle(requestMap);
			articleDAO.deleteComments(requestMap);
			return true;
		}
		
		return false;
	}
}
