<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0423.*" %>

<%
	String strLprice=request.getParameter("lprice");
	int lprice=Integer.parseInt(strLprice);
	String strHprice=request.getParameter("hprice");
	int hprice=Integer.parseInt(strHprice);
	String sid=request.getParameter("sid");
	
	ShopVO vo=new ShopVO();
	vo.setSid(sid);
	vo.setLprice(lprice);
	vo.setHprice(hprice);
	
	ShopDAO dao=new ShopDAO();
	dao.update(vo);
%>