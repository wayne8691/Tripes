<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noProduct</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://zeptojs.com/zepto.min.js"></script>
<script src="http://jaysalvat.github.io/vegas/releases/latest/vegas.js"></script>
<link rel="stylesheet" href="http://jaysalvat.github.io/vegas/releases/latest/vegas.min.css">
<style type="text/css">

     #example{
     height: 700px;
      width: 2000px;

      }

</style>
</head>




<body>

<div id='example'></div>



<script type="text/javascript">

$(function() {
    $('#example').vegas({
        slides: [
            { src: '../images/bg_1.jpg' },
            { src: '../images/bg_2.jpg' },
          
        ]
    });
});
</script>
</body>
</html>