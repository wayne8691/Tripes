package com.iii.trip.blogs.dao.daoImpl;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iii.trip.blogs.model.ArticleBean;

public interface ArticleRepository extends JpaRepository<ArticleBean, Integer> {
	//搜尋
	@Query(value = "from ArticleBean Where title like concat('%', ?1, '%')",nativeQuery = false)
	public List<ArticleBean> findTitle(String title);
	
	//瀏覽最新五筆(最新文章)
	List<ArticleBean> findTop5ByOrderByPublishtimeDesc();
	
//	//顯示分類
//	@Query(value = "from ArticleBean Where artsubversion ")
//	List<ArticleBean> findByGroupByArtsubversion();

}
