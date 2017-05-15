package categoryDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class DatabaseDao {
	private Connection conn=null;

	/*
	 * 获取数据库连接对象
	 * @return 数据库连接对象
	 * @throws ClassNotFoundException
	 * @throws SQLException
     */
    public Connection getConnection() throws ClassNotFoundException,
		     SQLException{
			Connection conn=null;
			//加载数据库驱动
			Class.forName("com.mysql.jdbc.Driver");
			//初始化数据库连接字符串
			String sConn="jdbc:mysql://127.0.0.1:3306/news?characterEncoding=utf8";
			String user = "root";
			String pwd = "123456";
			//连接数据库
			conn = DriverManager.getConnection(sConn, user, pwd);
			return conn;
		}
		
		/*
		 * 关闭类中的连接对象
		 * @throws SQLException
		 */
		public void releaseConnection() throws SQLException{ 
			if(conn == null)
				return;
			this.conn.close();
			this.conn=null;
			
		}
		
		/*
		 * 执行查询语句，返回查询结果集
		 * 
		 */
		public ResultSet getResultSet(String query) 
		     throws SQLException,ClassNotFoundException{
			 
			if(conn==null){
				
				this.conn=getConnection();
			}
			
			Statement st=conn.createStatement();
			//执行查询语句并返回查询结果集
			ResultSet rs=st.executeQuery(query);
			return rs;
			
			/*
			 * 我们在返回结果集的时候并未关闭数据库连接对象
			 * 因为关闭连接对象后，该连接对象相关的结果集就无法访问
			 * 因此在获取结果集后，我们仍需要调用releaseConnection()方法来关闭数据库连接对象
			 */
			
		}
		
		/*
		 * 执行修改语句（包括增、删、改）
		 * 
		 */
		public void executeSQL(String sql) 
		    throws SQLException,ClassNotFoundException{
			
			if(conn==null){
				this.conn=getConnection();
			}
			Statement st=conn.createStatement();
			//执行修改语句
			st.executeUpdate(sql);
			
			//关闭连接对象
			this.conn.close();
			this.conn=null;
		
		}

//		public PreparedStatement PreparedStatement(String sql) {
//			// TODO Auto-generated method stub
//			return null;
//		}
		
		
}
