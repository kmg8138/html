/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2020-05-06 02:26:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ex0506.*;
import java.util.*;
import java.text.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<h1>[강좌별 평균점수]</h1>\r\n");
      out.write("\t<table border=1 width=700>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>강좌번호</td>\r\n");
      out.write("\t\t\t<td>강좌명</td>\r\n");
      out.write("\t\t\t<td>담당교수</td>\r\n");
      out.write("\t\t\t<td>강의실</td>\r\n");
      out.write("\t\t\t<td>평균점수</td>\r\n");
      out.write("\t\t\t<td>수강인원</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

		EDAO dao=new EDAO();
		ArrayList<CVO> list=dao.clist();
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
		
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<h1>[학생별 평균점수]</h1>\r\n");
      out.write("\t<table border=1 width=700>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>학번</td>\r\n");
      out.write("\t\t\t<td>학생명</td>\r\n");
      out.write("\t\t\t<td>학과</td>\r\n");
      out.write("\t\t\t<td>평균점수</td>\r\n");
      out.write("\t\t\t<td>수강과목수</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t");

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
		
      out.write("\r\n");
      out.write("\t</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
