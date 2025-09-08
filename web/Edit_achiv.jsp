<%-- 
    Document   : Edit_achiv
    Created on : Sep 8, 2025, 2:55:10 PM
    Author     : Akila Perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit achievement section</title>
    </head>
    <body>
        <%
        if (session == null || !("SAdmin".equals(session.getAttribute("role")) || "NAdmin".equals(session.getAttribute("role"))))
        {
            response.sendRedirect("login.html");
            return;
        }
    %>
    </body>
</html>
