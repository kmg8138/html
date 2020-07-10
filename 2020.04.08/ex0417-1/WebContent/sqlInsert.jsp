<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*"%>

<%
	String content=request.getParameter("content");
	
	ReplayDAO dao=new ReplayDAO();
	dao.insert(content);
%>

<script>
	alert("댓글이 입력되었습니다.");
	location.href="list.jsp";
</script>