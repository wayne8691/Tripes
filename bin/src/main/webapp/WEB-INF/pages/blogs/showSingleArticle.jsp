<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>文章</title>

<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/gijgo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/slicknav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogstyle/css/style.css">

   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.5/sweetalert2.min.js"></script>
   
   

<script>

var memid ="${id}";
var pk ="${pk}";



window.onload = function(){
	var id = document.getElementById("id");
	var xhr = new XMLHttpRequest();
	id.value=memid;
	xhr.open("GET", "<c:url value='/singlearticle.controller/" + pk + "' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "<div class='single-post'>";
			
			 article = JSON.parse(xhr.responseText);
			console.log(article)		
				content += "<div class='blog_details'>"+ "<h2>" + article.title+"</h2>"
				+"<ul class='blog-info-link mt-3 mb-4'>"
				+"<li>"+"<i>"+article.useridString+"</i>"+"</li>"
				+"<li>"+"<i>"+article.publishtime+"</i>"+"</li>"
				+"</ul>"
				+"<p class='excert'>"+article.contenet+"</p>"
				;
				
			content += "</div>";
			
			var divs = document.getElementById("singlearticle");
			divs.innerHTML = content;
			querycomment();
			
			}
		}
	}
function querycomment(){
	console.log(article.commentBeanArticle_id.length)
	var memberinfo = "<c:url value='/userprofile.controller' />";
	var savesoncomment = "<c:url value='/saveSonComment.controller' />";
	
	var comments = "<div class='comment-list'>";
	for(var i=0; i < article.commentBeanArticle_id.length; i++){
	
		//console.log(article.commentBeanArticle_id[i].comment)
		//console.log("aa")
		comments += "<div class='single-comment justify-content-between d-flex'>"
				+"<div class='user justify-content-between d-flex'>"
				//+"<div class='thumb'>"+"<img src='${loginuser.getImage1()}' alt='' class='' id='preview_progressbarTW_img' />"
				//+"</div>"
				+"<div class='desc'>"
				+"<p class='comment' style='background-color:#F0F0F0;'>"+article.commentBeanArticle_id[i].comment+"</p>"
					+"<div class='d-flex justify-content-between'>"
					+"<div class='d-flex align-items-center'>"
						+"<h5><a href='"+memberinfo+"'>"
						+"</a>"+article.commentBeanArticle_id[i].useridString+"</h5>" 
							+"<p class='date'>"+ article.commentBeanArticle_id[i].guesttime +"</p>"
					+"</div>"
					+"<div class='reply-btn'>"
					//回覆留言區塊
					+"<div class='flip'  onclick='slideToggle("+i+")' id="+i+"'>"+"<p class='replycontent'>"+'回覆'+"</p>"+"<br></div>"
					+"<div class='panel' id="+i+">"
					  +"<div class='row'>"
						+"<div>"
							+"<div >"
								+"<textarea  name='comment' id='resoncomment"+i+"' cols='15' rows='10' placeholder='歡迎大家留言，但請避免不雅字眼，具歧視及仇恨的言論，同時不要散播垃圾訊息，共同維持良好的交流。'>"
								+"</textarea>"
							+"</div>"
						+"</div>"
						+"<div >"
							+"<div >"
								+"<input type='hidden' name='name'  readonly>"
							+"</div>"
						+"</div>"
						+"<div >"
							+"<button type='submit' id='sendSonContent"+i+"' onclick='insertsoncomment("+i+")'>"+'回覆留言'
						    +"</button>"
						+"</div>"
					+"</div>"
					+"</div>"
					//回覆留言區塊到這
					+"</div>" //父DIV
					+"<span class='material-icons md-dark' id='moreoption"+i+"' onclick='morevertoption("+i+")'>more_vert</span>"
					+"</div>" 
					//子留言顯示區塊
					+"<div onclick='querysoncomment("+i+")'>"+'顯示'
					
					+"</div>"
					//子留言到這裡 以上都是子留言顯示區塊
				+"</div>"
				+"</div>"

				+"</div>";
		
	}
	comments += "</div>";
	

	var divs = document.getElementById("main-comment-empty");
	divs.innerHTML = comments;

}	



/*$(document).click(function(){
	console.log("aa")
	  $(".flip").click(function(){
	  $(".panel").slideToggle(250);
	  });
	});*/
	
//子留言
function querysoncomment(){

		console.log("1111")
		console.log(article.commentBeanArticle_id[0].deputyCommentBeanComment_id.length)
		var recomments = "<div class='comment-list'>";
		for(var i=0; i < article.commentBeanArticle_id.deputyCommentBeanComment_id.length; i++){
			
		
			//console.log(article.commentBeanArticle_id[i].comment)
			//console.log("aa")
			recomments += "<div class='single-comment justify-content-between d-flex'>"
					+"<div class='user justify-content-between d-flex'>"
					//+"<div class='thumb'>"+"<img src='${loginuser.getImage1()}' alt='' class='' id='preview_progressbarTW_img' />"
					//+"</div>"
					+"<div class='desc'>"

						
						
						//子留言顯示區塊
						+"<div>"+'顯示'
						+"<p class='comment' style='background-color:#F0F0F0;'>"+article.commentBeanArticle_id[i].deputyCommentBeanComment_id.replycontent+"</p>"
							+"<div class='d-flex justify-content-between'>"
								+"<div class='d-flex align-items-center'>"
								+"<h5><a href='"+memberinfo+"'>"
								+"</a>"+article.commentBeanArticle_id[i].deputyCommentBeanComment_id.useridString+"</h5>" 
									+"<p class='date'>"+ article.commentBeanArticle_id[i].deputyCommentBeanComment_id.replaytime +"</p>"
                            	+"</div>"
                        	+"</div>"
                        +"</div>"
						
						
					+"</div>"
					+"</div>"
					+"</div>";
			
		}
		recomments += "</div>";
		

		var divs = document.getElementById("main-comment-empty");
		divs.innerHTML = recomments;
	}		
	
	
	
	
function slideToggle(id){
		
		$("#"+id).slideToggle(250);
		
	}
	

	
function morevertoption(bb){
	console.log("11241212112214451212")
	console.log(article.commentBeanArticle_id.useridString)
	console.log(memid)
	console.log(pk)
	console.log("1122222222222222222222222222")
	
	if(memid != article.commentBeanArticle_id.useridString){
		swal({
			 
			  input: 'select',
			  inputOptions: {
			    'SRB': '檢舉留言'
			  }
			  
			  
			}).then(function (result) {
				swal({
					  input: 'select',
					  inputOptions: {
					    'WASH': '洗版'
					  },
					  inputPlaceholder: '請選擇選項',
					  showCancelButton: true,
					  inputValidator: function (value) {
					    return new Promise(function (resolve, reject) {
					      if (value == 'WASH') {
					        resolve()
					      }else {
					        reject('你選擇了洗版 :)')
					      }
					    })
					  }
				})
	})
	}
	else{
		swal({
			  input: 'select',
			  inputOptions: {
			    'SRB': '檢舉留言',
			    'UKR': '刪除留言',
			    'HRV': '編輯留言'
			  },
			  inputPlaceholder: '請選擇選項',
			  showCancelButton: true,
			  inputValidator: function (value) {
			    return new Promise(function (resolve, reject) {
			      if (value === 'UKR') {
			        resolve()
			      } else {
			        reject('You need to select Ukraine :)')
			      }
			    })
			  }
			}).then(function (resultoption) {
			  swal({
			    type: 'success',
			    html: 'You selected: ' + result
			  })
			})
	}

	
}


	
</script>

</head>
<body>
<div class="bradcam_area bradcam_bg_4">
      <div class="container">
          <div class="row">
              <div class="col-xl-12">
                  <div class="bradcam_text text-center">
                      <h3>Single blog</h3>
                      <p>Pixel perfect design with awesome contents</p>
                  </div>
              </div>
          </div>
      </div>
  </div>
<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post" id="singlearticle">
						<div class="blog_details">
							
							<ul class="blog-info-link mt-3 mb-4">
								<li><i class="fa fa-comments" id="useridString"></i></li>
								<li><i class="fa fa-comments" id="publishtime"></i></li>
							</ul>
							<p class="excert" id="content"></p>
						</div>
					</div>
					<!-- 喜歡標籤和分享超連結 -->
					<div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                     </ul>
                  </div>
                  <!-- 上下篇文章 -->
                  <div class="navigation-area">
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                       <!--   <a href="#">
                                 <img class="img-fluid" src="img/post/preview.png" alt="">
                              </a> --> 
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>Prev Post</p>
                              <a href="#">
                                 <h4>Space The Final Frontier</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>Next Post</p>
                              <a href="#">
                                 <h4>Telescopes 101</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                      <!--      <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="img/post/next.png" alt="">
                              </a>
                           </div> -->
                        </div>
                     </div>
                  </div>
               </div>
               
               <!-- 留言顯示區塊 -->
               <div class="comments-area">
                  <h4  ><b>旅人交流</b>
                  	<p>留下您的想法</p></h4>
                  	<div id="main-comment-empty">
                  		<div class="comment-list">
                     		<div class="single-comment justify-content-between d-flex">
                        		<div class="user justify-content-between d-flex">
                     		      <div class="desc">
                        		   <!-- 這個P是留言內容 -->
                            		<p class="comment" >
                               		
                              		</p>
                              		<div class="d-flex justify-content-between">
                                 		<div class="d-flex align-items-center">
                                    		<h5>
                                       			<p id="id"></p>
                                    		</h5>
                                    		<p class="date" id="gueasttime"></p>
                                 		</div>
                                    	<div class="reply-btn">
                                    			<div class='flip'><p>回覆</p><br></div>
					
                                		</div>
                                 	</div>
                           		</div>
                        	</div>
                     </div>
                  </div>
                  </div>
               </div>
               <!-- 留言區塊 -->
               <div class="comment-form">
                  <h4>留言</h4>
                 
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9"
                                 placeholder="寫下您的評論"></textarea>
                                 <span id="nocomment"></span>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="id" value="${id}" readonly>
                           </div>
                        </div>
                        
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn" id="sendComment">送出留言</button>
                     </div>
                     	
                  </div>
               </div>
               <div id="comment-empty"></div>
               <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget search_widget">
                     <form action="#">
                        <div class="form-group">
                           <div class="input-group mb-3">
                              <input type="text" class="form-control" placeholder='Search Keyword'
                                 onfocus="this.placeholder = ''" onblur="this.placeholder = '輸入關鍵字'">
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
                              <p>(21)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Health Care</p>
                              <p>(21)</p>
                           </a>
                        </li>
                     </ul>
                  </aside>
                  <aside class="single_sidebar_widget popular_post_widget">
                     <h3 class="widget_title">最新文章</h3>
                     <div class="media post_item">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>From life was you fish...</h3>
                           </a>
                           <p>January 12, 2019</p>
                        </div>
                     </div>
                     <div class="media post_item">
                    
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>The Amazing Hubble</h3>
                           </a>
                           <p>02 Hours ago</p>
                        </div>
                     </div>
                     <div class="media post_item">
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>Astronomy Or Astrology</h3>
                           </a>
                           <p>03 Hours ago</p>
                        </div>
                     </div>
                     <div class="media post_item">
           
                        <div class="media-body">
                           <a href="single-blog.html">
                              <h3>Asteroids telescope</h3>
                           </a>
                           <p>01 Hours ago</p>
                        </div>
                     </div>
                  </aside>
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
                
               </div>
            </div>
			</div>
		</div>
	</section>
	
<script src="${pageContext.request.contextPath}/blogstyle/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="${pageContext.request.contextPath}/blogstyle/js/vendor/jquery-1.12.4.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/popper.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/isotope.pkgd.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/ajax-form.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/waypoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.counterup.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/imagesloaded.pkgd.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/scrollIt.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.scrollUp.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/wow.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/nice-select.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.slicknav.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.magnific-popup.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/plugins.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/gijgo.min.js"></script>

   <!--contact js-->
   <script src="${pageContext.request.contextPath}/blogstyle/js/contact.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.ajaxchimp.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.form.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/jquery.validate.min.js"></script>
   <script src="${pageContext.request.contextPath}/blogstyle/js/mail-script.js"></script>

   <script src="${pageContext.request.contextPath}/blogstyle/js/main.js"></script>
<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
</body>
<script>
//var memid ="${id}";
var savecomment = document.getElementById("sendComment");

savecomment.onclick = function(){
var comment = document.getElementById("comment").value;
var div0 = document.getElementById("comment-empty");
var xhr = new XMLHttpRequest();
console.log("1111")
xhr.open("POST", "<c:url value='/savecomment.controller' />", true);

xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
xhr.send("comment="+comment+"&id="+memid+"&pk="+pk);
Swal.fire({
	  
	  icon: 'success',
	  title: '回覆成功',
	  showConfirmButton: false,
	  timer: 1500
	})
console.log("2222")
}

function insertsoncomment(aa){
	var id =article.commentBeanArticle_id[aa].comment_id;
	var resoncomment = document.getElementById("resoncomment"+aa).value;
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "<c:url value='/saveSonComment.controller' />", true);

	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send("resoncomment="+resoncomment+"&pk="+id);
	
}


</script>
</html>