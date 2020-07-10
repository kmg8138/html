package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDAO {
	//데이터 접속
		public Connection con() throws Exception{
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		String sql=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		return con;
		}
		
		//데이터 입력
		public void insert(StudentVO vo)throws Exception{
			String sql="insert into tbl_student(sno,sname,tel,address) values(?,?,?,?)";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, vo.getSno());
			ps.setString(2, vo.getSname());
			ps.setString(3, vo.getTel());
			ps.setString(4, vo.getAddress());
			ps.execute();
		}
}
