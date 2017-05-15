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
  	<!-- <link href="css/menu.css" rel="stylesheet"> -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/echarts.common.min.js"></script>
     <script src="js/menu.js"></script> 
   
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
	
	    <div class="collapse navbar-collapse wrap" id="bs-example-navbar-collapse-1">
	   
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="/NewsShow/newsShow?pageNo=1">首页 <span class="sr-only"></span></a></li>
	        
	        <li>
	       	 	<a href="#">一周热词</a>
	       	 	<!--  <div class="down">
                    <a href="#">二级菜单1</a>
                    <<a href="#">二级菜单2</a>
                    <a href="#">二级菜单3</a>
                </div> -->
	        </li>
	         <li>
	       	 	<a href="#">媒体聚焦</a>
	       	 	 <!--  <div class="down">
                    <a href="#">二级菜单1</a>
                    <<a href="#">二级菜单2</a>
                    <a href="#">二级菜单3</a>
                </div> -->
	        </li>
	         <li>
	       	 	<a href="#">深度分析</a>
	       	 	 <!--  <div class="down">
                    <a href="#">二级菜单1</a>
                    <<a href="#">二级菜单2</a>
                    <a href="#">二级菜单3</a>
                </div> -->
	        </li>
	         <li>
	       	 	<a href="#">社会议题</a>
	       	 	  <!-- <div class="down">
                    <a href="#">二级菜单1</a>
                    <<a href="#">二级菜单2</a>
                    <a href="#">二级菜单3</a>
                </div> -->
	        </li>
	        <li><a href="#">关于我们</a></li>
	   
	      </ul>
	      <form class="navbar-form navbar-left zyf-form" action="/NewsShow/newsSearch" method="post">
	        <div class="form-group">
	          <input type="text"  name="keyword" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-success" >搜索</button>
	      </form>
	     
	    </div>
	  </div>
	</nav>
</div>
</div>


<div class="container">

<div class="row">
	<div id="contentx" class="col-sm-8 blog-main">
		 
		 <div id="main" style="width: 800px;height:250px;"></div><!-- 画布设置 -->
		
		<div class="bs-callout bs-callout-info" id="callout-type-b-i-elems">
			<blockquote>
		
			<% List<News> news=(List<News>)request.getAttribute("newslist");
				
				if(news!=null&&news.size()>0){  										
					for(int i=0;i<news.size();i++){%>
				 	<p><h5><a href="<%=news.get(i).getLink() %>"><%=news.get(i).getTitle()%></a></h5></p>
        	  		 <p><%=news.get(i).getContent()%></p>  
        	  		<%--   <%
			 			StringBuffer n=request.getAttribute("content");%>
			 			<div>
			 				<%=n %> 
			 			</div> --%>
        	  		 
				<% 
				}
				 } 
				%>
			
         	</blockquote>
		  
		 </div>


		<div class="page">
			<nav aria-label="Page navigation">
		  	<ul class="pagination">
			<li><a href='/NewsShow/newsShow?pageNo=1'>首页</a></li>
			<li><a href='/NewsShow/newsShow?pageNo=${pageNo-1>1?pageNo-1:1 }'>&laquo;</a></li>
 
		    <li><a href='/NewsShow/newsShow?pageNo=1'>1</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=2'>2</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=3'>3</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=4'>4</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=5'>5</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=6'>6</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=7'>7</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=8'>8</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=9'>9</a></li>
		    <li><a href='/NewsShow/newsShow?pageNo=10'>10</a></li>
		   
		   <li><a href='/NewsShow/newsShow?pageNo=${pageNo+1<totalPage?pageNo+1:totalPage}'>&raquo;</a></li>
			<li><a href='/NewsShow/newsShow?pageNo=${totalPage} '>末页</a></li> 
    	<li><a  href="javascript:scroll(0,0)">返回顶部</a> </li>
		  </ul>
		  
		</nav>
	</div>


	<div class="footer">
			<div class="div1">Copyright © 2017 - 2018 中国传媒大学理工学部</div>
			<div class="div2"><label>技术支持：中国传媒大学理工学部</label><span>|</span><label>版权所有：XXX</label></div>
	</div>
	
</div>	
	
	<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
	
	<div class="sidebar-module">
            <h4>热点聚焦</h4>
            <ol class="list-unstyled">
              <li><a href="/NewsShow/keyWord.jsp"><strong>中国</strong></a></li>
              <li><a href="#">诺克萨斯伸出手 遇见打野的小丑</a></li>
              <li><a href="#">无极剑圣又偷塔 却遇战争人头马</a></li>
              <li><a href="#">光辉女郎一出手 大招定秒人头狗 </a></li>
              <li><a href="#">皮城女警捕兽夹 打野忙僧小飞侠 </a></li>
              <li><a href="#">小龙被拿谁的错 谁知寡妇哪出没</a></li>
            </ol>
          </div>
	</div>
	
	<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
	
	<div class="sidebar-module">
            <h4>个案分析</h4>
            <ol class="list-unstyled">
              <li><a href="#"><strong>男枪女枪没辅助 凯南单杀一条路</strong></a></li>
              <li><a href="#">齐天大圣孙悟空 九尾狐狸抢我中 </a></li>
              <li><a href="#">虚空行者瞎乱闪 卡牌GANK来的晚</a></li>
              <li><a href="#">蒙多菜刀瞎乱砍 一撸就是一整晚 </a></li>
              <li><a href="#">雷霆咆哮看门犬 全屏支援暮光眼  </a></li>
              <li><a href="#">无双剑姬太危险 抢我人头不要脸</a></li>
            </ol>
          </div>
	</div>
	
	<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
	
	<div class="sidebar-module">
            <h4>个案分析</h4>
            <ol class="list-unstyled">
              <li><a href="#"><strong>上单狗头逆转乾坤 虚空恐惧把人吞</strong></a></li>
              <li><a href="#"> 就算无敌的潘森 怎能打过我VN </a></li>
              <li><a href="#">脆皮克星说男刀 掘墓者说轮铁锹</a></li>
              <li><a href="#">只要死歌放大招 残血全得打弯腰 </a></li>
              <li><a href="#">傻逼挂机打酱油 辅助A兵还抢头 </a></li>
              <li><a href="#">问君能有几多愁 五黑四坑二十投</a></li>
            </ol>
          </div>
	</div>
	
	
</div>

</div>

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
myChart.showLoading({text: "图表数据正在努力加载..."});    //数据加载完之前先显示一段简单的loading动画
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
                       counts.push(result[i].count);
                    }
 		   myChart.hideLoading();    //隐藏加载动画
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
</script>
  </body>
</html>
