<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="mainCss.css">
    <title>Website Messages</title>
</head>
<body class="admin-page-body">
    <%
        if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role"))))
        {
            response.sendRedirect("login.html");
            return;
        }
    %>
    
    <div class="admin-page-container">
        <div class="admin-page-header">
            <h1>Website Messages</h1>
            <p>Manage messages from website visitors</p>
        </div>
        
        <div class="admin-panel-button">
            <a href="view_messages.jsp" class="admin-page-btn">
                <i class="fas fa-envelope"></i>
                <span>View Messages</span>
            </a>
            <a href="reply_messages.jsp" class="admin-page-btn">
                <i class="fas fa-reply"></i>
                <span>Reply to Messages</span>
            </a>
            <a href="message_settings.jsp" class="admin-page-btn">
                <i class="fas fa-cog"></i>
                <span>Message Settings</span>
            </a>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="NAdmin.jsp" class="admin-back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
</body>
</html>