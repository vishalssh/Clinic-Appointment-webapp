<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediCare | Book Appointment</title>

<style>
/* ===== Global ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    background:#f4f9ff;
    color:#333;
}

/* ===== Navbar ===== */
nav{
    background:#ffffff;
    padding:15px 6%;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
}

.logo{
    font-size:26px;
    font-weight:700;
    color:#0d6efd;
}

nav a{
    margin-left:15px;
    text-decoration:none;
    padding:8px 16px;
    border-radius:6px;
    font-weight:500;
}

.btn-primary{
    background:#0d6efd;
    color:#fff;
}

.btn-primary:hover{
    background:#0b5ed7;
}

.btn-secondry{
    border:1px solid #0d6efd;
    color:#0d6efd;
}

.btn-secondry:hover{
    background:#0d6efd;
    color:#fff;
}

/* ===== Hero ===== */
.hero{
    padding:70px 6%;
    display:flex;
    align-items:center;
    justify-content:space-between;
    background:linear-gradient(135deg,#e8f2ff,#ffffff);
}

.hero-content{
    max-width:550px;
}

.hero h1{
    font-size:44px;
    color:#002b5b;
    margin-bottom:15px;
}

.hero p{
    font-size:16px;
    color:#555;
    margin-bottom:25px;
}

.hero img{
    max-width:420px;
    border-radius:20px;
    box-shadow:0 15px 30px rgba(0,0,0,0.15);
}

/* ===== Booking Section ===== */
.booking-container{
    padding:60px 6%;
    display:flex;
    justify-content:center;
}

.booking-card{
    background:#fff;
    width:100%;
    max-width:520px;
    padding:35px;
    border-radius:15px;
    box-shadow:0 20px 40px rgba(0,0,0,0.1);
    animation:fadeUp 0.8s ease;
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

.booking-card h2{
    text-align:center;
    margin-bottom:25px;
    color:#0d6efd;
}

/* ===== Form ===== */
.form-group{
    margin-bottom:18px;
}

.form-group label{
    font-weight:600;
    margin-bottom:6px;
    display:block;
}

.form-group input,
.form-group select{
    width:100%;
    padding:10px 12px;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:14px;
}

.form-group input:focus,
.form-group select:focus{
    outline:none;
    border-color:#0d6efd;
    box-shadow:0 0 0 2px rgba(13,110,253,0.2);
}

button{
    width:100%;
    padding:12px;
    font-size:16px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform:translateY(-2px);
}

/* ===== Footer ===== */
footer{
    margin-top:60px;
    background:#002b5b;
    color:#fff;
    text-align:center;
    padding:20px;
}
</style>
</head>

<body>

<nav>
    <div class="logo">MediCare +</div>
    <div>
        <a href="#book" class="btn-primary">Book Now</a>
        <a href="doctorLogin.html" class="btn-secondry">Doctor Login</a>
        <a href="adminpage.jsp" class="btn-secondry">Admin</a>
    </div>
</nav>

<header class="hero">
    <div class="hero-content">
        <h1>Your Health, Our Commitment</h1>
        <p>Book appointments with trusted specialists in seconds. Quality healthcare made simple.</p>
        <a href="#book" class="btn-primary">View Availability</a>
    </div>
    <img src="https://via.placeholder.com/420x300?text=Professional+Healthcare" alt="Doctor">
</header>

<section id="book" class="booking-container">
    <div class="booking-card">
        <h2>Book Appointment</h2>

        <form action="savePatientData.jsp" method="POST">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="patientName" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="patientEmail" required>
            </div>

            <div class="form-group">
                <label>Department</label>
                <select name="department">
                    <option>General Checkup</option>
                    <option>Cardiology</option>
                    <option>Pediatrics</option>
                    <option>Dentistry</option>
                </select>
            </div>

            <div class="form-group">
                <label>Doctor</label>
                <select name="doctorP">
                <%
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/clinicapp","root","root");
                    PreparedStatement ps =
                        con.prepareStatement("select dname from doctorinfo where status='APPROVED'");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                %>
                    <option><%= rs.getString("dname") %></option>
                <% } %>
                </select>
            </div>

            <div class="form-group">
                <label>Appointment Date</label>
                <input type="date" name="appointmentDate" required>
            </div>

            <div class="form-group">
                <label>Contact Number</label>
                <input type="tel" name="phone" required>
            </div>

            <button class="btn-primary">Confirm Booking</button>
        </form>
    </div>
</section>

<footer>
    <p>&copy; 2026 MediCare Clinic | All Rights Reserved</p>
</footer>

</body>
</html>
