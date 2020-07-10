<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0423.*"%>
<%
	String query=request.getParameter("query");
	String display=request.getParameter("display");
	String start=request.getParameter("start");
	String result=NaverAPI.Search(query,display,start);
	out.println(result);
%>