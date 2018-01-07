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
                   String cnm=request.getParameter("cnm");  
                    String pnm=request.getParameter("pnm"); 
                     String iec=request.getParameter("iec"); 
                     String gst=request.getParameter("gst"); 
                      String fax=request.getParameter("fax"); 
                       String phone=request.getParameter("phone"); 
                        String email=request.getParameter("eid");
                        String city=request.getParameter("city");                
                         String address=request.getParameter("address"); 
                          String desc=request.getParameter("desc"); 
                         
                           
                     
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
                    String query;
                    if(request.getParameter("del")!=null)
                    {
                       query = "update company set status='Inactive' where companyid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        response.sendRedirect(".../index.jsp?mo=vcomp");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {
                             String cat=request.getParameter("cat");
                              try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     
                    query="update company set companyname='"+cnm+"',proprietor='"+pnm+"',gstno='"+gst+"',iec='"+iec+"',phone='"+phone+"',emailid='"+email+"',fax='"+fax+"',address='"+address+"',city='"+city+"',description='"+desc+"',modifiedby='"+session.getAttribute("uid")+"' ,modifieddate = now() where companyid='"+request.getParameter("hid_edit")+"';";
                       
                      out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect(".../index.jsp?mo=vcomp");
                                                                            
                      }

                         catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}             
                      
                    }
                    else  {
                        String fn=request.getParameter("cnm");
                        
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from company where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                     String fm=rs.getString("companyname");
                                                                     if(fm.equalsIgnoreCase(fn) )
                                                                     { r=1;
                                                                      break;
                                                                     }}
                                                                     
                                                                    if(r==1)
                                                                         { response.sendRedirect("../index.jsp?mo=company&a=1");
                                                                        
                                                                         
                                                                           }
                                                                            else
                                                                            {
                                                                               query="insert into company values(null,'"+cnm+"','"+pnm+"','"+iec+"','"+gst+"','"+email+"','"+phone+"','"+fax+"','"+address+"','"+city+"','"+desc+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                   out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?mo=company");
                                                                            }
                   
                            
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
