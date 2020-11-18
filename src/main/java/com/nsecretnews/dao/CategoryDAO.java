package com.nsecretnews.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CategoryDAO {

	public void updateCategoryCount(HashMap<String, Object> hashmap);
}
