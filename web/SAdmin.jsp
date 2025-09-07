<%-- 
    Document   : SAdmin
    Created on : Sep 7, 2025, 8:49:07 PM
    Author     : Akila Perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
    </head>
    <body>
        <%
            if (session == null || !"SAdmin".equals(session.getAttribute("role")))
            {
                response.sendRedirect("login.html");
                return;
            }
        %>
        
        <h1>Super Admin</h1>
    </body>
</html>
