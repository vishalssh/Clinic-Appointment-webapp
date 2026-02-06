<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Registration</title>
</head>
<body>

<%
String dName = request.getParameter("docName");
String lic   = request.getParameter("license");
String dEmail= request.getParameter("docEmail");
String pass  = request.getParameter("pwd");
String dspec = request.getParameter("specialization");

/* ---------- Validation ---------- */
if(dName == null || dName.trim().isEmpty()){
    out.println("Doctor name is required");
    return;
}

if(!dName.matches("[A-Za-z .]+")){
    out.println("Doctor name must contain only letters, spaces, and dots");
    return;
}

if(lic == null || lic.trim().isEmpty()){
    out.println("License number is required");
    return;
}

if(dEmail == null || !dEmail.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")){
    out.println("Invalid email address");
    return;
}

if(pass == null || pass.length() < 6){
    out.println("Password must be at least 6 characters");
    return;
}

if(dspec == null || dspec.trim().isEmpty()){
    out.println("Specialization is required");
    return;
}


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp","root","root");

PreparedStatement pst = con.prepareStatement("insert into doctorinfo(dname, medilno, demail, dpass, dspec) values (?,?,?,?,?)");

pst.setString(1, dName);
pst.setString(2, lic);
pst.setString(3, dEmail);
pst.setString(4, pass);
pst.setString(5, dspec);

pst.executeUpdate();

out.println("Doctor registration successful");
%>

</body>
</html>
