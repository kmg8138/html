<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,ex01.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>글쓰기</title>
	</head>
<body>
	<h1>글쓰기</h1>
	<form action="sqlInsert.jsp">
		제목:<input type="text" name="title">
		<hr>
		내용:<textarea rows="5" cols="50" name="content"></textarea>
		<hr>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="삭제" onclick="location.href='sqlDelete.jsp'">
		<input type="button" value="목록" onclick="location.href='list.jsp'">
	</form>
</body>
</html>