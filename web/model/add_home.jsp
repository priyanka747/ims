
                                                                    		<%@page import="java.sql.*"%>
                        <%@page import="database_connection.data_conn.*" %>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Form Elements</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <form class="form-horizontal" action="controller/add_home_C.jsp" method="post">
						  <fieldset>
                                                      <%
                                                          if(request.getParameter("edit")!=null){
                                                              
                                                              try
                                                              {
                                                                   Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from home where id='"+request.getParameter("edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                                         
                                                                   
							<div class="control-group hidden-phone">
                                                            <input type="hidden" name="hid_edit" id="hid_edit" value="<%=request.getParameter("edit")%>"/>
							  <label class="control-label" for="textarea2">About Us</label>
							  <div class="controls">
                                                              <textarea class="cleditor" id="textarea2" rows="3" name="home" ><%=rs.getString("aboutus")%></textarea>
							  </div>
							</div>
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Submit</button>
							  <button type="reset" class="btn">Reset</button>
							</div>
                                                              <%}}
                                                                    catch(Exception e)
                                                                    {
                                                                              System.out.println(e);
                                                                    }
                                                                    }
                                                                    else
                                                                    {%>
							<div class="control-group hidden-phone">
							  <label class="control-label" for="textarea2">Textarea WYSIWYG</label>
							  <div class="controls">
								<textarea class="cleditor" id="textarea2" rows="3" name="home"></textarea>
							  </div>
							</div>
                                                        <%
                                                        
                                                        %>
                                                        <div class="control-group">
							 
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Save changes</button>
							  <button type="reset" class="btn">Cancel</button>
							</div>
                                                        
                                                                                
						  </fieldset>
						</form>   
<%}%>
					</div>
				</div><!--/span-->

			</div><!--/row-->