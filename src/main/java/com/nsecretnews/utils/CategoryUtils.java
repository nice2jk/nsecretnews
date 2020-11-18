package com.nsecretnews.utils;

public class CategoryUtils {

	public static String getCategoryName(String categoryId) {
		if (categoryId.equals("recm")) {
            return "추천";
		} else if (categoryId.equals("board")) {
            return "자유게시판";
        } else if (categoryId.equals("xart")) {
            return "조공 모음";
        } else if (categoryId.equals("news")) {
            return "뉴스 모음";
        } else if (categoryId.equals("itct")) {
            return "IT 소식";
        } else if (categoryId.equals("movi")) {
            return "영화 소식";
        } else if (categoryId.equals("socc")) {
            return "축구 소식";
        } else if (categoryId.equals("base")) {
            return "야구 소식";
        } else if (categoryId.equals("girl")) {
            return "여성 시대";
        } else if (categoryId.equals("shop")) {
            return "쇼핑 모음";
        } else if (categoryId.equals("stoc")) {
            return "주식 추천";
        } else if (categoryId.equals("devp")) {
            return "개발자";
        }
		
		return "베스트";
	}
}
