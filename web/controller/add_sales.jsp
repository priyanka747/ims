<%-- 
    Document   : add_sales
    Created on : Jun 27, 2017, 4:58:43 PM
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
                       query = "delete from sale  where saleid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        response.sendRedirect("../index.jsp?mo=view_sales");
                    }
                    else if((request.getParameter("hid_edit")!=null))
                    {
                        
                        String sd=request.getParameter("sd");
                     String contid=request.getParameter("contid");
                    String iid=request.getParameter("iid"); 
                    double sp=Double.parseDouble(request.getParameter("sp"));
                    double qt=Double.parseDouble(request.getParameter("qt"));
                    double tax=Double.parseDouble(request.getParameter("tax"));
                    double stot;double total;
                    String cateid="";
                         int cqt=0;
                           //  String cat=request.getParameter("cat");
                              try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from sale where status !='Inactive'and saleid='"+request.getParameter("hid_edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                         cqt=rs.getInt("qty");
                                                                        cateid=rs.getString("categoryid");
                                                                     }
                                                                     stot=sp*qt;
                                                                                double tac=stot * (tax/100);
                                                                                total=stot+tac;
                                                                     
                    query="update sale set saledate='"+sd+"', contactid='"+contid+"',itemid='"+iid+"',categiryid='"+cateid+"',sp='"+sp+"',qty='"+qt+"',subtotal='"+stot+"',tax='"+tax+"',grandtotal='"+total+"' where saleid='"+request.getParameter("hid_edit")+"';";
                      out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect(".../index.jsp?mo=view_sales");
                                                                            }
                      catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}             

                         
                      
                    }
                    else  {
                     String sd=request.getParameter("sd");
                     String contid=request.getParameter("contid");
                    String iid=request.getParameter("iid"); 
                    String cateid="";
                    double sp=Double.parseDouble(request.getParameter("sp"));
                    double qt=Double.parseDouble(request.getParameter("qt"));
                    double tax=Double.parseDouble(request.getParameter("tax"));
                    double stot;double total;
                         int cqt=0;
                    
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from sale where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     int r=0;
                                                                     while(rs.next())
                                                                     {
                                                                     /*String nm=rs.getString("locationname");
                                                                     if(nm.equalsIgnoreCase(location))
                                                                     { r=1;
                                                                      break;
                                                                     }*/}stot=sp*qt;
                                                                                double tac=stot * (tax/100);
                                                                                total=stot+tac;
                                                                     
                                                                   
                                                                            query="insert into sale values(null,'"+sd+"','"+contid+"','"+iid+"','"+cateid+"','"+sp+"','"+qt+"','"+stot+"','"+tax+"','"+total+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                   out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?mo=location");}
                            
                   

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
<%
       
             
            /*       String sd=request.getParameter("sd");  
                   
                    String contid=request.getParameter("contid"); 
                    out.println(contid);
                   
                     String iid=request.getParameter("iid"); 
              
                      double sp=Double.parseDouble(request.getParameter("sp"));
                   
                       double qt=Double.parseDouble(request.getParameter("qt")); 
                 
                        double tax=Double.parseDouble(request.getParameter("tax"));
                   
                       double stot;double total;
                         int cqt=0;
                      
    
    
                     try
            {
                    data_conn c=new data_conn();
                    Connection c1=c.conn_data();
                    Statement s1=c1.createStatement();           
                    String query;
                    if(request.getParameter("del")!=null)
                    {
                       query = "update sale set status='Inactive' where saleid='"+request.getParameter("del")+"'";
                          out.println(query);
                          s1.executeUpdate(query);
                        response.sendRedirect(".../index.jsp?mo=view_sales");
                    }
                    else{
                        
                    try
             {
                 
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from stock where status!='Inactive' and stockid='"+request.getParameter("iid")+"'";
                                                                     ResultSet  rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     { 
                                                                        cqt=rs.getInt("qty");
                                                                        cateid=rs.getString("categoryid");
                                                                     }
             }catch(Exception e)
            {
               out.println(e);
            }
                  try
                  {
                                                                               
                         if(qt>cqt)
                     {
                         response.sendRedirect("../index.jsp?mo=sales&a=1");
                      
                     }
                                                                                stot=sp*qt;
                                                                                double tac=stot * (tax/100);
                                                                                total=stot+tac;
                                                                              query="insert into sale values(null,'"+sd+"','"+contid+"','"+iid+"','"+cateid+"','"+sp+"','"+qt+"','"+stot+"','"+tax+"','"+total+"','"+session.getAttribute("uid")+"',now(),'"+session.getAttribute("uid")+"',now(),'Active')";
                   out.println(query);
                    s1.executeUpdate(query);
                    response.sendRedirect("../index.jsp?mo=sales");
                            
                   }

                         catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}              }
            }
        catch(Exception e)
        {
            System.out.println(e);
        }*/
              
                   
       
        %>*/
  <!--if(request.getParameter("del")!=null)
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
                                                                     
                    query="update contact set firstname='"+contid+"',lastname='"+iid+"',companyid='1',qt='"+qt+"',tax='"+tax+"',sp='"+sp+"',address='"+address+"',city='"+city+"',pincode='"+pincode+"',`desc`='"+desc+"',contacttype='"+ctype+"' where contactid='"+request.getParameter("hid_edit")+"';";
                    
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
                        String fn=request.getParameter("contid");
                        String ln=request.getParameter("iid");
                        
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                      query="select * from sale where status !='Inactive'";
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
 }
                               -->