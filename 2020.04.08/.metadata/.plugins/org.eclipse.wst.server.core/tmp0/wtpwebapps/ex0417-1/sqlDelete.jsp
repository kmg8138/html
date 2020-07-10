<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*"%>

<%
	String strRno=request.getParameter("rno");
	int rno=Integer.parseInt(strRno);
	
	ReplayDAO dao=new ReplayDAO();
	dao.delete(rno);
%>

<script>
	alert("삭제가 완료되었습니다.");
	location.href="list.jsp";
</script>