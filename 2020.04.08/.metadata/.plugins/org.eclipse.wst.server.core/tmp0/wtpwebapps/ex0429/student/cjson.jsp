<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0429.*,java.util.*,org.json.simple.*"%>
<%
	CDAO cdao=new CDAO();
	ArrayList<CVO> list=cdao.list("%%");
	
	JSONObject jObject=new JSONObject();
	JSONArray JArray=new JSONArray();
	for(CVO vo:list){
		JSONObject obj=new JSONObject();
		obj.put("lcode",vo.getLcode());
		obj.put("lname",vo.getLname());
		JArray.add(obj);
	}
	jObject.put("clist",JArray);
	out.println(jObject);
%>