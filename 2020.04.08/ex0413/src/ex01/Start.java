package ex01;

import java.util.*;

public class Start {

	public static void main(String[] args)throws Exception {
		BBSDAO dao=new BBSDAO();
		ArrayList<BBSVO> array=dao.list();
		/*
		for(int i=0; i<array.size(); i++) {
			BBSVO vo=array.get(i);
			System.out.println(vo.getBno()+vo.getTitle()+vo.getWdate());
		}
		*/
		/*
		//�������Է�
		BBSVO vo=new BBSVO();
		vo.setTitle("���ο� ������ �Է��մϴ�.");
		vo.setContent("���ο� ������ �Է��մϴ�.");
		dao.insert(vo);
		System.out.println("�ԷµǾ����ϴ�.");
		*/
		
		/*
		//�������ϱ�
		BBSVO vo=dao.read(1);
		System.out.println("��ȣ:"+vo.getBno());
		System.out.println("����:"+vo.getTitle());
		System.out.println("����:"+vo.getContent());
		System.out.println("��¥:"+vo.getWdate());
		*/
		
		/*
		//�����ͻ���
		dao.delete(1);
		System.out.println("�����Ǿ����ϴ�.");
		*/
		
		//�����ͼ���
		BBSVO vo=new BBSVO();
		vo.setBno(7);
		vo.setTitle("�ٲ�");
		vo.setContent("�ٲ�");
		dao.update(vo);
	}

}
