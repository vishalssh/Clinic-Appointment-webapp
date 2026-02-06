<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Booking</title>
</head>
<body>

<%
String pName  = request.getParameter("patientName");
String pEmail = request.getParameter("patientEmail");
String dept   = request.getParameter("department");
String pdName = request.getParameter("doctorP");
String date   = request.getParameter("appointmentDate");
String phone  = request.getParameter("phone");


if(pName == null || pName.trim().isEmpty()){
    out.println("Patient name is required");
    return;
}
if(!pName.matches("[A-Za-z .]+")){
    out.println("Patient name must contain only letters, spaces, and dots");
    return;
}


if(pEmail == null || !pEmail.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")){
    out.println("Invalid email address");
    return;
}




if(date == null || date.trim().isEmpty()){
    out.println("Appointment date is required");
    return;
}

if(phone == null || !phone.matches("\\d{10}")){
    out.println("Phone number must be exactly 10 digits");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp","root","root");

PreparedStatement pst = con.prepareStatement("insert into patientinfo(pname, pemail, pdept, pdname, pdate, phoneno) values (?,?,?,?,?,?)");

pst.setString(1, pName);
pst.setString(2, pEmail);
pst.setString(3, dept);
pst.setString(4, pdName);
pst.setString(5, date);
pst.setString(6, phone);

pst.executeUpdate();

out.println("Patient booking successful");
%>

</body>
</html>
