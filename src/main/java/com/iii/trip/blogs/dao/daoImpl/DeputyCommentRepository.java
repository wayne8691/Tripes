package com.iii.trip.blogs.dao.daoImpl;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.trip.blogs.model.CommentBean;
import com.iii.trip.blogs.model.DeputyCommentBean;

public interface DeputyCommentRepository extends JpaRepository<CommentBean, Integer> {

	
}
