<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String aname=request.getParameter("aname");
	String address=request.getParameter("address");
	String tel=request.getParameter("tel");
	
	out.println("<h1>"+aname+"</h1>");
	out.println("<h1>"+address+"</h1>");
	out.println("<h1>"+tel+"</h1>");
	
	AddVO vo=new AddVO();
	vo.setAname(aname);
	vo.setAddress(address);
	vo.setTel(tel);
	
	AddDAO dao=new AddDAO();
	dao.insert(vo);
%>
<script>
	alert("저장되었습니다.");
	location.href="list.jsp";
</script>