<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
HttpSession s1 = request.getSession();

if(s1.getAttribute("drname") == null) {
	response.sendRedirect("doctorLogin.html");
} else { %>

	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard | MediCare</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
:root{
  --primary:#0f172a;
  --accent:#2563eb;
  --success:#16a34a;
  --danger:#dc2626;
  --bg:#f1f5f9;
  --card:#ffffff;
  --muted:#64748b;
}

*{margin:0;padding:0;box-sizing:border-box;font-family:system-ui;}

body{background:var(--bg);}

/* Layout */
.wrapper{
  display:flex;
  min-height:100vh;
}

/* Main */
.main{
  flex:1;
  display:flex;
  flex-direction:column;
}

/* Header */
.header{
  background:var(--card);
  padding:20px 30px;
  border-bottom:1px solid #e5e7eb;
  display:flex;
  justify-content:space-between;
  align-items:center;
}

.header h2{color:var(--primary);}
.header span{font-size:13px;color:var(--muted);}

/* Content */
.container{
  padding:30px;
}

/* Table Card */
.table-box{
  background:var(--card);
  border-radius:14px;
  border:1px solid #e5e7eb;
  box-shadow:0 8px 20px rgba(0,0,0,0.05);
  overflow:hidden;
}

table{
  width:100%;
  border-collapse:collapse;
}

th{
  background:#f8fafc;
  padding:14px;
  text-align:left;
  font-size:12px;
  color:var(--muted);
  text-transform:uppercase;
}

td{
  padding:14px;
  border-bottom:1px solid #f1f5f9;
  font-size:14px;
}

tbody tr:hover{background:#f8fafc;}

/* Buttons */
.btn{
  padding:6px 12px;
  border-radius:6px;
  font-size:13px;
  font-weight:600;
  text-decoration:none;
}

.view{background:var(--accent);color:white;}
.edit{background:var(--success);color:white;}
.delete{border:1px solid var(--danger);color:var(--danger);}

.delete:hover{
  background:var(--danger);
  color:white;
}

/* Sidebar */
.sidebar{
  width:260px;
  background:var(--card);
  border-right:1px solid #e5e7eb;
  padding:25px 20px;
}

.sidebar h4{
  margin-bottom:20px;
  color:var(--primary);
}

.profile{
  background:#f8fafc;
  padding:15px;
  border-radius:12px;
  margin-bottom:25px;
}

.profile span{
  display:block;
  font-size:12px;
  color:var(--muted);
}

.sidebar a{
  display:block;
  padding:10px 12px;
  margin-bottom:8px;
  border-radius:10px;
  text-decoration:none;
  font-weight:600;
  color:var(--primary);
}

.sidebar a:hover{background:#f1f5f9;}

.logout{color:var(--danger);}
.empty{text-align:center;padding:30px;color:var(--muted);}
</style>
</head>

<body>

<%
HttpSession sp = request.getSession();
String doctorName = (String) sp.getAttribute("drname");
if(doctorName == null){ doctorName = "Doctor"; }

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/clinicapp","root","root");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
"select * from patientinfo where pdname='"+doctorName+"'");
%>

<div class="wrapper">

<!-- SIDEBAR -->
<div class="sidebar">
  <h4>Doctor Panel</h4>
  <div class="profile">
    <strong><%=doctorName%></strong>
    <span>Logged in</span>
  </div>
  <a href="#">Dashboard</a>
  <a href="#">My Appointments</a>
  <a href="#">Patients</a>
  <a href="#">Profile</a>
  <a href="doctorLogout.jsp" class="logout">Logout</a>
</div>

<!-- MAIN -->
<div class="main">

  <!-- Header -->
  <div class="header">
    <div>
      <h2>👨‍⚕️ Welcome, <%=doctorName%></h2>
      <span>Patient Management Dashboard</span>
    </div>
    <a href="doctorLogout" class="btn delete">Logout</a>
  </div>

  <!-- Content -->
  <div class="container">
    <div class="table-box">
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Patient</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Department</th>
            <th>Date</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <%
          boolean found=false;
          while(rs.next()){
            found=true;
        %>
          <tr>
            <td><%=rs.getInt("pid")%></td>
            <td><%=rs.getString("pname")%></td>
            <td><%=rs.getString("pemail")%></td>
            <td><%=rs.getString("phoneno")%></td>
            <td><%=rs.getString("pdept")%></td>
            <td><%=rs.getString("pdate")%></td>
            <td>
              <a class="btn view" href="viewPatient.jsp?id=<%=rs.getInt("pid")%>">View</a>
              <a class="btn edit" href="editPatient.jsp?id=<%=rs.getInt("pid")%>">Edit</a>
              <a class="btn delete" href="deletePatient.jsp?id=<%=rs.getInt("pid")%>"
                 onclick="return confirm('Are you sure?')">Delete</a>
            </td>
          </tr>
        <%
          }
          if(!found){
            out.println("<tr><td colspan='7' class='empty'>No patients found</td></tr>");
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>


</div>
</body>
</html>
	
 <% } %>

