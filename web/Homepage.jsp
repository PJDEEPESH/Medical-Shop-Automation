<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home Page</title>
    <link rel="stylesheet" href="css/Homepage.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: white;
        }
        .main {
            margin: 0 auto;
            width: 100%;
            height: auto;
        }
        .topbar1 {
            width: 100%;
            height: 4px;
            background-color: #fcc508;
        }
        .topbar2 {
            width: 100%;
            height: 30px;
            background-color: #2a2b2c;
        }
        .container1 {
            width: 1000px;
            height: 30px;
            background-color: transparent;
            margin: 0 auto;
        }
        .container2 {
            width: 1000px;
            height: 30px;
            background-color: transparent;
            margin: 0 auto;
        }
        .logout-btn {
            width: 150px;
            height: 30px;
            float: right;    
        }
        .logout-btn a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 4px;
        }
        .header {
            width: 100%;
            height: 40px;
            float: left;
            background-color: #0ca1a6;
            box-shadow: 0 0, 0 6px 20px 0 rgba(0, 0, 0, .14);
        }
        .navbar {
            width: 700px;
            float: left;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;    
        }
        .navbar a {
            display: inline-block;
            color: black;
            text-decoration: none;
            padding: 0 10px;
            font-weight: bold;
        }
        .navbar a:hover {
            color: white;
            background-color: black;
            padding: 0 10px;
        }
        .active {
            width: 1000px;
            min-height: 688px;
            background-color: white;
            margin: 0 auto;
            padding: 0px 20px 0px 20px;
        }
        .filler {
            width: 100%;
            height: 50px;
            background-color: transparent;
        }
        .filler2 {
            width: 100%;
            height: 30px;
            background-color: transparent;
        }
        h2 {
            text-align: center;
            padding: 20px 0 20px 0;
        }
        .card {
            width: 340px;
            height: auto;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            margin: 0 auto;
            text-align: center;
            padding: 4px 0 10px 0;
        }
        .card:hover {
            box-shadow: 0 8px 16px 2px rgba(0,0,0,0.2);
        }
        .space1 {
            font-size: 24px;    
        }
        .filler3 {
            width: auto;
            height: 10px;
        }
        .space {
            padding-top: 10px;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="topbar1"></div>
    <div class="topbar2">
        <div class="container1">
            <div class="logout-btn">
                <a href="Logout.jsp">Logout</a>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="container2">
            <div class="navbar">
                <a href="Homepage.jsp">HOME</a>
                <a href="Buy.jsp">BUY</a>
                <a href="Orders.jsp">ORDERS</a>
            </div>
        </div>
    </div>
</div>
<div class="active">
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%
    HttpSession httpSession = request.getSession();
    String guid = (String) httpSession.getAttribute("currentuser");
    %>
    
    <div class="filler"></div>
    <h2>Welcome <%= guid %></h2>
    
    <%
    ResultSet rs = null;
    PreparedStatement ps = null;
    java.sql.Connection conn = null;
    String query = "select fname, uid, address, phno, email from customer where uid = ?";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "Deepu@123");
        ps = conn.prepareStatement(query);
        ps.setString(1, guid);
        rs = ps.executeQuery();
        if (rs.next()) {
    %>
    <div class="filler2"></div>
    <div class="card">
        <img src="images/User.png" class="Avatar mx-auto d-block" width=234 height=234>
        <div class="container">
            <div class="space1"><b><%= rs.getString("fname") %></b></div>
            <div class="filler3"></div>
            <div class="space"><b>ID: </b><%= rs.getString("uid") %></div>
            <div class="space"><b>Address: </b><%= rs.getString("address") %></div>
            <div class="space"><b>Phone: </b><%= rs.getString("phno") %></div>
            <div class="space"><b>Email: </b><%= rs.getString("email") %></div>
        </div>
    </div>
    <%
        }
    } catch (Exception e) {
        out.println("error: " + e);
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {};
        try { if (ps != null) ps.close(); } catch (Exception e) {};
        try { if (conn != null) conn.close(); } catch (Exception e) {};
    }
    %>
</div>

<!-- Contact Us Section -->
<footer class="bg-dark text-white mt-5">
    <div class="container py-4">
        <div class="row">
            <div class="col-md-12">
                <h5>Contact Us</h5>
                <form action="contact-us.jsp" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
