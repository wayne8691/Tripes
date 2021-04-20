<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ include file="/WEB-INF/pages/blogs/importblogcsshead.jsp"%>
	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blog Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
 .igg{
 width:250px;
 height:300px;
 }
</style>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>
<script>
window.onload = function() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='article.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "<article class='blog_item'>";
			var article = JSON.parse(xhr.responseText);
			for(var i=0; i < article.length; i++){
				var singleArticle = "<c:url value='/sendSingleArticle/' />";
				content += "<div class='blog_details'>"+"<a href='"+ singleArticle+ article[i].articleid_pk + "'>" 
				+ "<h2>" + article[i].title+"</h2>"
				+"</a>"
				+"<p><i class='fa fa-comments'>"+article[i].publishtime+"</i></p>"
				+"</div>";
				}
			content += "</article>";
			var divs = document.getElementById("article");
			showArticleByTime();
			divs.innerHTML = content;
			}
		}
}

function showArticleByTime(){
	var xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='articleOrderByTime.controller' />", true);
	xhr1.send();
	
	xhr1.onreadystatechange = function() {
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			var content1 = "<div class='media-body'>";
			var article = JSON.parse(xhr1.responseText);
			for(var i=0; i < article.length; i++){
				console.log(article[i].title)
				console.log(i)
				var singleArticle = "<c:url value='/sendSingleArticle/' />";
				content1 += "<a href='"+ singleArticle+ article[i].articleid_pk + "'>" 
						+ "<h3>" + article[i].title +"</h3></a>"
						+"<p>"+article[i].publishtime+"</p>"
						;
				}
			content1 += "</div>";
			var div2 = document.getElementById("recentaArticle");
			div2.innerHTML = content1;
			}
	}
}

</script>
<body>
 <!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>blog</h3>
                        <a href="blogInsArtcle.controller"><button class="btn btn-primary">建立文章</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->


    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar" id="article">
                        <article class="blog_item">
                        	<div class="blog_item_img">
                               <!--   <img class="card-img rounded-0" src="img/blog/single_blog_5.png" alt="">-->
                            </div>
                            <div class="blog_details">
                                <p></p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i>會員名字</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 顯示留言數量</a></li>
                                </ul>
                            </div>
                        </article>
			           <!-- 分頁  -->
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">搜尋</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">分類</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Resaurant food</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Travel news</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Modern technology</p>
                                        <p>(03)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Product</p>
                                        <p>(11)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Inspiration</p>
                                        <p>21</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Health Care (21)</p>
                                        <p>09</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>
                     <!-- 最近PO文   -->
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">最新文章</h3>
                        <div id="recentaArticle"></div>
                            
                            <div class="media post_item" >
                                <div class="media-body">
                                    
                                </div>
                            </div>
                           
                        </aside>
                                             <!-- TAG標籤 -->
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside>
                           <!-- 訂閱標籤 -->
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">搜尋</button>
        </div>
      </div>
    </div>
  </div>
   <%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
  <%@ include file="/WEB-INF/pages/blogs/importblogbody.jsp"%>
</body>
</html>