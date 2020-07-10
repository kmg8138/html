<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	AddDAO dao=new AddDAO();
	AddVO vo=dao.read(ano);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>주소읽기</title>
	</head>
<body>
	<h1>주소쓰기</h1>
	<form action="sqlUpdate.jsp">
		<input type="hidden" name="ano" value="<%=ano%>">
		이름:<input type="text" name="aname" value="<%=vo.getAname()%>">
		<hr>
		주소:<textarea rows="1" cols="50" name="address"><%=vo.getAddress()%></textarea>
		<hr>
		전화번호:<textarea rows="1" cols="20" name="tel"><%=vo.getTel()%></textarea>
		<hr>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" value="삭제" onclick="location.href='sqlDelete.jsp?ano=<%=vo.getAno()%>'">
		<input type="button" value="목록" onclick="location.href='list.jsp'">
	</form>
</body>
</html>