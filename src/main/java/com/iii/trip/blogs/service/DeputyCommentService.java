package com.iii.trip.blogs.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.trip.blogs.dao.daoImpl.DeputyCommentRepository;
import com.iii.trip.blogs.model.CommentBean;

@Service
@Transactional
public class DeputyCommentService {
	
	@Autowired
	private DeputyCommentRepository deputyCommentRepository;
	
	public CommentBean insert(CommentBean commentBean) {
		
		return deputyCommentRepository.saveAndFlush(commentBean);
		
		}

}
