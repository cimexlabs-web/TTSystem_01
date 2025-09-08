<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="mainCss.css">
    <title>Edit Web page</title>
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
            <h1>Edit Website Content</h1>
            <p>Select section to edit</p>
        </div>
        
        <div class="admin-panel-button">
            <a href="Edit_about.jsp" class="admin-page-btn">
                <i class="fas fa-info-circle"></i>
                <span>About Us</span>
            </a>
            <a href="Edit_vision.jsp" class="admin-page-btn">
                <i class="fas fa-eye"></i>
                <span>Vision</span>
            </a>
            <a href="Edit_achiv.jsp" class="admin-page-btn">
                <i class="fas fa-trophy"></i>
                <span>Achievements</span>
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