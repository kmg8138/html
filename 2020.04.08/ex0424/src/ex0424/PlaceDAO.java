package ex0424;

import java.sql.*;
import java.util.ArrayList;

public class PlaceDAO {
	
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
			
		//�������Է�
			public void insert(PlaceVO vo)throws Exception{
				String sql="insert into tbl_place(place_name,address_name,phone) values(?,?,?)";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, vo.getPlace_name());
				ps.setString(2, vo.getAddress_name());
				ps.setString(3, vo.getPhone());
				ps.execute();
				
				con().close();
			}
		
		//��ü ������ ���� ���
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
		//������ ��� ���
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
			
			//�����ͻ���
			public void delete(String address_name)throws Exception{
				String sql="delete from tbl_place where address_name=?";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, address_name);
				ps.execute();
				con().close();
			}
			

}
