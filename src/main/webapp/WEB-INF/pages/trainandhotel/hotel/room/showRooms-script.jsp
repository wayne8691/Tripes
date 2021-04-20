<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

$().ready(function() {
    changePage(1);
    $("select[name='roomType'], select[name='sort']").on("change", () => {changePage(1)});
   
    $("input[name='startDate'], input[name='endDate']").datepicker({
    	format: "yyyy-mm-dd",
    	autoclose: false,
    	startDate: "today",
    	language: "zh-TW",
    	todayHighlight: true
    }).on("changeDate", function() {
    	const startDate = new Date($("input[name='startDate']").val());
    	const endDate = new Date($("input[name='endDate']").val());
    	if ($(this).attr("name") == $("input[name='startDate']").attr("name")) {
    		if (startDate > endDate) {
    	    	$("input[name='endDate']").datepicker("update", $("input[name='startDate']").val());
    	    }
    	} else {
    	    if (endDate < startDate) {
    	    	$("input[name='startDate']").datepicker("update", $("input[name='endDate']").val());
    		}
    	}
    });
	const today = new Date();
	$("input[name='startDate'], input[name='endDate']").datepicker("update", today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate());

	$("select[name='start']").on("change", function(){
		$.ajax({
		    url: "http://localhost:8080/train/ticket2",
		    method: "POST",
		    data: {
					start: $(this).val()
			},
		    beforeSend:function() {
		    },
		    success:function(response) {
		        $("#end").html(response);
		    },
		    error:function(xhr, status, error) {
		    },
		    complete:function(xhr, status) {
		    }
		});
	});

});

$("select[name='end']").on("change", function(){
	$.ajax({
	    url: "http://localhost:8080/train/ticket3",
	    method: "POST",
	    data: {
	    	start:$("select[name='start']").val(),
	    	dest:$("select[name='end']").val()
		},
	    beforeSend:function() {
	    },
	    success:function(response) {			    	
	    	var ticketPrice =document.getElementById("buy").value;		    	
	        $("#last").html(response);				       
	    },
	    error:function(xhr, status, error) {
	    },
	    complete:function(xhr, status) {
	    }		
	});
});

<!-- -->
function changePage(page) {
    $.ajax({
        url: "./getRooms/" + page,
        method: "POST",
        data: {
                hotelId: "<%=hotel.getId()%>",
                roomType: $("select[name='roomType']").val(),
                sort: $("select[name='sort']").val()
        },
        beforeSend:function() {
        },
        success:function(response) {
            //console.log(response);
            $(".roomList").html(response);
        },
        error:function(xhr, status, error) {
        },
        complete:function(xhr, status) {
        }
    });
}
</script>