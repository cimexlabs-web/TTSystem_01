<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="css/NAdmin.css">
        <title>Admin Panel</title>
    </head>
    <body class="admin-body">
        <%
            if (session == null || !"NAdmin".equals(session.getAttribute("role")))
            {
                response.sendRedirect("login.html");
                return;
            }
        %>
        
        <div class="admin-container">
            <div class="admin-header">
                <h1>Admin Dashboard</h1>
                <p>Welcome, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Admin" %></p>
            </div>
            
            <div class="panel-button">
                <a href="edit.jsp" class="a-btn">
                    <i class="fas fa-edit"></i>
                    <span>Edit Web page</span>
                </a>
                <a href="players_info.jsp" class="a-btn">
                    <i class="fas fa-users"></i>
                    <span>Players</span>
                </a>
                <a href="message.jsp" class="a-btn">
                    <i class="fas fa-envelope"></i>
                    <span>Web messages</span>
                </a>
                <a href="logout.jsp" class="a-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>
    </body>
</html>