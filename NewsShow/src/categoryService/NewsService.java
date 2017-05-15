package categoryService;


import java.io.BufferedReader;
import java.io.Console;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import categoryBean.News;
import categoryDao.DatabaseDao;


public class NewsService {
	

	/*
	 * 得到新闻列表
	 */
	 
	 
	public List<News> getNewsAll(int pageNo) {
		int pageSize=10;
		DatabaseDao myDB = new DatabaseDao();

		String sql = "select title,href,content from data limit " + (pageNo-1)*pageSize+","+pageSize;

		List<News> newslist = new ArrayList<News>();

		try {
			ResultSet mySet = myDB.getResultSet(sql);
			while (mySet.next()) {
				
				News news = new News();
				news.setTitle(mySet.getString("title"));
				news.setLink(mySet.getString("href"));
				newslist.add(news);
			}
		
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} finally {
			try {
				// 结果集使用完毕，关闭数据库操作对象的数据库连接对象
				myDB.releaseConnection();
			} catch (SQLException sqlEx) {
				
				sqlEx.printStackTrace();
			}
		}
		
		return newslist;
	
	}
	
	/*
	 * 得到新闻总页面数
	 * 
	 */
		public int getTotalPages(){
			int totalPage=0;
			DatabaseDao myDB = new DatabaseDao();
			String sql = "select count(title) from data";
			try {
				ResultSet mySet = myDB.getResultSet(sql);
				while (mySet.next()) {
					totalPage=totalPage+mySet.getInt(1);
				}
			
			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} finally {
				try {
					myDB.releaseConnection();
				} catch (SQLException sqlEx) {
					
					sqlEx.printStackTrace();
				}
			}

			return totalPage;
		
		}
		/*
		 * 得到新闻内容
		 */
		 
		/* 
		public  StringBuffer getcontent(String path) throws IOException {
//			 String path ="D:\\";   // 这边文件目录需改成相对路径  
		        File file = new File(path);  
		        FileReader fr = new FileReader(file);  //字符输入流  
		        BufferedReader br = new BufferedReader(fr);  //使文件可按行读取并具有缓冲功能  
		        StringBuffer strB = new StringBuffer();   //实例化strB对象用来存储文件里的内容  
		        String str = br.readLine();  
		        while(str!=null){  
		            strB.append(str).append("<br>");   //将读取的内容放入strB  
		            str = br.readLine();  
		        }  
		        br.close();    //关闭输入流  
		       return strB;
//	       System.out.println(strB);
}
		
	*/	 
	
	
	/*
	 * 新闻搜索方法,按标题查询
	 */
	public List<News> getNewsByKeyword(String keyword) {
		
		// 初始化数据库操作
		DatabaseDao myDB = new DatabaseDao();

		String sql = "select * from data where title like '%"+keyword+"%'";
		
		List<News> newslist = new ArrayList<News>();

		try {
			ResultSet mySet = myDB.getResultSet(sql);
			while (mySet.next()) {
				
				News news = new News();
				news.setTitle(mySet.getString("title"));
				news.setLink(mySet.getString("href"));
				newslist.add(news);
			}
		
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				myDB.releaseConnection();
			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			}
		}

		return newslist;
	}
	
	/*
	 * 保存匹配的新闻文件
	 */
	public void saveFile(String keyword) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
		DatabaseDao myDB = new DatabaseDao();
		String sql="select * from data where title like '%"+keyword+"%'into outfile 'D:/workspace/.metadata/.me_tcat7/webapps/NewsShow/csv/"+keyword+".csv' fields terminated by ','optionally enclosed by ' 'lines terminated by '\r\n'";
		Connection conn=(Connection) myDB.getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeQuery(sql);
		
	}
	
	/*
	 * 获取匹配新闻的数据量
	 */
	
	public int  getCount(String keyword){
		int count=0;
		DatabaseDao myDB = new DatabaseDao();
		String sql = "select count(title) from data where title like '%"+keyword+"%'";
		try {
			ResultSet mySet = myDB.getResultSet(sql);
			while (mySet.next()) {
				count=count+mySet.getInt(1);
			}
		
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				myDB.releaseConnection();
			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			}
		}

		return count;
		
	}
	

	/*
	 * 获取当天（包括当天）前六天的每天对应的新闻数据
	 */
		public List<News> getData( ) throws ClassNotFoundException{
		
		//获取当天在内的六天以前的0点格式字符串（用于数据库查询）
        Calendar  cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -6);        //获取当天在内的六天以前的日期时间
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd ");    //设定日期格式
        String sixDaysAgoStr = sdf1.format(cal.getTime());    //将六天前的日期时间按指定格式转换成字符串
           
        //获取当前时间并将其转换成指定格式的字符串（用于数据库查询） 
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd ");  
        String dateNowStr = sdf2.format(new Date());  
      
        
        //初始化数据库连接并执行sql查询
        DatabaseDao myDB=new DatabaseDao();

		String sql = "select date,count(title) from data where date >= '"+sixDaysAgoStr+"' and date <= '"+dateNowStr+"' group by date";    //初始化SQL查询语句
		List<News> newslist = new ArrayList<News>();
		   
		try{

           ResultSet rs=myDB.getResultSet(sql);   //获取查询到的结果集
           while (rs.next()) {
		    	News news = new News();
				news.setDate(rs.getString("date"));
				news.setCount(rs.getInt("count(title)"));
				newslist.add(news); 
				
           }
		}catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} finally {
			try {
				myDB.releaseConnection();
			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			}
		}
		
		return newslist;
	}
		
}
