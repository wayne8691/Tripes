<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<script>
window.onload=function(){


	var city_btn =document.getElementById("city_select");


	city_btn.onclick =function(){
		var xhr = new XMLHttpRequest();//AJAX����
		  var city = document.getElementById("citys").value
              console.log(city);

		  
	    xhr.open("GET","<c:url value='/controller/hotel' />"
	    	    +"?citys="+city ,true);//�e�X�ШD�����|
	    xhr.send();//�e�X�ШD

	    console.log("aaaa");
	    xhr.onreadystatechange =function(){
	    	
	    	if(xhr.readyState ==4 &&xhr.status ==200 ){    	//�B��server�e�^�Ӫ��ШD	
// 	    		dataArea.innerHTML ="<font color='red'>"+xhr.responseText+"</font>";
                
                 alert(xhr.responseText);

	    	}
	    	
	    	
	    }
	    
	}


function displayAllMember(text){
		
		var members =JSON.parse(text);
		var segment ="<table border='1'<tr><th>���</th>"+
		"<th>�|���N��</th><th>�|���m�W</th><th>�l�B</th><th>�ͤ�</th>";
		for(i=0;i<members.length;i++){
		var member = members[i];
		
		segment+="<tr><td>"+member.pk
		+"<td>"+member.id+"</td>"
		+"<td>"+member.name+"</td>"
		+"<td>"+member.balance+"</td>"
		+"<td>"+member.pk+"</td>"
		+"</tr>";
		
		}
		segment+="</table>";
		//dataArea.innerHTML =segment;
		//alert(member.pk+","+member.id+","+member.name)
		dataArea.innerHTML =segment;
	}




}




</script>


</head>
<body>
<label>�a��</label>
            <select id="citys" name="citys">
                 <option value="20210307155222872-e6a2b8d9-adfd-44e5-8d32-66d9276c8206">�x�_</option>
                 <option value="20210307155222929-76cc15b6-0e6e-491b-98db-ca1faf0ab8b1">�s��</option>
 </select>
 <button id='city_select'>�d�M</button>
 
 
 
 
 <div id="hotel">
 
 
 
 
 </div>
            
         
</body>
</html>