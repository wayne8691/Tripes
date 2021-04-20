package com.iii.trip.blogs.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iii.trip.blogs.model.CommentBean;
import com.iii.trip.blogs.model.DeputyCommentBean;
import com.iii.trip.blogs.service.CommentService;
import com.iii.trip.blogs.service.DeputyCommentService;
import com.iii.trip.blogs.service.serviceImpl.ArticleServiceImpl;
import com.iii.trip.member.model.MemberBean;


@Controller
public class DeputyCommentController {
	@Autowired
	DeputyCommentService deputyCommentService;
	
	@Autowired
	ArticleServiceImpl ArticleService;
	
	@Autowired
	CommentService commentService;
	
	//新增子留言
	@PostMapping("/saveSonComment.controller")
	public @ResponseBody Map<String, Object> savesoncomment(@RequestParam("resoncomment")String content,
			@RequestParam("pk") Integer pk,@SessionAttribute("loginuser") MemberBean member,Model m){
		Map<String, Object> map = new HashMap<String, Object>();
        System.out.println("========================================");
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		//搜尋父留言
		CommentBean commentBeanByPk = commentService.getCommentByPk(pk);
		//建立子留言
		DeputyCommentBean deputyCommentBean = new DeputyCommentBean(member.getUserid(),content,strDate);
		//將子留言丟到父留言
		commentBeanByPk.getDeputyCommentBeanComment_id().add(deputyCommentBean);
		m.addAttribute(member.getName());
		//儲存
		deputyCommentService.insert(commentBeanByPk);
		map.put("commentmembers","會員");
		
		return map;
		
	}
	

}
