package com.nsecretnews.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SoccerDAO {

    public List<HashMap<String, Object>> getSoccerForMain();
}
