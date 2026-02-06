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
String docId = request.getParameter("id");
String approve = request.getParameter("approve");

String status = "APPROVED";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp", "root", "root");

PreparedStatement pst =
    con.prepareStatement("update doctorinfo set status=? where did=?");

pst.setString(1, status);
pst.setInt(2, Integer.parseInt(docId));
pst.executeUpdate();

out.println("Doctor Status Updated");
%>


</body>
</html>