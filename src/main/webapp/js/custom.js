let $chatHistory;
let $button;
let $textarea;
let $chatHistoryList;

function init() {
    cacheDOM();
    bindEvents();
}

function bindEvents() {
    $button.on('click', addMessage.bind(this));
    $textarea.on('keyup', addMessageEnter.bind(this));
}

function cacheDOM() {
    $chatHistory = $('.chat-history');
    $button = $('#sendBtn');
    $textarea = $('#message-to-send');
    $chatHistoryList = $chatHistory.find('ul');
}

function render(message, userName) {
	var myStr = "http";
	var string = "";
	var string1 = "";
	var string2 = "";
	console.log(message.indexOf(myStr,0))
	console.log(message.length)
	if(message.indexOf(myStr,0)!= -1){
		for(let i=0;i<message.indexOf(myStr,0);i++){
			string += message.charAt(i);
		}
		for(let i=message.indexOf(myStr,0);i<message.length;i++){
			string1 += message.charAt(i);
		}
		string2 = "『網址連結』";
		console.log(string)
		console.log(string1)
	}else{
		
		for(let i=0;i<message.length;i++){
			string += message.charAt(i);
		}
		console.log(string)
	}
    scrollToBottom();
    // responses
    var templateResponse = Handlebars.compile($("#message-response-template").html());
    var contextResponse = {
		response2: string2,
		response1: string1,
        response: string,
        time: getCurrentTime(),
        userName: userName
    };

    setTimeout(function () {
        $chatHistoryList.append(templateResponse(contextResponse));
        scrollToBottom();
    }.bind(this), 1000);
	 
}

function sendMessage(message) {
    let username = $('#userName').val();
    console.log(username)

    sendMsg(username, message);
    scrollToBottom();
    if (message.trim() !== '') {
        var template = Handlebars.compile($("#message-template").html());
        var context = {
            messageOutput: message,
            time: getCurrentTime(),
            toUserName: selectedUser
        };
		
        $chatHistoryList.append(template(context));
        scrollToBottom();
        $textarea.val('');
		
    }
}

function scrollToBottom() {
    $chatHistory.scrollTop($chatHistory[0].scrollHeight);
}

function getCurrentTime() {
    return new Date().toLocaleTimeString().replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
}

function addMessage() {
	var string = "";
	console.log($textarea.val().length);
	for(let i=1;i<=$textarea.val().length;i++){
		
		if(i%23==0){
			string += $textarea.val().charAt(i-1);
			string += " ";
		}else{
			string += $textarea.val().charAt(i-1);
		}
	}

    sendMessage(string);
}

function addMessageEnter(event) {
    // enter was pressed
    if (event.keyCode === 13) {
        addMessage();
    }
}

init();

