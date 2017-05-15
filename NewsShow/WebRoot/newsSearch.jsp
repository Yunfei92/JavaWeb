<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="categoryBean.News" %>
<%@ page import="categoryService.NewsService" %>
<%@ page import="categoryServlet.newsSearchServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>舆情搜索页</title>
    <link href="css/all.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
 	<script src="js/echarts.common.min.js"></script>
   
	</head>
<body>
<div class="blog-masthead">
<div class="container">
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#"><img id="logo" src="images/logo.png" alt="" /></a>
	    </div>
	
	   
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="/NewsShow/newsShow?pageNo=1">首页 <span class="sr-only">(current)</span></a></li>
	        
	        <li><a href="#">一周热词</a></li>
	        <li><a href="#">媒体聚焦</a></li>
	        <li><a href="#">深度分析</a></li>
	        <li><a href="#">社会议题</a></li>
	        <li><a href="#">关于我们</a></li>
	       
	      </ul>
	      <form class="navbar-form navbar-left zyf-form" action="newsSearch.jsp" method="post">
	        <div class="form-group">
	          <input type="text"  name="keyword" class="form-control" placeholder="站内搜索">
	        </div>
	        <button type="submit" class="btn btn-default">搜索</button>
	      </form>
	     
	    </div>
	  </div>
	</nav>
</div>
</div>


<div class="container">

<div class="row">
	<div id="contentx" class="col-sm-8 blog-main">

			<div id="main" style="width: 800px;height:250px;">
			 <!-- 显示Echarts图表 -->
			</div>
			
             <div id="count" style="width:200px;height:50px">
	          	 <p>共为您找到相关新闻 <strong><%=request.getAttribute("count")%></strong> 篇</p> 
	          <button type="submit" class="btn btn-success" ><a href="csv/<%= request.getAttribute("key")%>.csv">下载</a>	</button>
	     	
             </div> 
			<div class="bs-callout bs-callout-info" id="callout-type-b-i-elems">
					<blockquote>
						<% List<News> news=(List<News>)request.getAttribute("News");
						if(news==null){%>
						<% out.print("<font color='red'>您好，请返回首页搜索！</font>"); %>
							
						<% }else{  										
							for(int i=0;i<news.size();i++){%>
						 	<p><h5><a href="<%=news.get(i).getLink() %>"><%=news.get(i).getTitle()%></a></h5></p>
          	  							<p><%=news.get(i).getContent()%></p>
						<% 
						}
						 }
						%>
						
					</blockquote>  
		 	</div>

</div>
</div>
</div>
<!-- 
<script type="text/javascript">
// 基于准备好的dom，初始化echarts实例
 var myChart = echarts.init(document.getElementById('main'));
//显示数据
option = {
    title: {
        text: '一周舆情趋势图',
        subtext: '纯属娱乐'
    },
    tooltip: {
        trigger: 'axis' //坐标轴触发提示框，多用于柱状、折线图中
    },
    legend: {  //图表上方的类别显示      
        data:['新闻数量']
    },
    toolbox: {  //工具栏显示      
        show: true,
        feature: {            
            dataView: {readOnly: false},//数据视图
            magicType: {type: [ 'bar']},//柱状图形式
            restore: {},//还原
            saveAsImage: {}//保存图片
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data : []    //先设置数据值为空，后面用Ajax获取动态数据填入
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value} '  //控制输出格式
        }
    },
    series: [ //系列（内容）列表                  
        {
            name:'新闻数量',
            type:'line',
             data:[],        //新闻数据值通过Ajax动态获取
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'}
                ]
            }
        },
    
    ]
};
//myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
//异步加载数据
var dates=[]; 	//时间数组
var counts=[];//新闻数量
$.ajax({    //使用JQuery内置的Ajax方法
         type : "get",        //get请求方式
         async : true,        //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         url : "/NewsShow/ShowInfoIndex",    //请求发送到ShowInfoIndexServlet处
         dataType : "json",        //返回数据形式为json
         success : function(result) {
             //请求成功时执行该函数内容，result即为服务器返回的json对象
             if (result != null && result.length > 0) {
                    for(var i=0;i<result.length;i++){                   
                       dates.push(result[i].date);
                       counts.push(result[i].count(title));
                    }
 		   //myChart.hideLoading();    //隐藏加载动画
                    myChart.setOption({        //载入数据
                        xAxis: {
                            data: dates    //填入X轴数据
                        },
                        series: [    //填入系列（内容）数据
                                      {
                                    // 根据名字对应到相应的系列
                                    name: '新闻数量',
                                    data: counts
                                }        
                       ]
                    });
                     
             }
             else {
                 //返回的数据为空时显示提示信息
                 alert("图表请求数据为空，可能服务器暂未录入近一周的舆情数据，您可以稍后再试！");      
             }
          
        },
         error : function(errorMsg) {
             //请求失败时执行该函数
             alert("图表请求数据失败，可能是服务器开小差了");
                 
         }
    })
 // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script> -->
	</body>
</html>
