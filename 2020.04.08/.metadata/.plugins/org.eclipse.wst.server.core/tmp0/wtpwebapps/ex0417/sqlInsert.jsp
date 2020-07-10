<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*" %>

<%
	String gname=request.getParameter("gname");
	String strKor=request.getParameter("kor");
	int kor=Integer.parseInt(strKor);
	String strEng=request.getParameter("eng");
	int eng=Integer.parseInt(strEng);
	String strMat=request.getParameter("mat");
	int mat=Integer.parseInt(strMat);
	
	GradeVO vo=new GradeVO();
	GradeDAO dao= new GradeDAO();
	vo.setGname(gname);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	dao.insert(vo);
%>
<script>
	alert("등록되었습니다");
	location.href="list.jsp";
</script>