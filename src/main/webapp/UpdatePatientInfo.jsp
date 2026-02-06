<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String a,b,c,d,e;

a=request.getParameter("t1");
b=request.getParameter("t2");
c=request.getParameter("t3");
d=request.getParameter("t4");
e=request.getParameter("f");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp", "root", "root");

con.prepareStatement("update patientinfo set pname = '"+a+"',pemail ='"+b+"',phoneno = '"+c+"',pdate = '"+d+"' where pid = '"+e+"'").executeUpdate();

out.println("<script>");
out.println("alert('Record Update')");
out.println("window.location.href='PatientInfo.jsp'");
%>
</body>
</html>