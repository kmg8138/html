package ex0416;

import java.util.ArrayList;

public class test {

	public static void main(String[] args) throws Exception{
		//������ �׽�Ʈ
		productDAO dao=new productDAO();
		ArrayList<productVO> list=dao.list();
		
		for(int i=0; i<list.size(); i++) {
			productVO vo=list.get(i);
			System.out.println(vo.getPno()+vo.getPname()+vo.getPrice());
		}


	}

}
