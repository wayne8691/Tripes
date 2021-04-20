package com.iii.trip.blogs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.trip.blogs.model.ArticleBean;
import com.iii.trip.blogs.model.CommentBean;
import com.iii.trip.blogs.service.ArticleService;
import com.iii.trip.blogs.service.serviceImpl.ArticleServiceImpl;
import com.iii.trip.blogs.service.serviceImpl.CommentServiceImpl;
import com.iii.trip.member.model.MemberBean;

@Controller
@SessionAttributes
public class CommentController {
	@Autowired
	CommentServiceImpl commentService;
	@Autowired
	ArticleServiceImpl ArticleService;
	
	@Autowired
	MemberBean member;
	
	//跳留言CommentController
	@RequestMapping(path = "/commentInsert.controller",method = RequestMethod.GET)
	public String Comments(@SessionAttribute("loginuser") MemberBean member,Model m) {
		m.addAttribute("id",member.getName());
		return "/blogs/commentController";
	}
	//跳留言首頁
	@RequestMapping(path ="/commentHome.controller" ,method = RequestMethod.GET)
	public String CommentHome(@SessionAttribute("loginuser") MemberBean member) {
		if (member.getUserid() == null) {
			return "member/login";
		}
		return "/blogs/Commentmessage";
	}
	
	
	//新增留言
	@PostMapping("/savecomment.controller")
	public @ResponseBody Map<String, Object> savecomment(@RequestParam("comment")String comment,@RequestParam("id") String id,
			@RequestParam("pk") Integer pk,@SessionAttribute("loginuser") MemberBean member,Model m){
		Map<String, Object> map = new HashMap<String, Object>();
         
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		ArticleBean articleBeanByPkey = ArticleService.getArticleBeanByPkey(pk);
		
		CommentBean commentBean = new CommentBean(comment,strDate,member.getUserid());
		
		articleBeanByPkey.getCommentBeanArticle_id().add(commentBean);
		m.addAttribute(member.getName());
		commentService.insertComment(articleBeanByPkey);
		map.put("commentmembers","會員");
		System.out.println("新增完成");
		return map;
	}

	//查詢
	@GetMapping("/searchComment.controller")
	public @ResponseBody List<CommentBean> getAllComment(){
		
		return commentService.getAllComment();
	}
	
	
	//修改
	@PostMapping("/commentUpdate.controller")
	public @ResponseBody Map<String, Object> commentUpdate(@RequestParam("id") Integer id, @RequestParam("comment") String comment, Module m ){
		Map<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}
}
