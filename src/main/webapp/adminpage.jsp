<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard | MediCare</title>

<style>
:root{
  --primary:#0f172a;
  --accent:#3b82f6;
  --success:#10b981;
  --danger:#ef4444;
  --bg:#f8fafc;
  --muted:#64748b;
}

*{margin:0;padding:0;box-sizing:border-box;font-family:system-ui;}

body{
  background:var(--bg);
  min-height:100vh;
}

/* Header */
.header{
  background:white;
  padding:20px 30px;
  border-bottom:1px solid #e2e8f0;
}
.header h2{color:var(--primary);}
.header p{color:var(--muted);}

/* Cards */
.cards{
  display:grid;
  grid-template-columns:repeat(3,1fr);
  gap:20px;
  padding:25px 30px;
}
.card{
  background:white;
  padding:20px;
  border-radius:12px;
  border:1px solid #e2e8f0;
}
.card small{color:var(--muted);}
.card h3{margin-top:8px;font-size:22px}

/* Table */
.table-box{
  background:white;
  margin:0 30px 30px;
  border-radius:12px;
  overflow:hidden;
  border:1px solid #e2e8f0;
}
table{width:100%;border-collapse:collapse;}
th{
  background:#f1f5f9;
  padding:14px;
  text-align:left;
  font-size:12px;
  color:var(--muted);
}
td{
  padding:14px;
  border-bottom:1px solid #f1f5f9;
}

.badge{
  padding:4px 10px;
  border-radius:20px;
  font-size:12px;
  font-weight:600;
}
.pending{background:#fef3c7;color:#92400e;}

.btn{
  padding:7px 14px;
  border-radius:6px;
  font-size:13px;
  text-decoration:none;
  font-weight:600;
}
.approve{background:var(--success);color:white;}
.reject{border:1px solid var(--danger);color:var(--danger);}
.empty{text-align:center;padding:40px;color:var(--muted);}
</style>
</head>

<body>

<!-- Header -->
<div class="header">
  <h2>👨‍⚕️ Admin Dashboard</h2>
  <p>Pending verification overview</p>
</div>

<!-- Cards (UI only, count derived from SAME query) -->
<div class="cards">
  <div class="card">
    <small>Pending Requests</small>
    <h3>
      <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/clinicapp","root","root");
        Statement st = con.createStatement();
        ResultSet countRs = st.executeQuery(
          "select count(*) from doctorinfo where status='PENDING'");
        countRs.next();
        out.print(countRs.getInt(1));
      %>
    </h3>
  </div>

  <div class="card">
    <small>Status</small>
    <h3 style="color:var(--accent)">Verification Panel</h3>
  </div>

  <div class="card">
    <small>System</small>
    <h3>MediCare</h3>
  </div>
</div>

<!-- SAME TABLE / SAME LOGIC -->
<div class="table-box">
<table>
<thead>
<tr>
  <th>Doctor</th>
  <th>Specialization</th>
  <th>License</th>
  <th>Status</th>
  <th>Action</th>
</tr>
</thead>

<tbody>
<%
  ResultSet rs = st.executeQuery(
    "select * from doctorinfo where status='PENDING'");
  boolean found=false;

  while(rs.next()){
    found=true;
%>
<tr>
  <td>
    <strong><%=rs.getString("dname")%></strong><br>
    <small style="color:var(--muted)"><%=rs.getString("demail")%></small>
  </td>
  <td><%=rs.getString("dspec")%></td>
  <td><%=rs.getString("medilno")%></td>
  <td><span class="badge pending">Pending</span></td>
  <td>
    <a class="btn approve"
       href="updateStatus.jsp?id=<%=rs.getInt("did")%>&action=approve">
       Approve
    </a>
    <a class="btn reject"
       href="updateStatus.jsp?id=<%=rs.getInt("did")%>&action=reject">
       Reject
    </a>
  </td>
</tr>
<%
  }
  if(!found){
    out.println("<tr><td colspan='5' class='empty'>No pending requests</td></tr>");
  }
%>
</tbody>
</table>
</div>

</body>
</html>
