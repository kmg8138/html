<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*"%>

<%
	String strGno=request.getParameter("gno");
	int gno=Integer.parseInt(strGno);
	
	GradeDAO dao=new GradeDAO();
	dao.delete(gno);
%>

<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>