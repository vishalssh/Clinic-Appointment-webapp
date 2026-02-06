<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    background: linear-gradient(135deg, #2b7cff, #6fd6ff);
}

.container{
    background:#fff;
    width:360px;
    padding:30px;
    border-radius:12px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
}

.container h2{
    text-align:center;
    color:#2b7cff;
    margin-bottom:10px;
}

.container p{
    text-align:center;
    font-size:14px;
    color:#666;
    margin-bottom:20px;
}

input{
    width:100%;
    padding:10px 12px;
    margin-bottom:15px;
    border-radius:6px;
    border:1px solid #ccc;
    font-size:14px;
}

input:focus{
    border-color:#2b7cff;
    outline:none;
}

button{
    width:100%;
    padding:12px;
    background:#2b7cff;
    border:none;
    border-radius:6px;
    color:#fff;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#1f63cc;
}

.msg{
    margin-top:15px;
    text-align:center;
    font-size:14px;
}

.msg a{
    color:#2b7cff;
    text-decoration:none;
    font-weight:bold;
}

.msg a:hover{
    text-decoration:underline;
}
</style>
</head>

<body>

<div class="container">
    <h2>Forgot Password</h2>
    <p>Enter your email and new password</p>

    <form action="forgotpass.jsp" method="post">
        <input type="email" name="email" placeholder="Enter email" required>
        <input type="password" name="newPass" placeholder="New password" required>
        <button type="submit">Reset Password</button>
    </form>

    <%
    String email = request.getParameter("email");
    String newPass = request.getParameter("newPass");

    if(email != null && newPass != null){
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinicapp","root","root");

        PreparedStatement ps = con.prepareStatement("update doctorinfo set dpass=? where demail=?");

        ps.setString(1, newPass);
        ps.setString(2, email);

        int i = ps.executeUpdate();

        if(i > 0){
    %>
            <div class="msg" style="color:green">
                Password updated.
                <a href="doctorLogin.html">Login</a>
            </div>
    <%
        } else {
    %>
            <div class="msg" style="color:red;">
                Email not found!
            </div>
    <%
        }
    }
    %>
</div>

</body>
</html>
