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
                String item=request.getParameter("item");
                             String category=request.getParameter("category");
                
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
               
                    if(request.getParameter("del")!=null)
                    {
                        String query = "update item set status='Inactive' where itemid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        response.sendRedirect("../index.jsp?mo=view_item");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {        
                    String query="update item set itemname='"+item+"', category_nm='"+category+"' where id='"+request.getParameter("hid_edit")+"';";
                      out.println(query);
                      s1.executeUpdate(query);
                     response.sendRedirect("../index.jsp?mo=view_item");
                    }
                    else{  
                    String query="insert into item values(null,'"+item+"','"+category+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                    out.println(query);
                    s1.executeUpdate(query);
                     response.sendRedirect("../index.jsp?mo=item");
                   // out.println(query);
                    }
                                }
        catch(Exception e)
        {
            System.out.println(e);
        }
       
        %>
    </body>
</html>
