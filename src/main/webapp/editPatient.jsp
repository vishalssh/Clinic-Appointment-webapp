<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
    .hero {
      background: url('https://via.placeholder.com/1600x600') no-repeat center center;
      background-size: cover;
      color: white;
      padding: 100px 0;
    }
    .hero h1 {
      font-size: 3rem;
      font-weight: bold;
    }
    .appointment-form {
      background: #f8f9fa;
      padding: 30px;
      border-radius: 10px;
    }
    .navbar-brand {
      font-weight: bold;
      color: #0d6efd !important;
    }
  </style>
</head>
<body>
<%
String x = request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp", "root", "root");

PreparedStatement ps = con.prepareStatement("select * from patientinfo where pid = '"+x+"'");
ResultSet rs = ps.executeQuery();

rs.next();


%>


<section id="appointment" class="py-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="appointment-form shadow">
          <h3 class="mb-4 text-center">Edit Patient Info</h3>
          <form action = "UpdatePatientInfo.jsp" method = "post">
          <div class="mb-3">
          <input type="hidden" value="<%=rs.getString("pid") %>" class="form-control" id="name" placeholder="Enter your name" name = "f">
          </div>
            <div class="mb-3">
              <label for="name" class="form-label">Full Name</label>
              <input type="text" value="<%=rs.getString("pname") %>" class="form-control" id="name" placeholder="Enter your name" name = "t1">
            </div>
            <div class="mb-3">
              <label for="email"  class="form-label">Email Address</label>
              <input type="email" value="<%=rs.getString("pemail") %>" class="form-control" id="email" placeholder="Enter your email" name = "t2">
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">Phone Number</label>
              <input type="tel" value="<%=rs.getString("phoneno") %>" class="form-control" id="phone" placeholder="Enter your phone number" name = "t3">
            </div>
            <div class="mb-3">
              <label for="date" class="form-label">Preferred Date</label>
              <input type="date" value="<%=rs.getString("pdate") %>" class="form-control" id="date" name = "t4">
            </div>
            <div class="mb-3">
            	<label for="date" class="form-label">Current Department</label>
          		<input type="text" value="<%=rs.getString("pdept") %>" class="form-control" id="name" disabled>
          	</div>
            <div class="mb-3">
              <label for="doctor" class="form-label">Select Dept</label>
              <select  value="<%=rs.getString("pdept") %>" class="form-select" id="specialization" name = "t5">
     
              <option value = "selected disabled">Select Dept..</option>
              <option value = "Cardiology">Cardiology</option>
              <option value = "Dermatology">Dermatology</option>
              <option value = "Pediatrics">Pediatrics</option>
              <option value = "Orthopedics">Orthopedics</option>
              <option value = "General Medicine">General Medicine</option>
              <option value = "Dentistry">Dentistry</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">Update</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>