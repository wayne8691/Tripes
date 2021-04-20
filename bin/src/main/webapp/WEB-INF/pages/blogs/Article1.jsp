<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginuser" class="com.iii.trip.member.model.MemberBean"
	scope="session"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增文章</title>
<meta name="robots" content="noindex, nofollow">
<jsp:include page="../webnav.jsp" flush="true"></jsp:include>
<script src="https://cdn.ckeditor.com/4.16.0/standard-all/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<FORM ACTION="saveArticle.controller" method="post" id="from1">
	<div>
		<label> 選擇子版:</label>
		<div>
			<select id="artsubversion" name="artsubversion">
				<option>旅遊新聞</option>
				<option>遊記</option>
			</select>
		</div>
		
		<label> 文章標題:</label>
		<div>
			<INPUT TYPE="TEXT" name="title" size="120" placeholder="填入文章標題" id="title">
		</div>

		<div>
			<label for="image"> 
				<font style="vertical-align: inherit;">上傳照片:</font>
			</label>
			<div class="form-group">
				<input type="file" onchange="readURL(this)" id="image" accept="image/gif, image/jpeg, image/png" class="form-control-file">
				<div id="image_div" style="display: none">
					<img id="image_img" src="#" width="350px" height="250px" />
				</div>
				<input type="hidden" name="image" id="image1" value="#">
			</div>

		</div>

		<div id="asd">
			<textarea cols="80" id="editor1" name="content" rows="10" style='visibility: visible;display:block;' ></textarea>
		</div>
		
		<input type="hidden" name="user" value="<%=loginuser.getUserid()%>">

		<button type='button' id="success" onclick="judge()">提交</button>
		<button type='button' id="quick">一鍵輸入</button>
		<button type="reset" name="reset">重填</button>
		<input type="button"value="回首頁" onclick="location.href='userBlogHome.controller'">
	</div>
	<script>
	CKEDITOR.replace('editor1', {
		extraPlugins : 'autogrow',
		autoGrow_minHeight : 200,
		autoGrow_maxHeight : 500,
		autoGrow_bottomSpace : 150,
		removePlugins : 'resize'
	});
	
	
	</script>

	</FORM>
</body>
<script>
var form = document.getElementById("from1");
function judge(){
	//Swal.fire('OK',"更改成功，請重新登錄!",'success').then(functionn(ss) 
		//	{if(ss){document.getElementbyId("from1").submit()}})

					
		
	swal({
		  title: "確定要送出嗎?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			   
			  swal({
  	    		  title: "即將送出文章",
  	    		  text: "發表成功!",
  	    		  icon: "success",
  	    		button: "OK",
	    		  
	    		})
	    		.then((willDelete) => {
	    			
	    			form.submit();
	    		 
	    		});
	
	           }

		});

}

var quickinsert = document.getElementById("quick");
quickinsert.onclick = function(){
	 var title = document.getElementById("title");
	 title.value = "台帛旅遊泡泡啟航業者搶商機 保險、刷卡、住宿有優惠"
	 var xx = "台帛旅遊泡泡首發團即將在4月1日啟航，周邊相關配套陸續到位，希望為旅遊泡泡加溫。各家產險業者都陸續因應防疫新旅遊型態，推出「旅行泡泡綜合保險」，銀行也推出相關刷卡優惠，還有業者因應帛琉旅遊泡泡檢測需求，搭配優惠住宿。"

		+"兆豐保險網路投保推出「旅行泡泡綜合保險」，除了基本的旅行平安、傷害醫療險50萬元、海外突發疾病醫療險100萬元，更包含保額400萬元海外緊急救援費用保險，若於旅行期間意外確診，需搭乘專機返國就可派上用場，且網路投保快速又便利，出發前一個小時皆可投保。以旅平險保額500萬元為例，台帛泡泡旅遊五天四夜行程保費2208元起。"

		+"為避免民眾於旅程中因意外疾病產生的經濟壓力，中國信託產險「旅行泡泡綜合保險」專案提供身故、意外醫療、海外突發緊急救援等完整綜合險保障，若因採檢陽性需包機返國，或發生重大傷病需搭乘專機返國等高額救援費用，提供400萬元的緊急救援費用等完整保障。 保費僅須2576元，即可擁有千萬保障。"

		+"兆豐銀行也率先宣布推出「旅遊泡泡快閃優惠」，即日起至4月底，凡刷兆豐任一信用卡購買旅遊泡泡國家機票團費單筆滿5萬元，登錄即可獲得市價3980元的「臺灣吧超萌行李箱」，另外還將抽出一名幸運兒，可獲得團費全額返現，最高可得88888元。此外，若搭配兆豐e秒happy卡，還可享雄獅、東南與易遊網三大旅行社最高5.5％現金回饋。"

	+"目前各家旅行社推出的帛琉團費，多半要6萬元起跳，因此可以選擇海外消費回饋較高的信用卡，將總體旅遊花費透過信用卡優惠節省下來。富邦 J卡原本海外消費僅有日本有 3%回饋，現在更加碼帛琉也比照3%回饋無上限，刷帛琉團費單筆刷滿 8萬，再享額外加碼 5%。此外，聯邦銀行賴點卡海外消費也是最高 3%回饋，現在刷指定旅行社團費享最高6期 0利率優惠，團費滿 6萬還有 1200元刷卡金回饋。"

		+"6月底前使用華南銀行信用卡於雄獅、巨大、KKday、鳳凰、五福、大榮等6家指定旅行業者購買旅遊商品，單筆消費滿6萬元，登錄送3千元刷卡金，相當於5%回饋率，持享利樂活combo卡或超級現金回饋卡既有1%現金回饋權益，回饋率高達6%。"

		+"因帛琉旅遊泡泡行程需提早4個小時至機場，進場後需做PCR檢測，無法再離開機場。新光板橋傑仕堡有氧酒店提供帛琉泡泡旅遊買一晚送一晚住房專案，只要於帛琉泡泡旅展購買帛琉行程，即可享優惠價$3600元。出國前可先入住傑仕堡商旅，隔日可從容自板橋啟程至機場；回程班機22:30抵台，返國後也可先至板橋傑仕堡住宿一晚後，再愉快輕鬆返家。";
		 
		 document.getElementById("asd").innerHTML = '<textarea cols="80" id="editor1" name="content" rows="10" style="visibility: visible;display:block;" >'+xx+'</textarea>';
		 
			CKEDITOR.replace('editor1', {
				extraPlugins : 'autogrow',
				autoGrow_minHeight : 200,
				autoGrow_maxHeight : 500,
				autoGrow_bottomSpace : 150,
				removePlugins : 'resize'
			});
		 
	 //console.log(content)
}	
</script>
</html>