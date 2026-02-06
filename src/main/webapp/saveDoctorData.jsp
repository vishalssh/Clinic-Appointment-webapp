<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Registration | MediCare Portal</title>
    
    <style>
        /* --- CSS INCLUDED IN JSP --- */
        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box; 
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; 
        }

        body { 
            background: #f0f4f8; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            min-height: 100vh; 
            padding: 20px;
        }

        .reg-wrapper { 
            display: flex; 
            background: white; 
            width: 100%;
            max-width: 900px; 
            border-radius: 15px; 
            overflow: hidden; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.1); 
        }

        /* Sidebar Styling */
        .reg-sidebar { 
            background: #003366; 
            color: white; 
            padding: 3rem; 
            width: 40%; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .reg-sidebar h2 { margin-bottom: 1rem; font-size: 1.8rem; line-height: 1.2; }
        .reg-sidebar p { opacity: 0.8; margin-bottom: 2rem; }
        
        .benefits { list-style: none; }
        .benefits li { 
            margin-bottom: 1rem; 
            font-size: 0.95rem; 
            display: flex;
            align-items: center;
        }
        .benefits li::before {
            content: "✓";
            margin-right: 10px;
            color: #4ade80;
            font-weight: bold;
        }

        /* Form Styling */
        .reg-form-container { 
            padding: 3rem; 
            width: 60%; 
        }

        .reg-form-container h3 { 
            margin-bottom: 1.5rem; 
            color: #333; 
            font-size: 1.5rem;
        }

        .form-row { 
            display: flex; 
            gap: 20px; 
        }

        .input-group { 
            margin-bottom: 1.2rem; 
            flex: 1; 
        }

        .input-group label { 
            display: block; 
            font-size: 0.85rem; 
            margin-bottom: 6px; 
            font-weight: 600; 
            color: #555; 
        }

        .input-group input, 
        .input-group select { 
            width: 100%; 
            padding: 12px; 
            border: 1px solid #d1d5db; 
            border-radius: 6px; 
            outline: none; 
            transition: border-color 0.2s;
        }

        .input-group input:focus {
            border-color: #007bff;
        }

        .btn-reg { 
            width: 100%; 
            padding: 14px; 
            background: #007bff; 
            color: white; 
            border: none; 
            border-radius: 6px; 
            font-weight: bold; 
            font-size: 1rem;
            cursor: pointer; 
            margin-top: 1rem;
            transition: background 0.3s;
        }

        .btn-reg:hover { background: #0056b3; }

        .terms { 
            font-size: 0.8rem; 
            color: #6b7280; 
            margin-top: 15px; 
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .reg-wrapper { flex-direction: column; }
            .reg-sidebar, .reg-form-container { width: 100%; padding: 2rem; }
        }
    </style>
</head>
<body>

    <div class="reg-wrapper">
        <div class="reg-sidebar">
            <h2>Join Our Medical Network</h2>
            <p>Empowering doctors with better tools to reach more patients.</p>
            <ul class="benefits">
                <li>Manage Digital Appointments</li>
                <li>Access E-Prescriptions</li>
                <li>Secure Patient Messaging</li>
                <li>Telehealth Integration</li>
            </ul>
        </div>

        <div class="reg-form-container">
            <form action="saveDoctorInfo.jsp" method="POST">
                <h3>Doctor Account Setup</h3>
                
                <div class="form-row">
                    <div class="input-group">
                        <label>Full Name</label>
                        <input type="text" name="docName" placeholder="e.g. Dr. Sarah Connor" required>
                    </div>
                    <div class="input-group">
                        <label>Medical License No.</label>
                        <input type="text" name="license" placeholder="ABC123456" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-group">
                        <label>Specialization</label>
                        <select name="specialization">
                            <option value="general">General Medicine</option>
                            <option value="cardiology">Cardiology</option>
                            <option value="pediatrics">Pediatrics</option>
                            <option value="neurology">Neurology</option>
                            <option value="dermatology">Dermatology</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label>Years of Experience</label>
                        <input type="number" name="experience" min="0" placeholder="0">
                    </div>
                </div>

                <div class="input-group">
                    <label>Work Email Address</label>
                    <input type="email" name="docEmail" placeholder="dr.smith@clinic.com" required>
                </div>

                <div class="input-group">
                    <label>Create Password</label>
                    <input type="password" name="pwd" required>
                </div>


                <button type="submit" class="btn-reg">Register</button>
            </form>
        </div>
    </div>
    

</body>
</html>