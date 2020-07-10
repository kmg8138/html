<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0424.*,org.json.simple.*,java.util.*"%>
<%
	PlaceDAO dao=new PlaceDAO();
	int count=dao.count();
	
	JSONObject jObject=new JSONObject();
	jObject.put("total",count);
	
	ArrayList<PlaceVO> array=dao.list();
	JSONArray jArray=new JSONArray();
	
	for(PlaceVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("place_name",vo.getPlace_name());
		obj.put("address_name",vo.getAddress_name());
		obj.put("phone",vo.getPhone());
		jArray.add(obj);
	}
	jObject.put("documents",jArray);
	out.println(jObject);
%>