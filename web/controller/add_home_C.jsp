<%-- 
    Document   : add_home_C.jsp
    Created on : May 15, 2017, 10:42:59 AM
    Author     : HP
--%>

<%@page import="database_connection.data_conn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database_connection.data_conn.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try
            {
                  String home=request.getParameter("home");
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
               
                    if(request.getParameter("del")!=null)
                    {
                        String query = "update home set status='Inactive' where id='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        out.println("<script>window.location.href='../index.jsp?add_home';</script>");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {
                             String aboutus=request.getParameter("home");
                             
                    String query="update home set aboutus='"+aboutus+"' where id='"+request.getParameter("hid_edit")+"';";
                      out.println(query);
                      
                      s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?add_home");
                    }
                    else{
                        String aboutus=request.getParameter("home");
                        out.println(aboutus);
                    String query="insert into home values(null,'"+aboutus+"','Active')";
                    out.println(query);
                    s1.executeUpdate(query);
                    
                    response.sendRedirect("../index.jsp?mo=add_home");
                    out.println(query);
                    }
                                }
        catch(Exception e)
        {
            System.out.println(e);
        }
       
        %>
    </body>
</html>
