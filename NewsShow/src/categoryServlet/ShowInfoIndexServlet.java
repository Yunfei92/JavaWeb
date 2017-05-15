package categoryServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import categoryBean.News;
import categoryService.NewsService;

public class ShowInfoIndexServlet extends HttpServlet {

	/**
	
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	
	}

	/**
	
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8"); //设定客户端提交给servlet的内容按UTF-8编码
		response.setCharacterEncoding("utf-8"); //设定servlet传回给客户端的内容按UTF-8编码
		response.setContentType("text/html;charset=UTF-8");    //告知浏览器用UTF-8格式解析内容
		
		
		NewsService ns=new NewsService();
		List<News> newslist;
		try {
			newslist = newslist = ns.getData();
			//json过滤掉不需要的字段
			JsonConfig config = new JsonConfig(); 
			config.setExcludes(new String[]{"content","link","title"});
			//将list中的对象转换为Json格式的数组 
	        JSONArray jsonArray = JSONArray.fromObject(newslist,config);  
	        String json=jsonArray.toString();
	       
	        //将json数据返回给客户端
	        response.getWriter().write(json);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
      
	}

}
