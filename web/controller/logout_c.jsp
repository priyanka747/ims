<%-- 
    Document   : logout_c
    Created on : May 19, 2017, 10:38:58 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           session.removeAttribute("username");
            session.removeAttribute("uid");
            
            
            request.getSession().invalidate();
            //out.print(session.getAttribute("uid"));
            response.sendRedirect("../login.jsp");
         %>
    </body>
</html>
