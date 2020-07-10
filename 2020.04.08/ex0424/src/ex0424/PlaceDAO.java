package ex0424;

import java.sql.*;
import java.util.ArrayList;

public class PlaceDAO {
	
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
			
		//데이터입력
			public void insert(PlaceVO vo)throws Exception{
				String sql="insert into tbl_place(place_name,address_name,phone) values(?,?,?)";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, vo.getPlace_name());
				ps.setString(2, vo.getAddress_name());
				ps.setString(3, vo.getPhone());
				ps.execute();
				
				con().close();
			}
		
		//전체 데이터 갯수 출력
			public int count()throws Exception{
				int count=0;
				String sql="select count(*) cnt from tbl_place";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					count=rs.getInt("cnt");
				}
				con().close();
				return count;
			}
		//데이터 목록 출력
			public ArrayList<PlaceVO> list()throws Exception{
				ArrayList<PlaceVO> list=new ArrayList<PlaceVO>();
				String sql="select * from tbl_place";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					PlaceVO vo=new PlaceVO();
					vo.setPlace_name(rs.getString("place_name"));
					vo.setAddress_name(rs.getString("address_name"));
					vo.setPhone(rs.getString("phone"));
					list.add(vo);
				}
				
				return list;
			}
			
			//데이터삭제
			public void delete(String address_name)throws Exception{
				String sql="delete from tbl_place where address_name=?";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, address_name);
				ps.execute();
				con().close();
			}
			

}
