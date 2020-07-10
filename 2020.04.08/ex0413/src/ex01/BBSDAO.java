package ex01;

import java.sql.*;
import java.util.*;

public class BBSDAO {
	//데이터베이스 접속 메서드
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
	
	//데이터 목록 출력
	public ArrayList<BBSVO> list()throws Exception{
		ArrayList<BBSVO> array=new ArrayList<BBSVO>();
		String sql="select * from tbl_bbs order by bno desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			BBSVO vo=new BBSVO();
			vo.setBno(rs.getInt("bno"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
			array.add(vo);
		}
		return array;
	}
	
	//데이터입력 메서드
	public void insert(BBSVO vo)throws Exception{
		String sql="insert into tbl_bbs(bno,title,content,wdate) values(seq_bbs.nextval,?,?,sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.execute();
		con().close();
	}
	
	//데이터읽기 메서드
	public BBSVO read(int bno)throws Exception{
		String sql="select * from tbl_bbs where bno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bno);
		ResultSet rs=ps.executeQuery();
		
		BBSVO vo=new BBSVO();
		if(rs.next()) {
			vo.setBno(rs.getInt("bno"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
		}
		return vo;
		
	}
	
	//데이터삭제 메서드
	public void delete(int bno)throws Exception{
		String sql="delete from tbl_bbs where bno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bno);
		ps.execute();
		con().close();
	}
	
	//데이터수정 메서드
	public void update(BBSVO vo)throws Exception{
		String sql="update tbl_bbs set title=?, content=? where bno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.setInt(3, vo.getBno());
		ps.execute();
		con().close();
	}
}
