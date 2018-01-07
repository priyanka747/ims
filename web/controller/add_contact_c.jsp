<%-- 
    Document   : add_contact_c.jsp
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
                   String ctype=request.getParameter("ctype");  
                    String fnm=request.getParameter("fnm"); 
                     String lnm=request.getParameter("lnm"); 
                     String cnm=request.getParameter("cnm"); 
                      String fax=request.getParameter("fax"); 
                       String phone=request.getParameter("phone"); 
                        String email=request.getParameter("eid");
                        String city=request.getParameter("city");                
                         String address=request.getParameter("address"); 
                          String desc=request.getParameter("desc");
                           String pincode=request.getParameter("pincode"); 
                         
                           
                     
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
                    String query;
                    if(request.getParameter("del")!=null)
                    {
                       query = "update contact set status='Inactive' where contactid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        response.sendRedirect(".../index.jsp?mo=vc");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {
                             String cat=request.getParameter("cat");
                              try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     
                    query="update contact set firstname='"+fnm+"',lastname='"+lnm+"',companyid='1',phone='"+phone+"',email='"+email+"',fax='"+fax+"',address='"+address+"',city='"+city+"',pincode='"+pincode+"',`desc`='"+desc+"',contacttype='"+ctype+"' where contactid='"+request.getParameter("hid_edit")+"';";
                    
                      out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect(".../index.jsp?mo=vc");
                                                                            
                      }

                         catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}             
                      
                    }
                    else  {
                        String fn=request.getParameter("fnm");
                        String ln=request.getParameter("lnm");
                        
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from contact where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                     String fm=rs.getString("firstname");
                                                                     String lm=rs.getString("lastname");
                                                                     if(fm.equalsIgnoreCase(fn) && lm.equalsIgnoreCase(ln))
                                                                     { r=1;
                                                                      break;
                                                                     }}
                                                                     
                                                                    if(r==1)
                                                                         { response.sendRedirect("../index.jsp?mo=contact&a=1");
                                                                        
                                                                         
                                                                           }
                                                                            else
                                                                            {
                                                                               query="insert into contact values(null,'"+fnm+"','"+lnm+"','1','"+phone+"','"+email+"','"+fax+"','"+address+"','"+city+"','"+pincode+"','"+desc+"','"+ctype+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                   out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?mo=contact");}
                            
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
