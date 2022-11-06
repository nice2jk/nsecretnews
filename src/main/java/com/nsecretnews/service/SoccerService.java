package com.nsecretnews.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

import com.nsecretnews.dao.SoccerDAO;

@Service
public class SoccerService {
    
    @Autowired
    private SoccerDAO soccerDAO;

    public List<HashMap<String, Object>> getSoccerListForMain() {
        return soccerDAO.getSoccerForMain();
    }
}
