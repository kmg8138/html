package ex0417;

import java.sql.*;
import java.util.ArrayList;

public class ReplayDAO {
	//����������
		public Connection con() throws Exception{
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, user, password);
			
			return con;
		}
   //������ �޼���
		public ArrayList<ReplayVO> list()throws Exception{
		      ArrayList<ReplayVO> list=new ArrayList<ReplayVO>();
		      String sql="select * from tbl_replay order by rno desc";
		      PreparedStatement ps=con().prepareStatement(sql);
		      ResultSet rs=ps.executeQuery();
		      while(rs.next()) {
		         ReplayVO vo=new ReplayVO();
		         vo.setRno(rs.getInt("rno"));
		         vo.setContent(rs.getString("content"));
		         vo.setWdate(rs.getTimestamp("wdate"));
		         vo.setCnt(rs.getInt("cnt"));
		         list.add(vo);
		      }
		      return list;
	   }
		
		//�������Է� �޼���
		public void insert(String content)throws Exception{
			String sql="insert into tbl_replay(rno, content, wdate) values(seq_rno.nextval,?, sysdate)";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, content);
			ps.execute();
			con().close();
		}		
		
		//�����ͻ��� �޼���
		public void delete(int rno)throws Exception{
			String sql="delete from tbl_replay where rno=?";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setInt(1, rno);
			ps.execute();
			con().close();
		}
		
		//�����ͼ��� �޼���
		public void update(int rno)throws Exception{
			String sql="update tbl_replay set cnt=cnt+1 where rno=?";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setInt(1, rno);
			ps.execute();
			con().close();
		}		
}
