<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ page import="java.io.*,java.util.*"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>

<html>
<head>
<title>500 - 系统内部错误</title>
</head>

<body scroll="yes">
<div>
&nbsp;&nbsp;
<h1>系统发生内部错误</h1>
</div>


程序发生了错误，有可能该页面正在调试或者是设计上的缺陷.
<br />
你可以选择
<a href="#">反馈</a>，或者
<br />
<a href="javascript:history.go(-1)">返回上一页</a>
<div scroll="yes">
<table border=1>
<tr><td>
<h2><font color=#DB1260>JSP Error Message</font></h2>
<p>An exception was thrown: <b> <%=exception.getClass()%>:<%=exception.getMessage()%></b></p>
<%
	Enumeration<String> e = request.getHeaderNames();
	String key;
	while (e.hasMoreElements())
	{
		key = e.nextElement();
	}
	e = request.getAttributeNames();
	while (e.hasMoreElements())
	{
		key = e.nextElement();
	}
	e = request.getParameterNames();
	while (e.hasMoreElements())
	{
		key = e.nextElement();
	}
%>
<%=request.getAttribute("javax.servlet.forward.request_uri")%><br>
<%=request.getAttribute("javax.servlet.forward.servlet_path")%>
<p>With the following stack trace:</p>
<pre>
<%
	//exception.printStackTrace();
	ByteArrayOutputStream ostr = new ByteArrayOutputStream();
	exception.printStackTrace(new PrintStream(ostr));
	out.print(ostr);
%>
</pre>

</td></tr>
</table>

</div>
</body>
</html>