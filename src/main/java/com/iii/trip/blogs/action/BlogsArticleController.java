package com.iii.trip.blogs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.iii.trip.attractions.model.AttractionsBean;
import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.service.ArticleBlogService;
import com.iii.trip.blogs.service.serviceImpl.ArticleServiceImpl;
import com.iii.trip.member.model.MemberBean;

@Controller
@SessionAttributes({ "article","totalPages", "totalElements" })
public class BlogsArticleController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse res;
	@Autowired
	ArticleServiceImpl service;
	
	@Autowired
	private ArticleBlogService articleBlogService;

	

//	// 跳查詢.刪除頁面
//	@RequestMapping(path = "/blogArtcle.controller", method = RequestMethod.GET)
//	public String inDexBlogs() {
//		return "/blogs/Index";
//	}

	// 進入修改頁面
	@RequestMapping(path = "/blogUpdateArtcle.controller", method = RequestMethod.GET)
	public String indexUpdateBlogs(@RequestParam("id") String id, @RequestParam(name = "title") String title,
			@RequestParam(name = "content") String content, Model m) {
		m.addAttribute("id", id);
		m.addAttribute("title", title);
		m.addAttribute("content", content);
		return "/blogs/Update";
	}

	// 新增
	@PostMapping(path = "/saveArticle.controller")
	public  String articleAction(@RequestParam String content,@RequestParam String title,@RequestParam String artsubversion, 
			@SessionAttribute("loginuser") MemberBean memben, Model m,@RequestParam("image") MultipartFile files) {
		System.out.println("新增印這裡");
		
		
		

		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
	


		ArticleBean reg_article = new ArticleBean(content, strDate, title, memben.getUserid(),artsubversion);
		
		service.saveArticle(reg_article);
		m.addAttribute("reg_article", reg_article);
		return "/blogs/showArticle";
	}

	// 刪除文章
	@DeleteMapping("/artremove.controller/{pk}")
	public @ResponseBody Map<String, Object> articleRemove(@PathVariable("pk") Integer pk) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Integer i =	service.deleteArticle(pk);
		if ( i == -1) {
			map.put("fail", "該筆資料不存在");
		} else if  ( i == 1) {
			map.put("success", "刪除成功");
		}
		return map;

	}

	// 修改文章ByPk
	@PutMapping("/artupdate.controller/{pk}")
	public @ResponseBody Map<String, Object> articleUpdate(@PathVariable("pk") Integer pk,
			@RequestBody ArticleBean articleBean ,Model m) {
		Map<String, Object> map = new HashMap<>();
		
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		
		try {
			service.updateArticle(articleBean);
			map.put("success", "修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "修改失敗");
		}
		m.addAttribute(strDate);
		//m.addAttribute("id", up_article);
		return map;
		
	}

	// 查詢
	@GetMapping("/article.controller")
	public @ResponseBody List<ArticleBean> getAllArticle() {
		return service.queryArticle();
	}

	// 查詢所有按時間排序
	@GetMapping("/articleOrderByTime.controller")
	public @ResponseBody List<ArticleBean> getAllArticleOrderByTime() {
		return service.queryArticleOderbytime();
	}
	
	//查詢所有(前五筆)按時間排序
	@PostMapping("/findAllArtilceByPublishtimeDesc")
	@ResponseBody
	    public List<ArticleBean> findAllArtilceByPublishtimeDesc() {
	    	System.out.println(articleBlogService.findAllByPublishtimeDesc());
	    	
	    	return articleBlogService.findAllByPublishtimeDesc();
	    }

	// 查詢單筆
	@GetMapping(value = "/singlearticle.controller/{pk}")
	public @ResponseBody ArticleBean getArticle(@PathVariable("pk") Integer pk) {
		return service.getArticleBeanByPkey(pk);
	}
	
	//分頁
	@PostMapping("/querryAllArticlePage.controller/{pageNo}")
	public @ResponseBody List<ArticleBean> querryAllArticlePage(@PathVariable(name = "pageNo") int pageNo, Model m){
		
		int pageSize = 9;
    	Pageable pageable = PageRequest.of(pageNo-1, pageSize);
    	Page<ArticleBean> page = articleBlogService.findAllByPage(pageable);
    	
    	int totalPages = page.getTotalPages();
    	long totalElements = page.getTotalElements();
    	m.addAttribute("totalPages", totalPages);
    	m.addAttribute("totalElements", totalElements);
		
		
		return page.getContent();
	}
	
	//搜尋文章
		@GetMapping("/findArticlebytitle.controller")
		public List<ArticleBean> processFindArticleByTitle(@RequestParam(name = "title") String title){
			return articleBlogService.findTitle(title);
		}
	
	

	

	
}
