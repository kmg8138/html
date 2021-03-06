<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strBno=request.getParameter("bno");
	int bno=Integer.parseInt(strBno);
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=dao.read(bno);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="home.css"/>
</head>
<body>
	<div id="page">
		<div id="content">
			<h3>글읽기</h3>
			<hr>
			<div id="menu">
				<a href="list.jsp">목록</a>
				<hr>
			</div>
			<form class="frm" action="sqlInsert.jsp">
				<table class="tblInsert">
					<tr>
						<td>Title</td>
						<td><input type="text" size="75" name="title" value="<%=vo.getTitle()%>"></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="80" name="content"><%=vo.getContent()%></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="button">
							<input class="button" type="submit" value="수정">
							<input class="button" type="reset" value="취소">
							<input class="button" type="button" value="삭제"> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>