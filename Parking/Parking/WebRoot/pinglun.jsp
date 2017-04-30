<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link  rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
  
	function suggest() {
		var htmlobj = $.ajax({
			url : "UserAction!addAdvice.action",
			type : "POST",
			data : {
				"message" : $("#message").val(),
			},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "UserAction!findAllAdvice.action";
		} else {
		/* $.MsgBox.Alert("温馨提示：", error);  */
	      swal({
				title : error,
				showCancelButton : true,
				showConfirmButton : false,
				cancelButtonText : "确认",
				
			});
		}
	}
	function keydown(e) {

		if ((e.keyCode || e.which) == 13) {
		
			login();
		}
	};
</script> 


<title>jQuery带表情仿多说留言评论框代码</title>
</head>
<body>
<div id="content" style="width: 700px; height: auto;margin-left:320px;margin-top:120px">
	<div class="wrap">
		<div class="comment">
			<div class="head-face">
				<img src="images/1.jpg" />
				<p>我是鸟</p>
			</div>
			<div class="content">
				<div class="cont-box">
					<textarea class="text" type="text"  placeholder="请输入..." id="message"></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span></div>
					<div class="submit-btn"><input type="button" onClick="suggest()"value="提交评论" /></div>
				</div>
			</div>
		</div>
		<div id="info-show">
			<ul></ul>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/sinaFaceAndEffec.js"></script>
<script type="text/javascript">
	// 绑定表情
	$('.face-icon').SinaEmotion($('.text'));
	// 测试本地解析
	function out() {
		var inputText = $('.text').val();
		$('#info-show ul').append(reply(AnalyticEmotion(inputText)));
	}
	
	var html;
	function reply(content){
		html  = '<li>';
		html += '<div class="head-face">';
		html += '<img src="images/1.jpg" / >';
		html += '</div>';
		html += '<div class="reply-cont">';
		html += '<p class="username">小小红色飞机</p>';
		html += '<p class="comment-body">'+content+'</p>';
		html += '<p class="comment-footer">2016年10月5日　回复　点赞54　转发12</p>';
		html += '</div>';
		html += '</li>';
		return html;
	}
</script>

</body>
</html>

