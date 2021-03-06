package ex0506;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO {
	
	public Connection con() throws Exception{
	      
	      String driver = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String user = "haksa";
	      String password = "pass";

	      Class.forName(driver);
	      Connection con=DriverManager.getConnection(url, user, password);
	      return con;
	}
	
	//���º� ������
	public ArrayList<CVO> clist(String lcode)throws Exception{
		ArrayList<CVO> list=new ArrayList<CVO>();
		String sql="select clcode, lname, pname, room, avg(grade), count(scode) cnt from couenr where clcode like ? group by clcode,lname,pname,room";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			CVO vo=new CVO();
			vo.setLcode(rs.getString("clcode"));
			vo.setLname(rs.getString("lname"));
			vo.setAvg(rs.getDouble("avg"));
			vo.setPname(rs.getString("pname"));
			vo.setRoom(rs.getString("room"));
			vo.setCnt(rs.getInt("cnt"));
			list.add(vo);
			System.out.println(vo.toString());
		}
		return list;
	}
	
	//�л��� ������
	public ArrayList<SVO> slist()throws Exception{
		ArrayList<SVO> list=new ArrayList<SVO>();
		String sql="select scode, sname, dept, avg(grade) avg, count(lcode) count from stuenr group by scode, sname, dept";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			SVO vo=new SVO();
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("sname"));
			//vo.setAvg(rs.getDouble("avg"));
			vo.setDept(rs.getString("dept"));
			vo.setAvg(rs.getDouble("avg"));
			vo.setCount(rs.getInt("count"));
			list.add(vo);
			System.out.println(vo.toString());
		}
		return list;
	}
}
