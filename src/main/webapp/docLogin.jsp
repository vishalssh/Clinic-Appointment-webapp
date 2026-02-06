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
String email, pass, name, id;
email = request.getParameter("email");
pass = request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp", "root", "root");
PreparedStatement pst = con.prepareStatement("select * from doctorinfo where demail = '"+email+"' and dpass = '"+pass+"' ");

ResultSet rs = pst.executeQuery();
if(rs.next()) {
name = rs.getString("dname");
id = rs.getString("did");
	HttpSession s1 = request.getSession();
	s1.setAttribute("drname", name);
	s1.setAttribute("did", id);
	out.println("<script>");
	out.println("alert('Login Successful!')");
	out.println("window.location.href = 'doctorDash.jsp'");
	out.println("</script>");
} else {
	out.println("<script>");
	out.println("alert('Login Failed!')");
	out.println("window.location.href = 'doctorLogin.html'");
	out.println("</script>");
}


%>
</body>
</html>