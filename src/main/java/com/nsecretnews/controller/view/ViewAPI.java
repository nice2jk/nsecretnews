package com.nsecretnews.controller.view;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nsecretnews.service.ArticleService;
import com.nsecretnews.service.ContentService;
import com.nsecretnews.service.SoccerService;
import com.nsecretnews.utils.CategoryUtils;

@Controller
public class ViewAPI {

	@Autowired
	private ContentService contentService;
	
	@Autowired
	private ArticleService articleService;

	@Autowired
	private SoccerService soccerService;
	
	
	@RequestMapping(value={"/", "main"}, method = RequestMethod.GET)
	public String getMain(Model model) {
		// System.out.println("Main : " + new Date());
		
		model.addAttribute("contentList", contentService.getContentsForMain());
		model.addAttribute("articleList", articleService.getArticleListForMain());
		model.addAttribute("recmdList", contentService.getRecommendContentsForMain());
		model.addAttribute("soccerList", soccerService.getSoccerListForMain());

		return "main";
	}

	@RequestMapping(value = "/ads.txt")
	@ResponseBody
	public String adstxt(HttpServletResponse response) {
		String fileName = "ads.txt";
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
		String content = "google.com, pub-3843225232663919, DIRECT, f08c47fec0942fa0";
		return content;
	}
	
	@GetMapping("/contents.do")
	public String getContents(
			@RequestParam(value="category", required=true, defaultValue="best") String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search,
			Model model) {
		//System.out.println("Contents do " + search);
		
		model.addAttribute("category", category);
		model.addAttribute("offset", offset);
		model.addAttribute("search", search);
		model.addAttribute("categoryName", CategoryUtils.getCategoryName(category));		
		
		return "contents";
	}

	@GetMapping("/soccerepl.do")
	public String getSoccerEpl(
			@RequestParam(value="category", required=true, defaultValue="all") String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search,
			Model model) {
		// System.out.println("soccerepl do " + search);
		
		model.addAttribute("category", category);
		model.addAttribute("offset", offset);
		model.addAttribute("search", search);
		
		return "soccer";
	}
	
	@GetMapping("/articles.do")
	public String getArticles(
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search,
			Model model) {
		// System.out.println("articles do");
		
		model.addAttribute("offset", offset);
		model.addAttribute("search", search);
		
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
