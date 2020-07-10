package ex01;

import java.sql.*;
import java.util.ArrayList;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


public class BlogDAO {
	 //DAO데이터베이스 접속 메서드
	   public Connection con() throws Exception {
		   String driver = "oracle.jdbc.driver.OracleDriver";
		   String url = "jdbc:oracle:thin:@localhost:1521:xe";
		   String user = "system";
		   String password = "1234";
	
		   Class.forName(driver);
		   Connection con = DriverManager.getConnection(url, user, password);
		   return con;
	   }
	   
	   //데이터목록 출력메서드
	   public ArrayList<BlogVO> list()throws Exception{
		   ArrayList<BlogVO> list=new ArrayList<BlogVO>();
		   String sql="select * from tbl_blog order by bno desc";
		   PreparedStatement ps=con().prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   
		   while(rs.next()) {
			   BlogVO vo=new BlogVO();
			   vo.setBno(rs.getInt("bno"));
			   vo.setTitle(rs.getString("title"));
			   vo.setWdate(rs.getDate("wdate"));
			   vo.setArticle(rs.getString("article"));
			   list.add(vo);
		   }
		   return list;
	   }
	   
	   //데이터입력 메서드
	   public void insert(BlogVO vo)throws Exception{
		  String sql="insert into tbl_blog(bno, title, wdate, article) values(SEQ_blog.nextval,?,sysdate,?)";
		  PreparedStatement ps=con().prepareStatement(sql);
		  ps.setString(1, vo.getTitle());
		  ps.setString(2, vo.getArticle());
		  ps.execute();
	   }
	   
	   //데이터삭제 메서드
	   public void delete(int bno)throws Exception{
		   String sql="delete from tbl_blog where bno=?";
		   PreparedStatement ps=con().prepareStatement(sql);
		   ps.setInt(1, bno);
		   ps.execute();
	   }
}
