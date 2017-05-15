<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="categoryDao.DatabaseDao" %>
<%@ page import="categoryBean.News" %>
<%@ page import="categoryService.NewsService" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>舆情首页</title>
    <link href="css/all.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  	<link href="css/menu.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/echarts.common.min.js"></script>
     <script src="js/menu.js"></script> 
   <script src="js/jquery.easing.1.3.js">
   </script>
	</head>
<body>

<div class="nav">  
    <ul class="list">  
        <li><a href="#">首页</a></li>  
          
        <li>  
            <a href="#">职业课程</a>  
            <div class="down">  
                <a href="#">课程库</a>  
                <a href="#">知识体系图</a>  
                <a href="#">职业路径图</a>  
                <a href="#">系列课程</a>  
            </div>  
         </li>  
          
        <li>  
            <a href="#">就业学习</a>  
            <div class="down">  
                <a href="#">Web前端开发</a>  
                <a href="#">Android开发</a>  
                <a href="#">JavaWeb开发</a>  
            </div>  
        </li>  
          
        <li>  
            <a href="#">我的社区</a>  
            <div class="down">  
                <a href="#">wiki</a>  
                <a href="#">技术问答</a>  
                <a href="#">社群</a>  
                <a href="#">资源分享</a>  
            </div>  
         </li>  
          
        <li>  
            <a href="#">更多+</a>  
            <div class="down">  
                <a href="#">兴趣爱好</a>  
                <a href="#">职业经历</a>  
            </div>  
        </li>  
    </ul>  
</div>  
  </body>
</html>
