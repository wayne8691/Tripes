const url = 'http://localhost:8080';
let stompClient;
let selectedUser;
let newMessages = new Map();
var lastuser = "";

function connectToChat(userName) {
	
    console.log("connecting to chat...")
    let socket = new SockJS(url + '/chat');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log("connected to: " + frame);
        stompClient.subscribe("/topic/messages/" + userName, function (response) {
            let data = JSON.parse(response.body);
            if (selectedUser === data.fromLogin) {
                render(data.message, data.fromLogin);
            } else {
                newMessages.set(data.fromLogin, data.message);
                $('#userNameAppender_' + data.fromLogin).append('<span id="newMessage_' + data.fromLogin + '" style="color: red">+1</span>');
            }
        });
    });
}

function sendMsg(from, text) {
	let userName = document.getElementById("userName").value;
    stompClient.send("/app/chat/" + userName, {}, JSON.stringify({
        fromLogin: from,
        message: text
    }));
}

function registration() {
    let userName = document.getElementById("userName").value;
    $.get(url + "/registration/" + userName, function (response) {
        connectToChat(userName);
    }).fail(function (error) {
        if (error.status === 400) {
            alert("Login is already busy!")
        }
    })
}

function selectUser(userName) {
	
    console.log("selecting users: " + userName);
    selectedUser = userName;
	if(lastuser != userName){
		document.getElementById("history").innerHTML = "";
		lastuser = userName;
	}
	
    let isNew = document.getElementById("newMessage_" + userName) !== null;
    if (isNew) {
		console.log("123");
        let element = document.getElementById("newMessage_" + userName);
        element.parentNode.removeChild(element);
        render(newMessages.get(userName), userName);
		
    }
    $('#selectedUserId').html('');
    $('#selectedUserId').append('Chat with ' + userName);
}

function fetchAll() {
    $.get(url + "/fetchAllUsers", function (response) {
        let users = response;
        let usersTemplateHTML = "";
        for (let i = 0; i < users.length; i++) {
            usersTemplateHTML = usersTemplateHTML + '<a href="#" onclick="selectUser(\'' + users[i] + '\')"><li class="clearfix">\n' +
                '                <img src="" width="55px" height="55px" alt="avatar" />\n' +
                '                <div class="about">\n' +
                '                    <div id="userNameAppender_' + users[i] + '" class="name">' + users[i] + '</div>\n' +
                '                    <div class="status">\n' +
                '                        <i class="fa fa-circle offline"></i>\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '            </li></a>';
        }
        $('#usersList').html(usersTemplateHTML);
    });
}
function clearAll() {
	let userName = document.getElementById("userName").value;
	$.get(url + "/clearAllUsers/" + userName)
}
function hello() {
	let userName = document.getElementById("userName").value;
	$.get(url + "/hello/" + userName)
}
var dialog,x,btnn;

function showDialog(){
  $('#btnn').attr('disabled',true)
  dialog.style.display="block";

  selectUser("robot");
  setTimeout(function () {
  	hello();
  }.bind(this), 500);
	console.log("asd");
}
function hideDialog(){
  dialog.style.display="none";
  $('#btnn').prop('disabled',false)
 
}