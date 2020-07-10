<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="home.css"/>
	<style>
		a{color: black;}
	</style>
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>이송현의 블로그입니다...</h1>
		</div>
		<div id="menu">
			<div class="item"><a href="insert.jsp">글쓰기</a></div>
		</div>
		<div id="content">
		<%
			BlogDAO dao=new BlogDAO();
			ArrayList<BlogVO> list=dao.list();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 mm월 dd일 hh:mm:dd");
			DecimalFormat df=new DecimalFormat("#,###.00");
			for(int i=0; i<list.size(); i++){
				BlogVO vo=list.get(i);
				String serdate=sdf.format(vo.getWdate());
				out.print("<div class='box'>");
				out.print("<h1 class='title'>"+vo.getBno()+vo.getTitle()+"</h1>");
				out.print("<h3 class='date'>"+vo.getWdate()+"</h3>");
				out.print("<h3 class='article'>"+vo.getArticle()+"</h3>");
				out.print("<a href='sqlDelete.jsp?bno="+vo.getBno()+"'>삭제</a>");
				out.print("</div>");
			}
		%>
		</div>
		<div id="footer">
			<h3>작성자:ICIA 이송현</h3>
		</div>
	</div>	
</body>
</html>