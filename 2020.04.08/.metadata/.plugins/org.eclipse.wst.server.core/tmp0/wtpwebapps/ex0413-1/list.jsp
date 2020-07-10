<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ex01.*" %>
<%
	AddDAO dao=new AddDAO();
	ArrayList<AddVO> array=dao.list();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소 목록</title>
	<style>
		div{background: red; color: yellow; font-size: 30px;}
	</style>
</head>
<body>
	<h1>[주소 목록]</h1>
	<a href="insert.jsp">[주소 등록]</a>
	<%
		for(int i=0; i<array.size(); i++){
			AddVO vo=array.get(i);
			out.println("<div>");
			out.println(vo.getAno());
			out.println(vo.getAname());
			out.println("<a href='read.jsp?ano="+vo.getAno()+"'>"+vo.getAddress()+"</a>");
			out.println(vo.getTel());
			out.println("</div>");
		}
	%>
</body>
</html>