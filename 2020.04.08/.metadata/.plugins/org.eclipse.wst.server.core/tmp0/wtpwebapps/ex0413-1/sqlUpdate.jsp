<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*"%>
<%
	String aname=request.getParameter("aname");
	String address=request.getParameter("address");
	String tel=request.getParameter("tel");
	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	
	
	AddVO vo=new AddVO();
	vo.setAno(ano);
	vo.setAname(aname);
	vo.setAddress(address);
	vo.setTel(tel);
	
	AddDAO dao=new AddDAO();
	dao.update(vo);
%>
<script>
	alert("수정이 완료되었습니다.")
	location.href="list.jsp"
</script>