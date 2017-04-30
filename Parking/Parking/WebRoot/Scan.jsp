<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Scan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/scroll.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

  </head>
  
  <body>
   <!--end:course_new-->
  <center><h1>用户评论</h1></center> 
<div id="thinking" class=" mb40 fl p10">
  <div id="thingk_title" class="bg_all mb20"><a href="#" title="���ѧԱ˵" class="fr gray noline " target="_blank"></a></div>
  <ul id="list_thinking" >
    <li> <a href="" target="_blank" >
    <img width="48" height="48" alt="beata��" id="face_4920841" class="pic_border pf fl lazy_img"  src="images/4920841.jpg"/></a> 
    <span class="txt_thinking fr digest" > 环境很好。。。。 <br/>
      </span>
    </li>
    <li> <a href="#" target="_blank" ><img width="48" height="48" alt="jane20110706" id="face_9221006" class="pic_border pf fl lazy_img"  src="images/9221006.jpg"/></a> 
    <span class="txt_thinking fr digest" > 车位停放很方便... <br/>
      </span>
    </li>
    <li> <a href="#" target="_blank" ><img width="48" height="48" alt="ǳjessica" id="face_3479036" class="pic_border pf fl lazy_img"  src="images/3479036.jpg"/></a> 
    <span class="txt_thinking fr digest" >整体还可以... <br/>
      </span>
      
    </li>
    <li> <a href="#" target="_blank" ><img width="48" height="48" alt="�Ҳ��������" id="face_10140568" class="pic_border pf fl lazy_img"  src="images/10140568.jpg"/></a>
     <span class="txt_thinking fr digest" >很好。 <br/>
      </span>
      
    </li>
  </ul>
</div>
<!--end: thinking-->
<script type="text/javascript">
    $(function (){        
        setInterval(function () {
            $('#thinking ul li:last').hide().insertBefore($("#thinking ul li:first")).slideDown(1000);
          }, 6000);
    });
</script>

</body>
</html>
