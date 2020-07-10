package ex0417;

import java.util.ArrayList;


public class test {

	public static void main(String[] args) throws Exception{
		
	}
	
	public static void list() throws Exception{
		//list() 메서드 테스트
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		ArrayList<GradeVO> list=dao.list();
		for(int i=0; i<list.size(); i++) {
			vo=list.get(i);
			System.out.println(vo.getGno()+vo.getGname()+vo.getKor()+vo.getEng()+vo.getMat());
		}
	}	
	
	public static void insert() throws Exception{
		//insert() 메서드 테스트
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		vo.setGname("김미경");
		vo.setKor(10);
		vo.setEng(20);
		vo.setMat(30);
		dao.insert(vo);
		System.out.println(vo.getKor());
		System.out.println(vo.getEng());
		System.out.println(vo.getMat());
	}
	
	public static void update() throws Exception{
		//update() 메서드 테스트
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		vo.setGno(3);
		vo.setKor(40);
		vo.setEng(50);
		vo.setMat(60);
		dao.update(vo);
		System.out.println(vo.getKor());
		System.out.println(vo.getEng());
		System.out.println(vo.getMat());
	}	
		
	public static void delete() throws Exception{	
		//delete() 메서드 테스트
		GradeDAO dao=new GradeDAO();
		dao.delete(15);
	}

	

}
