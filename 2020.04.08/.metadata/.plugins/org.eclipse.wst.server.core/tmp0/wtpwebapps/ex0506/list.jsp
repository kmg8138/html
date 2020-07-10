<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="ex0506.*,java.util.*,java.text.*" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>[강좌별 평균점수]</h1>
	<table border=1 width=700>
		<tr>
			<td>강좌번호</td>
			<td>강좌명</td>
			<td>담당교수</td>
			<td>강의실</td>
			<td>평균점수</td>
			<td>수강인원</td>
		</tr>
		<%
		EDAO dao=new EDAO();
		ArrayList<CVO> list=dao.clist("%%");
		for(CVO vo:list){
			out.println("<tr>");
			out.println("<td>"+vo.getLcode()+"</td>");
			out.println("<td>"+vo.getLname()+"</td>");
			out.println("<td>"+vo.getPname()+"</td>");
			out.println("<td>"+vo.getRoom()+"</td>");
			DecimalFormat df=new DecimalFormat("#0.00");
			String strAvg=df.format(vo.getAvg());
			out.println("<td>"+vo.getAvg()+"</td>");
			out.println("<td>"+vo.getCnt()+"</td>");
			out.println("</tr>");
		}
		%>
	</table>
	<h1>[학생별 평균점수]</h1>
	<table border=1 width=700>
		<tr>
			<td>학번</td>
			<td>학생명</td>
			<td>학과</td>
			<td>평균점수</td>
			<td>수강과목수</td>
		</tr>
		<%
		ArrayList<SVO> list1=dao.slist();
		for(SVO vo:list1){
			out.println("<tr>");
			out.println("<td>"+vo.getScode()+"</td>");
			out.println("<td>"+vo.getSname()+"</td>");
			out.println("<td>"+vo.getDept()+"</td>");
			out.println("<td>"+vo.getAvg()+"</td>");
			DecimalFormat df=new DecimalFormat("#0.00");
			String strAvg=df.format(vo.getAvg());
			out.println("<td>"+vo.getCount()+"</td>");
			out.println("</tr>");
		}
		%>
	</table>
</body>
</html>