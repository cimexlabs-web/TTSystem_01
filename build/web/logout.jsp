<%-- 
    Document   : logout
    Created on : Sep 7, 2025, 10:23:11 PM
    Author     : Akila Perera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("login.html");
            %>
    </body>
</html>
