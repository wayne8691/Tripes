package com.iii.trip.blogs.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.service.ArticleService;
import com.iii.trip.member.model.MemberBean;

@Controller
public class ArticleFindViewController {

	@Autowired
	ArticleService articleService;
	
	@GetMapping("/showAllArticle")
	public String sendAllArticle() {
		return "/blogs/showArticle";
	}
	

	// 跳部落格首頁(使用者)
	@RequestMapping(path = "/userBlogHome.controller", method = RequestMethod.GET)
	public String blogHome(@SessionAttribute("loginuser") MemberBean member) {
		if (member.getUserid() == null) {
			return "member/login";
		}
		return "/blogs/showArticle";
	}

	//跳單筆文章傳PK值
		@GetMapping("/sendSingleArticle/{pk}")
		public String sendSingleArticle(@PathVariable Integer pk,@SessionAttribute("loginuser") MemberBean member, Model m) {
//			articleService.updateCount(id);
			m.addAttribute("pk", pk);
			
			m.addAttribute("id",member.getName());
			return "blogs/showSingleArticle";
		}
		
		// 跳部落格首頁(管理者)
		@RequestMapping(path = "/managerBlogHome.controller", method = RequestMethod.GET)
		public String BlogHome(Model m) {
			List<ArticleBean> al = articleService.queryArticle();
			m.addAttribute("al",al);
			return "/blogs/BlogHome";
		}

		// 跳新增文章頁面
		@RequestMapping(path = "/blogInsArtcle.controller", method = RequestMethod.GET)
		public String ArtBlogs() {
			return "/blogs/Article1";
		}
		
		
	
}
