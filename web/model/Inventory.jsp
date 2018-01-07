<%@page import="java.sql.*" %>
 <%! double tot=0;%>
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
                                                                                                                                                                                 <th>stockid</th>
                                                                                                                                                                                 <th>itemid</th>
                                                                                                                                                                                 <th>categoryid</th>
                                                                                                                                                                                 <th>locationid</th>
                                                                                                                                                                                 <th>itemname</th>
                                                                                                                                                                                 <th>qty</th>
                                                                                                                                                                                 <th>unitprice</th>
                                                                                                                                                                                 <th>size</th>
                                                                                                                                                                                 <th>capacity</th>
                                                                                                                                                                                 <th>weight</th>
                                                                                                                                                                                 <th>total</th>
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
                                                                     String query="select * from stock where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
                                                                         tot=rs.getInt("qty")*rs.getDouble("unitprice");
                                                              %>
                                                         
								<tr>
                                                                                                                                                                                 <td><%=rs.getInt("stockid")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("itemid")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("categoryid")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("locationid")%></td>
                                                                                                                                                                                 <td><%=rs.getString("itemname")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("qty")%></td>
                                                                                                                                                                                 <td><%=rs.getDouble("unitprice")%></td>
                                                                                                                                                                                 <td><%=rs.getString("size")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("capacity")%></td>
                                                                                                                                                                                 <td><%=rs.getInt("weight")%></td>
                                                                                                                                                                      
                                                                                                                                                                   
                                                                                                                                                                      <td><%=tot%> Rs/-</td>
									<td class="center">
										<span class="label label-success">Active</span>
									</td>          
                                                                                                                                                                                <td class="center">
									<a class="btn btn-success" href="index.jsp?mo=view_inventory&edit=<%=rs.getInt("stockid")%>">
										<i class="halflings-icon white zoom-in"></i>  
									</a>
									<a class="btn btn-info" href="#">
										<i class="halflings-icon white edit"></i>  
									</a>
                                                                                <a class="btn btn-danger" href="controller/add_item_c.jsp?del=<%=rs.getInt("itemid")%>">
                                                                               
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
    

	