
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit About</title>
    </head>
    <body>
        <%
        if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role"))))
        {
            response.sendRedirect("login.html");
            return;
        }
    %>
    
    <div class="edit-about">
        <div class="edit-header">
            <h1>Edit about us section</h1>
            
        </div>
        
        <div class="edit-about-containt">
            
        </div>
    </div>
    </body>
</html>
