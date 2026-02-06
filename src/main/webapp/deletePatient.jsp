<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String x = request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp", "root", "root");
con.prepareStatement("delete from patientinfo where pid ='"+x+"' ").executeUpdate();

out.println("<script>");
out.println("alert('Record Deleted!')");
out.println("window.location.href='doctorDash.jsp'");
out.println("</script>");
%>

</body>
</html>