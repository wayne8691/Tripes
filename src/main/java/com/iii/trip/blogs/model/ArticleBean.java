package com.iii.trip.blogs.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;


@Component
@Entity
@Table(name="Article")
public class ArticleBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ArticleID")
	private Integer articleid_pk;
	
	//commentBean的FK
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_comment_id", referencedColumnName = "articleid")
	private List<CommentBean> CommentBeanArticle_id=new ArrayList<CommentBean>();
	
	//文章標題
    @Column(name="Title")
	private	String title;
    
    //文章子版
    @Column(name="ArticleSubVersion")
    private String artsubversion;
    
    //文章內容
    @Column(name="Content1",columnDefinition = "nvarchar(MAX)")
    private String contenet;
    
    //計數
    @Column(name = "Click_count")
    private Integer artclickcount;
    
    //發文時間
    @Column(name = "PublishTime")
    private String publishtime;
    
    //使用者帳號
    @Column(name="userid")
    private String useridString;
    
    //圖片
    @Column(columnDefinition = "varbinary(MAX)")
	private byte[] image;
    
    @Transient
	private String image1;
    
    public ArticleBean()
	  {
	  }


	public String getUseridString() {
		return useridString;
	}


	public void setUseridString(String useridString) {
		this.useridString = useridString;
	}


	public ArticleBean(String contenet,String publishtime, String title, 
			 String useridString,String artsubversion) {
		super();
		this.title = title;
		this.contenet = contenet;
		this.publishtime = publishtime;
		this.useridString = useridString;
		this.artsubversion = artsubversion;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContenet() {
		return contenet;
	}


	public void setContenet(String contenet) {
		this.contenet = contenet;
	}


	public String getPublishtime() {
		return publishtime;
	}


	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}


	public Integer getArticleid_pk() {
		return articleid_pk;
	}


	public void setArticleid_pk(Integer articleid_pk) {
		this.articleid_pk = articleid_pk;
	}


	public List<CommentBean> getCommentBeanArticle_id() {
		return CommentBeanArticle_id;
	}


	public void setCommentBeanArticle_id(List<CommentBean> commentBeanArticle_id) {
		CommentBeanArticle_id = commentBeanArticle_id;
	}


	public String getArtsubversion() {
		return artsubversion;
	}


	public void setArtsubversion(String artsubversion) {
		this.artsubversion = artsubversion;
	}


	public Integer getArtclickcount() {
		return artclickcount;
	}


	public void setArtclickcount(Integer artclickcount) {
		this.artclickcount = artclickcount;
	}


	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}


	public String getImage1() {
		return image1;
	}


	public void setImage1(String image1) {
		this.image1 = image1;
	}

	

}
