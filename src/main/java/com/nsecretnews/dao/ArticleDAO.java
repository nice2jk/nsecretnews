package com.nsecretnews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ArticleDAO {
	
	public List<HashMap<String, Object>> getArticleListForMain();
	public List<HashMap<String, Object>> getArticleList(HashMap<String, Object> hashmap);
	public HashMap<String, Object> getArticle(@Param("aid") int aid);
	public String getArticlePw(@Param("aid") int aid);
	public int setArticle(HashMap<String, Object> hashmap);
	public void updateArticle(HashMap<String, Object> hashMap);
	public void updateViewCount(@Param("aid") int aid);
	public void deleteArticle(HashMap<String, Object> hashMap);
	public int checkArticlePw(HashMap<String, Object> hashMap);
	
	public List<HashMap<String, Object>> getCommentList(@Param("aid") int aid);
	/*public HashMap<String, Object> getComment(@Param("cid") int cid);*/
	public String getCommentUserId(@Param("cid") int cid);
	public void setComment(HashMap<String, Object> hashmap);
	public void updateComment(HashMap<String, Object> hashMap);
	public void deleteComment(@Param("cid") int cid);
	public void deleteComments(HashMap<String, Object> hashMap);
}
