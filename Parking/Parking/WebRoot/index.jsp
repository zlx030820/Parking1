<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<%@ page 
language="java"
import="java.sql.*"
contentType="text/html; charset=GBK"
pageEncoding="UTF-8"
%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>  
<title>Document</title>
<style type="text/css">
    body, html,#allmap {width: 100%;height:100%;overflow: hidden;margin:0;font-family:"微软雅黑";}  
    #l-map{height:100%;width:100%;float:left;border-right:2px solid #bcbcbc;}  
    #r-result{height:100%;width:20%;float:left;} 
    ul#nav{ width:100%; height:60px; background:#00A2CA;} 
    ul#nav li{display:inline; height:60px;margin-left:80px} 
    ul#nav li a{display:inline-block; padding:0 30px; height:60px; line-height:60px;
     color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
    ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/  
    .form {display: inline-block;}
</style>
</head>
<body>
   <h1 align="center" style="color:#0000FF;">园区车位管理系统</h1>
   <ul id="nav" align="center"> 
         <li><a href="UserAction!findAllAdvice.action">浏览用户评价</a></li> 
        <li><a href="m_adminlogin.html" >管理员登录</a></li> 
        <li><a href="m_login.html">普通用户登录</a></li> 
        <li>
            <input id="type2" type="radio" name="type" value="more" checked="checked" /><label for="type2">附近停车场查询：</label>
            <input id="keyword" type="text"  style="width:150px;" name="" />   
            <input type="button" value="搜索" onClick=" serachlocal()"/>  
        </li> 
    </ul>  
    <div id="l-map"></div>  
</body><script type="text/javascript"> 

 
function initMap(){   
	
    window.map = new BMap.Map("l-map");  
    var cp0 = '117.101929';  
    var cp1 = '39.098855';
    var cpoint = new BMap.Point(cp0,cp1); 
    map.centerAndZoom(cpoint,11); 
    map.enableScrollWheelZoom();  
    
  

    <%
      String url = "jdbc:mysql://localhost:3306/Parking";
      String user ="root";//数据库用户名
       // String password = "root";//数据库用户密码
      String password = "123456";
      String sqlStr = "select * from parking";
       // Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
      Class.forName("com.mysql.jdbc.Driver");
                  
      Connection con = DriverManager.getConnection( url, user, password );
       
      Statement st = con.createStatement();
             
      ResultSet rs = st.executeQuery( sqlStr );

    String x = null;
    String y = null;
     String id = null;
     
    while (rs.next()) { 
        x = rs.getString("x"); 
        y = rs.getString("y");
        id= rs.getString("id");
    %>
    var p0 = <%=x%>;  
    var p1 = <%=y%>;
    

    
    var point = new BMap.Point(p0,p1);  
    var iconImg = new BMap.Icon('http://api.map.baidu.com/img/markers.png', new BMap.Size(23, 25));    
    var marker = new BMap.Marker(point,{icon:iconImg}); 
    var infoWindow = new BMap.InfoWindow(sContent);  
    var label = new BMap.Label('停车场',{"offset":new BMap.Size(20, -10)}); 
    var sContent =
       "<a href='ParkAction!getSpaceByParkId.action?park_id=<%=id%>' target='_blank'>欢迎停车</a>"; 
    marker.setLabel(label);  
    map.addOverlay(marker);  
    label.setStyle({  
        borderColor:"#00ff00",  
        color:"#ff0000",  
        cursor:"pointer"  
    }); 
       marker.addEventListener("click", function(){          
	   this.openInfoWindow(infoWindow);
	   //图片加载完毕重绘infowindow
	   document.getElementById('imgDemo').onload = function (){
		   infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
		   
	   }
	});
    <%}%> 
}  

initMap();//创建和初始化地图  
</script>  
</html>