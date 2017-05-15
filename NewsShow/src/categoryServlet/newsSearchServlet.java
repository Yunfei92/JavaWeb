package categoryServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categoryBean.News;
import categoryDao.DatabaseDao;
import categoryService.NewsService;;

public class newsSearchServlet extends HttpServlet {


	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String keyword=request.getParameter("keyword");
		request.setAttribute("key", keyword);
		List<News> newslist=new ArrayList();
		
        NewsService ns=new NewsService();
        
		newslist=ns.getNewsByKeyword(keyword);
	
		int counts=ns.getCount(keyword);
		request.setAttribute("count", counts);
	

		try {
			ns.saveFile(keyword);
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		

	
		
        if(newslist==null){
        	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    		rd.forward(request, response);
        }else{
		request.setAttribute("News", newslist);
		
		RequestDispatcher rd = request.getRequestDispatcher("newsSearch.jsp");
		rd.forward(request, response);
		}
      
        
	}

	

}
