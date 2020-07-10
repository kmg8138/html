<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String title=request.getParameter("title");
	String article=request.getParameter("article");

	out.println(title);
	out.println(article);
	
	BlogVO vo=new BlogVO();
	vo.setTitle(title);
	vo.setArticle(article);
	
	BlogDAO dao=new BlogDAO();
	dao.insert(vo);
	
	out.println("저장되었습니다.");
%>    
<script>
	location.href="list.jsp";
</script>
