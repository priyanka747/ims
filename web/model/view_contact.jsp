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
									  <th>Contact Id</th>
									  <th>Contact Name</th>
                                                                                                                                                                                 <th>Contact Type</th>
                                                                                                                                                                                 <th>company</th>
                                                                                                                                                                                 <th>phone</th>
                                                                                                                                                                                 <th>email </th>
                                                                                                                                                                                 <th>fax</th>
                                                                                                                                                                                 <th>address </th>
                                                                                                                                                                                 <th>city </th>
                                                                                                                                                                                 <th>pincode </th>
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
                                                                     String query="SELECT * FROM contact WHERE STATUS != 'Inactive'";
                                                                   
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                         
								<tr>
                                                                                                                                                                     <td><%=rs.getInt("contactid")%></td>
                                                                                                                                                                      <td><%=rs.getString("firstname")%> &nbsp; <%=rs.getString("lastname")%></td>
                                                                                                                                                                      <td><%=rs.getString("contacttype")%></td>
                                                                                                                                                                      <td><%=rs.getInt("companyid")%></td>
                                                                                                                                                                      <td><%=rs.getInt("phone")%> </td>
                                                                                                                                                                      <td><%=rs.getString("email")%></td>
                                                                                                                                                                      <td><%=rs.getInt("fax")%></td>
                                                                                                                                                                      <td><%=rs.getString("address")%></td>
                                                                                                                                                                      <td><%=rs.getString("city")%></td>
                                                                                                                                                                      <td><%=rs.getInt("pincode")%></td>
                                                                                                                                                                     <!-- <td><%=rs.getString("desc")%></td>-->
                                                                                                                                                                      <td class="center"><span class="label label-success">Active</span></td>          
                                                                                                                                                                      <td class="center">
									<a class="btn btn-success" href="index.jsp?mo=contact&edit=<%=rs.getInt("contactid")%>">
										<i class="halflings-icon white zoom-in"></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="halflings-icon white edit"></i>  
									</a>
                                                                                <a class="btn btn-danger" href="controller/add_contact_c.jsp?del=<%=rs.getInt("contactid")%>">
                                                                               
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
    

	