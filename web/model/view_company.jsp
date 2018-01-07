<%-- 
    Document   : view_company
    Created on : Jun 26, 2017, 8:18:08 PM
    Author     : HP
--%>






<%@page import="java.sql.*" %>
<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Companies</h2>
						
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
                                                                                                                                                                                             <th width="3" >Company id </th>
                                                                                                                                                                                             <th>Company name </th>
                                                                                                                                                                                              <th>proprietor </th>
                                                                                                                                                                                              <th>iec </th>
                                                                                                                                                                                             <th>gstno </th>
                                                                                                                                                                                             <th>email id </th>                                                                                                                       
                                                                                                                                                                                             <th>phone </th>
                                                                                                                                                                                             <th>fax </th>
                                                                                                                                                                                             <th>address </th>
                                                                                                                                                                                             <th>city</th>
                                                                                                                                                                                             <th>description </th>
                                                                                                                                                                                <th>action</th>                                          
								  </tr>
							  </thead>   
							  <tbody>
                                                              <%
                                                                   try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from company where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                         
								<tr>
                                                                                                                                                                                            <td><%=rs.getInt("companyid") %></td>
                                                                                                                                                                                            <td><%=rs.getString("companyname")%></td>
                                                                                                                                                                                             <td><%=rs.getString("proprietor") %></td>
                                                                                                                                                                                             <td><%=rs.getInt("iec") %></td>
                                                                                                                                                                                             <td><%=rs.getString("gstno") %></td>
                                                                                                                                                                                             <td><%=rs.getString("emailid") %></td>                                                                                                                       
                                                                                                                                                                                             <td><%=rs.getInt("phone") %></td>
                                                                                                                                                                                             <td><%=rs.getInt("fax") %> </td>
                                                                                                                                                                                             <td><%=rs.getString("address") %></td>
                                                                                                                                                                                             <td><%=rs.getString("city") %></td>
                                                                                                                                                                                             <td><%=rs.getString("description") %> </td>
									
									          
                                                                                                                                                                                <td class="center">
									<a class="btn btn-success" href="index.jsp?mo=company&edit=<%=rs.getInt("companyid")%>">
										<i class="halflings-icon white zoom-in"></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="halflings-icon white edit"></i>  
									</a>
                                                                                <a class="btn btn-danger" href="controller/add_company_c.jsp?del=<%=rs.getInt("companyid")%>">
                                                                               
										<i class="halflings-icon white trash"></i> 
									</a>
								</td>
								</tr>
								     <%}}
                                                                                                                                                                    catch(Exception e)
{                                                                                                                                                                   
        out.println(e);
}%>                    
							  </tbody>
						 </table>  
						
					</div>
				</div><!--/span-->
			</div><!--/row-->
    

	
