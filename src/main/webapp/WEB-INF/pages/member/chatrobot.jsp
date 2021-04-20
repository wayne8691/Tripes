<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom messanger</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
    <!--    libs for stomp and sockjs-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!--    end libs for stomp and sockjs-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/css/chatcss/style.css" rel="stylesheet">
    <script>
    window.onload = function(){
    	dialog=document.getElementById("dialog");
    	x=document.getElementById("x");
    	registration();
    }
    </script>
</head>
<body>
<!-- <div class="container clearfix"> -->
	<input id="userName" placeholder="search" type="hidden" value="${loginuser.getUserid()}"/>
<!--     <div class="people-list" id="people-list"> -->
<!--         <div class="search"> -->
<%--             <input id="userName" placeholder="search" type="text" value="${loginuser.getUserid()}"/> --%>
<!--             <button onclick="registration()">Enter the chat</button> -->
<!--             <button onclick="fetchAll()">Refresh</button> -->
<!--             <button onclick="clearAll()">clear</button> -->
<!--         </div> -->
<!--         <ul class="list" id="usersList"> -->


<!--         </ul> -->
<!--     </div> -->
<button id="btnn" class="chatimgg leftbottom" onclick="showDialog();"> <img alt="avatar" height="80px"
                 src="${pageContext.request.contextPath}/images/rounded.svg"
                 width="80px"/></button>

  
    <div class="chat dialog" id="dialog">
    	<div class="close" onclick="hideDialog();" id="x">x</div>
        <div class="chat-header clearfix">
            <img alt="avatar" height="55px" class="chatimgg"
                 src=""
                 width="55px"/>

            <div class="chat-about">
                <div class="chat-with" id="selectedUserId"></div>
                <div class="chat-num-messages"></div>
            </div>
            <i class="fa fa-star"></i>
        </div> <!-- end chat-header -->

        <div class="chat-history">
            <ul id="history">

            </ul>

        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="Type your message" rows="3"></textarea>

            <i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp;
            <i class="fa fa-file-image-o"></i>

            <button id="sendBtn">Send</button>

        </div> <!-- end chat-message -->

    </div> <!-- end chat -->

<!-- </div> end container -->

<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">${loginuser.getName()}</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
			{{response}}
            <a href= '{{response1}}' style="text-decoration:none;color:gray;">{{response2}}</a>
			<img src="" width="0" height="0"/>
        </div>	
    </li>
</script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>
</body>
</html>
