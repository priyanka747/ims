<%@page import="java.sql.*" %>
<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Members</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
									  <th>saleid</th>
                                                                                                                                                                                 <th>saledate</th>
                                                                                                                                                                                 <th>contactid</th>
                                                                                                                                                                                 <th>itemid</th>
                                                                                                                                                                                 <th>categoryid</th>
                                                                                                                                                                                 <th>sellprice</th>
                                                                                                                                                                                 <th>qty</th>
                                                                                                                                                                                 <th>subtotal</th>
                                                                                                                                                                                 <th>tax</th>
                                                                                                                                                                                 <th>grandtotal</th>
                                                                                                                                                                                    
									  <th>status</th>
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
                                                                     String query="select * from sale where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                         
								<tr>
									 <td><%=rs.getInt("saleid") %></td>
                                                                                                                                                                                             <td><%=rs.getString("saledate") %></td>
                                                                                                                                                                                             <td><%=rs.getInt("contactid") %></td>                                                                                                                 
                                                                                                                                                                                             <td><%=rs.getInt("itemid") %></td>
                                                                                                                                                                                             <td><%=rs.getInt("categoryid") %> </td>
                                                                                                                                                                                             <td><%=rs.getString("sellprice") %></td>
                                                                                                                                                                                             <td><%=rs.getString("qty") %></td>
                                                                                                                                                                                             <td><%=rs.getString("subtotal") %> </td>
                                                                                                                                                                                             <td><%=rs.getString("tax") %> </td>
                                                                                                                                                                                             <td><%=rs.getString("grandtotal") %> </td>
									
									<td class="center">
										<span class="label label-success">Active</span>
									</td>          
                                                                                                                                                                                <td class="center">
									<a class="btn btn-success" href="index.jsp?mo=sales&edit=<%=rs.getInt("saleid")%>">
										<i class="halflings-icon white zoom-in"></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="halflings-icon white edit"></i>  
									</a>
                                                                                <a class="btn btn-danger" href="controller/add_sales.jsp?del=<%=rs.getInt("saleid")%>">
                                                                                    
                                                                               
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
    

	