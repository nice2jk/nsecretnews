package com.nsecretnews.controller.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nsecretnews.service.ArticleService;
import com.nsecretnews.service.ContentService;
import com.nsecretnews.utils.CategoryUtils;

@Controller
public class ViewAPI {

	@Autowired
	private ContentService contentService;
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String getMain(Model model) {
		System.out.println("Main");
		
		model.addAttribute("contentList", contentService.getContentsForMain());
		model.addAttribute("articleList", articleService.getArticleListForMain());
		
		return "main";
	}
	
	@GetMapping("/contents.do")
	public String getMain(
			@RequestParam(value="category", required=true, defaultValue="best") String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			Model model) {
		System.out.println("Contents do");
		
		model.addAttribute("category", category);
		model.addAttribute("offset", offset);
		model.addAttribute("categoryName", CategoryUtils.getCategoryName(category));
		
		return "contents";
	}
	
	@GetMapping("/articles.do")
	public String getArticles(
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,			
			Model model) {
		System.out.println("articles do");
		
		model.addAttribute("offset", offset);
		
		return "articles";
	}
	
	@GetMapping("/article.do")
	public String getArticle(
			@RequestParam(value="aid", required=true) int aid,
			Model model) {
		System.out.println("article do");
		
		model.addAttribute("aid", aid);
		
		return "article";
	}
	
	@GetMapping("/write.do")
	public String write() {
		System.out.println("wrtie do");
				
		return "write";
	}
	
	
}
