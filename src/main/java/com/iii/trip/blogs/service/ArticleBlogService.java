package com.iii.trip.blogs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.iii.trip.blogs.dao.daoImpl.ArticleRepository;
import com.iii.trip.blogs.model.ArticleBean;

@Service
@Transactional
public class ArticleBlogService {
	
	@Autowired
	ArticleRepository articleRepository;
	
	public void searchComment() {
		
	}
	
	public Page<ArticleBean> findAllByPage(Pageable pageable){
		return articleRepository.findAll(pageable);
	}
	
	public List<ArticleBean> findTitle(String title){
		return articleRepository.findTitle(title);
	}
	
	public List<ArticleBean> findAllByPublishtimeDesc() {
		return articleRepository.findTop5ByOrderByPublishtimeDesc();
	}
	
	//顯示分類
//	public List<ArticleBean> findAllByArtsubversion(){
//		return articleRepository.findByGroupByArtsubversion();
//	}

}
