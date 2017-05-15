package categoryServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categoryBean.News;
import categoryDao.DatabaseDao;
import categoryService.NewsService;



public class newsShowServlet extends HttpServlet {

	public newsShowServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		String currentPage=request.getParameter("pageNo");
		//String path=request.getParameter("content");
		if (currentPage == null||"".equals(currentPage) ){
			currentPage ="1";     // 第一次访问，设置当前页为1;
}
		// 转换
		int pageNo = Integer.parseInt(currentPage);
        NewsService ns=new NewsService();
        //StringBuffer content=ns.getcontent(path);
        List<News> newslist=ns.getNewsAll(pageNo);
        int totalPage=ns.getTotalPages();
      //计算总的页面数
        if(totalPage%10==0){
			request.setAttribute("totalPage", totalPage/10);
		}else{
			request.setAttribute("totalPage", totalPage/10+1);
		}
        
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("newslist", newslist);
		//request.setAttribute("content", content);
		RequestDispatcher rd = request.getRequestDispatcher("newsShow.jsp");
		rd.forward(request, response);
	}


}
