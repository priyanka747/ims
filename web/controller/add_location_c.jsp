<%-- 
    Document   : add_location_c.jsp
    Created on : May 15, 2017, 10:42:59 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
                    String query;
                    if(request.getParameter("del")!=null)
                    {
                       query = "update location set status='Inactive' where locationid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        out.println("<script>window.location.href='../index.jsp';</script>");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {
                             String cat=request.getParameter("cat");
                              try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from location where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                     String nm=rs.getString("locationname");
                                                                     if(nm.equalsIgnoreCase(cat))
                                                                     { r=1;
                                                                      break;
                                                                     }}
                                                                     
                                                                    if(r==1)
                                                                         { response.sendRedirect("../index.jsp?mo=location&a=1");
                                                                        
                                                                         
                                                                           }
                                                                            else
                                                                            {
                    query="update location set locationname='"+cat+"' where locationid='"+request.getParameter("hid_edit")+"';";
                      out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect(".../index.jsp?mo=view_location");
                                                                            }
                      }

                         catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}             
                      
                    }
                    else  {
                        String location=request.getParameter("cat");
                        
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from location where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                     String nm=rs.getString("locationname");
                                                                     if(nm.equalsIgnoreCase(location))
                                                                     { r=1;
                                                                      break;
                                                                     }}
                                                                     
                                                                    if(r==1)
                                                                         { response.sendRedirect("../index.jsp?mo=location&a=1");
                                                                        
                                                                         
                                                                           }
                                                                            else
                                                                            {
                                                                            query="insert into location values(null,'"+location+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                   out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?mo=location");}
                            
                   }

                         catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}             
              
                    }
                                }
        catch(Exception e)
        {
            System.out.println(e);
        }
       
        %>
    </body>
</html>
