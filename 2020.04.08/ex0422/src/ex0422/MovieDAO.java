package ex0422;

import java.sql.*;
import java.util.ArrayList;

public class MovieDAO {
	//데이터접속
		public Connection con() throws Exception{
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		return con;
		}
		
	//데이터 입력
		public void insert(MovieVO vo)throws Exception{
			String sql="insert into tbl_movie(seq_mno, title, actor) values(seq_mno.nextval,?,?)";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getActor());
			ps.execute();
			con().close();
		}
		
	//데이터목록
		public ArrayList<MovieVO> list()throws Exception{
			ArrayList<MovieVO> list=new ArrayList<MovieVO>();
			String sql="select * from tbl_movie order by seq_mno desc";
			PreparedStatement ps=con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setMno(rs.getInt("seq_mno"));
				vo.setTitle(rs.getString("title"));
				vo.setActor(rs.getString("actor"));
				list.add(vo);
			}
			return list;
		}
}
