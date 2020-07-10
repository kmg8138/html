package ex01;

import java.sql.*;
import java.util.*;

public class AddDAO {
	
	public Connection con() throws Exception{
			
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		return con;
	}
	
	//데이터목록 메서드
	public ArrayList<AddVO> list()throws Exception{
		ArrayList<AddVO> array=new ArrayList<AddVO>();
		String sql="select * from tbl_address order by aname";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			AddVO vo=new AddVO();
			vo.setAno(rs.getInt("ano"));
			vo.setAname(rs.getString("aname"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
			
			array.add(vo);
		}
		return array;
	}
	
	//데이터입력 메서드
	public void insert(AddVO vo)throws Exception{
		String sql="insert into tbl_address(ano,aname,tel,address) values(seq_address.nextval,?,?,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getAname());
		ps.setString(2, vo.getTel());
		ps.setString(3, vo.getAddress());
		ps.execute();
		con().close();
	}
	
	//데이터읽기 메서드
	public AddVO read(int ano)throws Exception{
		AddVO vo=new AddVO();
		String sql="select * from tbl_address where ano=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, ano);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()){
			vo.setAno(rs.getInt("ano"));
			vo.setAname(rs.getString("aname"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
		}
		return vo;
	}
	
	//데이터삭제 메서드
	public void delete(int ano)throws Exception{
		String sql="delete from tbl_address where ano=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, ano);
		ps.execute();
		con().close();
	}
	
	//데이터수정 메서드
	public void update(AddVO vo)throws Exception{
		String sql="update tbl_address set aname=?, address=?, tel=? where ano=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getAname());
		ps.setString(2, vo.getAddress());
		ps.setString(3, vo.getTel());
		ps.setInt(4, vo.getAno());
		ps.execute();
		con().close();
	}
}
