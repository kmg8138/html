<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0424.*" %>

<%
	String place_name=request.getParameter("place_name");
	String address_name=request.getParameter("address_name");
	String phone=request.getParameter("phone");

	PlaceVO vo=new PlaceVO();
	vo.setPlace_name(place_name);
	vo.setAddress_name(address_name);
	vo.setPhone(phone);
	
	PlaceDAO dao=new PlaceDAO();
	dao.insert(vo);
%>