<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0416.*" %>

<%
	String pname=request.getParameter("pname");
	String strPrice=request.getParameter("price");
	int price=Integer.parseInt(strPrice);
	
	productDAO dao=new productDAO();
	productVO vo=new productVO();
	vo.setPname(pname);
	vo.setPrice(price);
	dao.insert(vo);
%>
<script>
	alert("저장되었습니다");
	location.href="list.jsp";
</script>