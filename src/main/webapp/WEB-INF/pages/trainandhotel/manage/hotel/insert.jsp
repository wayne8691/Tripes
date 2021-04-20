<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
	List<City> cityList = request.getAttribute("cityList") != null ? (List<City>) request.getAttribute("cityList")
		: new ArrayList<>();
	List<HotelFacility> hfList = request.getAttribute("hotelFacilityList") != null ? (List<HotelFacility>) request.getAttribute("hotelFacilityList")
		: new ArrayList<>();
	List<HotelTag> tagList = request.getAttribute("tagList") != null ? (List<HotelTag>) request.getAttribute("tagList")
		: new ArrayList<>();
%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<title>新增旅館</title>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
	<div class="content-body">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
			<div class="card-body">
				<h1>新增旅館</h1> <div class="click100 btn btn-dark mb-2">快速輸入</div>
			</div>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="basic-form">
								<form action=./insert method="post" enctype="multipart/form-data">
									<h4 class="card-title">所在縣市:</h4>
									<div class="basic-form">
										<div class="form-group">
											<select class="form-control" id="sel1" name="cityId">
												<%
													for (City city : cityList) {
														out.print("<option value='" + city.getId() + "'>" + city.getName() + "</option>");
													}
												%>
											</select>
										</div>
										<h4 class="card-title">旅館名稱:</h4>
										<div class="form-group">
											<input type="text" name="name" class="form-control input-default" id="name" placeholder="" required>
										</div>
										<h4 class="card-title">旅館地址:</h4>
										<div class="form-group">
											<input type="text" name="address" class="form-control input-default" id="address" placeholder="" required>
										</div>
										<h4 class="card-title">飯店介紹：</h4>
										<div class="form-group">
											<textarea class="form-control h-150px" rows="6" id="comment" name="intro"></textarea>
										</div>									
										<h4 class="card-title">飯店電話：</h4>
										<div class="form-group">
											<input type="text" name="phone"	class="form-control input-default" id="phone" placeholder="">
										</div>
										<div class="row">
										<h4 class="card-title">飯店提供服務：</h4>
                                            <div class="col">
										<%
											for (HotelFacility hf : hfList) {
										%>
												<div class="form-group">
													<div class="form-check form-check-inline">
														<label class="form-check-label" style="color:black;">
															<input type="checkbox" name="hotelFacility" class="form-check-input" value="<%=hf.getId()%>"  > <%=hf.getName() %>
														</label>
													</div>
												</div>
										<%
											}
										%>
											</div>
											<h4 class="card-title">飯店標籤：</h4>
                                            <div class="col">
											<%
												for (HotelTag tag : tagList) {
											%>
												<div class="form-group">
													<div class="form-check form-check-inline" style="color:black;">
														<label class="form-check-label" style="color:black;">
															<input type="checkbox" name="hotelTags" class="form-check-input" value="<%=tag.getId()%>"> <%=tag.getName() %>
														</label>
													</div>
												</div>
											<%
												}
											%>
											</div>
										</div>
										<hr />
										<h4 class="card-title">旅館照片：</h4>
										<div class="basic-form">
											<div class="form-group">
												<input type="file" name="pic" id="file" class="form-control-file">
											</div>
										</div>
										<div class="col-auto">
											<button type="submit" class="btn btn-dark mb-2">確定</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
		$(document).ready(function(){
			$(".click100").click(function(){	
				$("#name").val('大倉久和大飯店');
				$("#address").val('中山區南京東路一段9號');
				$("#comment").val('台北市繁華中心飯店位於深具日本歷史淵源、日本商社匯聚的台北市南京中山商圈，為金融商務與購物休閒娛樂區域中心，坐擁商務大廈、國際精品店、餐廳的繁華地段；中山北路沿途大道濃廕庇天、景觀優美，各國大使館與異國餐廳匯聚，最能感受台北市潮流脈動。\n'+
						'現代經典空間 蘊藏大倉文化傳承\n'+
						'大倉久和大飯店為日本大倉飯店 (Okura Hotels & Resorts) The Okura 品牌的 Prestige 系列飯店，整體空間規劃以現代經典 ( Modern Classic ) 為風格原型，沉穩奢華地在西方設計空間中，蘊藏著傳統日本優雅纖細的脈絡，呈現功能與美學之間的平衡，傳達日本追求自然和諧的概念文化特色。穿梭於自在舒適的空間中，更有承襲源自東京大倉以「親切」與「和」為主的服務精神，延續大倉飯店五十年細膩款待貴客之道。\n'+
						'奢華住宿體驗 豐富生活享樂風尚\n'+
						'飯店擁有208間配備先進的客房與套房，挑高設計的空間完美結合現代經典裝潢與日式功能美學，盡享寧靜舒適的住宿氛圍；房客同時能享受專業健身房、頂樓露天溫水游泳池、SPA與三溫暖等設備，紓緩身體與心靈。飯店內並擁有多功能宴會場地，皆由專業服務人員細心依照貴賓需求，客製化喜慶婚宴與專業會議規劃，為舉辦各式重要宴會與會議的場地首選。');
				$("#phone").val('022222222');
			});
			
		});
		
	</script>
	
</body>

</html>