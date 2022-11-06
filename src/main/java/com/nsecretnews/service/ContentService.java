package com.nsecretnews.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nsecretnews.common.Constants;
import com.nsecretnews.dao.CategoryDAO;
import com.nsecretnews.dao.ContentDAO;


@Service
public class ContentService {

	@Autowired
	private ContentDAO contentDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	public List<HashMap<String, Object>> getContentsForMain() {
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("category", "main");
		
		// category count
		categoryDAO.updateCategoryCount(requestMap);
				
		return contentDAO.getBestContentsForMain();
	}

	public List<HashMap<String, Object>> getRecommendContentsForMain() {
		return contentDAO.getRecommendContentsForMain();
	}
	
	@Transactional
	public List<HashMap<String, Object>> getContents(HashMap<String, Object> requestMap) {
		// category count
		categoryDAO.updateCategoryCount(requestMap);
		
		if(requestMap.get("category").equals(Constants.CATEGORY_RECOMMEND)) {
			return contentDAO.getRecommendContents(requestMap);
		} else if(requestMap.get("category").equals(Constants.CATEGORY_BEST)) {
			return contentDAO.getBestContents(requestMap);
		}
		
		return contentDAO.getContents(requestMap);
	}
	
	@Transactional
	public void setGrade(int id, int grade) {
		if(grade == Constants.GRADE_NORMAL) {
			HashMap<String, Object> contentMap = contentDAO.getRecommendContent(id);
			
			contentDAO.delGrade(id);
			
			if(contentMap.get("category").equals(Constants.CATEGORY_BEST)) {
				contentDAO.updateBestGrade(id, grade);
			} else {
				contentDAO.updateGrade(id, grade);
			}
		} else { // Recommend
			HashMap<String, Object> contentMap = contentDAO.getBestContent(id);
						
			if(contentMap == null) {
				contentMap = contentDAO.getContent(id);
								
				contentDAO.updateGrade(id, grade);				
				contentDAO.setGrade(id);
			} else {
				contentDAO.updateBestGrade(id, grade);				
				contentDAO.setBestGrade(id);
			}
		}
	}
}
