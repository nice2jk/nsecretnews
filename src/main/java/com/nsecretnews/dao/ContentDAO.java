package com.nsecretnews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ContentDAO {
	
	public HashMap<String, Object> getContent(@Param("id") int id);
	public HashMap<String, Object> getBestContent(@Param("id") int id);
	public HashMap<String, Object> getRecommendContent(@Param("id") int id);
	
	public List<HashMap<String, Object>> getBestContentsForMain();
	public List<HashMap<String, Object>> getBestContents(HashMap<String, Object> hashmap);
	public List<HashMap<String, Object>> getRecommendContents(HashMap<String, Object> hashmap);
	public List<HashMap<String, Object>> getContents(HashMap<String, Object> hashmap);
	
	public void updateGrade(@Param("id") int id, @Param("grade") int grade);
	public void updateBestGrade(@Param("id") int id, @Param("grade") int grade);
	public void setGrade(@Param("id") int id);
	public void setBestGrade(@Param("id") int id);
	public void delGrade(@Param("id") int id);
	
}
