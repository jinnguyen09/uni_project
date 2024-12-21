<%-- 
    Document   : logout
    Created on : Dec 12, 2024, 1:38:36 AM
    Author     : Admins
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
            
            //chuyen huong sang trang chu 
            response.sendRedirect("home.jsp");
            %>
    </body>
</html>
