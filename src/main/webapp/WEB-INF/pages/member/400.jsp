<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>400</title>
</head>
<jsp:include page="../webnav.jsp" flush="true"></jsp:include>
<body>
<section class="section bg-gray">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center mx-auto">
                <div class="404-img">
                </div>
                <div class="404-content">
                    <h1 class="display-1 pt-1 pb-2">糟糕 !</h1>
                    <p class="px-3 pb-2 text-dark">Something went wrong,we can't find the page that you are looking for :(But there is a lot more for you!</p>
                    <a href="index.html" class="btn btn-info">GO HOME</a>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="ftco-footer bg-bottom ftco-no-pt"
		style="background-image: url('${pageContext.request.contextPath}/static/images/bg_3.jpg');">
		<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
</body>
</html>