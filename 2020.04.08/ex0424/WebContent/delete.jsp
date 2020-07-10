<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0424.*" %>

<%
	String address_name=request.getParameter("address_name");
	
	PlaceDAO dao=new PlaceDAO();
	dao.delete(address_name);
%>