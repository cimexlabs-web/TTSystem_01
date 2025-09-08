<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="mainCss.css">
    <title>Players Management</title>
</head>
<body class="admin-page-body">
    <%
        if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role"))))
        {
            response.sendRedirect("login.html");
            return;
        }
        
        String dashboardPage = "NAdmin.jsp"; 
        if ("SAdmin".equals(session.getAttribute("role"))) {
            dashboardPage = "SAdmin.jsp";
        }
    %>
    
    <div class="admin-page-container">
        <div class="admin-page-header">
            <h1>Players Management</h1>
            <p>Manage player information and profiles</p>
        </div>
        
        <div class="admin-panel-button">
            <a href="add_player.jsp" class="admin-page-btn">
                <i class="fas fa-user-plus"></i>
                <span>Add New Player</span>
            </a>
            <a href="view_players.jsp" class="admin-page-btn">
                <i class="fas fa-users"></i>
                <span>View All Players</span>
            </a>
            <a href="edit_players.jsp" class="admin-page-btn">
                <i class="fas fa-edit"></i>
                <span>Edit Players</span>
            </a>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="<%= dashboardPage %>" class="admin-back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
</body>
</html>