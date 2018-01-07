<!DOCTYPE html>
<html lang="en">
<head>
	
    <jsp:include page="include/head.jsp"/>
		
</head>

<body>
    <%@page import="java.sql.*"%>
<%! int cat=0;%>
<%! int sales=0;%>
<%! int orders=0;%>
<%! int purchase=0;%>

<%
        try
        {
            
		Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select count(*) As count from category where status!='Inactive';";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                      while(rs.next())
                                                                      {
                                                                          cat=rs.getInt("count");
                                                                      }
                                                                      query="select count(*) As count from sale where status!='Inactive';";
                                                                      rs=stm.executeQuery(query);
                                                                      while(rs.next())
                                                                      {
                                                                          sales=rs.getInt("count");
                                                                      }
                                                                       query="select count(*) As count from orders where status!='Inactive';";
                                                                      rs=stm.executeQuery(query);
                                                                      while(rs.next())
                                                                      {
                                                                          orders=rs.getInt("count");
                                                                      }
                                                                      query="select count(*) As count from purchase where status!='Inactive';";
                                                                      rs=stm.executeQuery(query);
                                                                      while(rs.next())
                                                                      {
                                                                          purchase=rs.getInt("count");
                                                                      }
                                                                      
        }
        catch(Exception e)
        {
            
            out.println(e);
        }
%>
    <%
          
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setDateHeader("Expires",0);
        response.setHeader("Pragma","no-cache");
            
        
            String valid=(String)session.getAttribute("username");
            if(valid==null||valid.equals(""))
            {
                response.sendRedirect("login.jsp");
            }
    %>
		<!-- start: Header -->
                <jsp:include page="include/header.jsp"/>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			 <jsp:include page="include/sidebar.jsp"/>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
                       
                    
			<div id="content" class="span10">
			<%
                                                    if(request.getParameter("mo")!=null)
                                                    {
                                                        String mo=request.getParameter("mo");
                                                        if(mo.equals("add_home"))
                                                        {%>
                                                        <jsp:include page="model/add_home.jsp"/>
                                                        <%}
                                                        else if(mo.equals("view_home"))
                                                         {%>
                                                                <jsp:include page="model/view_home.jsp"/>
                                                        <% }
                                                        else if(mo.equals("category"))
                                                         {%>
                                                         <jsp:include page="model/edit_category.jsp"/>
                                                        <% }else if(mo.equals("item"))
                                                         {%>
                                                         <jsp:include page="model/edit_Item.jsp"/>
                                                        <% }
                                                        else if(mo.equals("location"))
                                                         {%>
                                                         <jsp:include page="model/edit_Location.jsp"/>
                                                        <% }
                                                        else if(mo.equals("report"))
                                                         {%>
                                                         <jsp:include page="model/edit_report.jsp"/>
                                                        <% }
                                                        else if(mo.equals("contact"))
                                                         {%>
                                                         <jsp:include page="model/edit_Contact.jsp"/>
                                                        <% }
                                                        else if(mo.equals("view_category"))
                                                         {%>
                                                         <jsp:include page="model/view_category.jsp"/>
                                                        <% }
                                                        else if(mo.equals("view_item"))
                                                         {%>
                                                         <jsp:include page="model/view_Item.jsp"/>
                                                        <% }
                                                        else if(mo.equals("view_location"))
                                                         {%>
                                                         <jsp:include page="model/view_location.jsp"/>
                                                        <% }
                                                         else if(mo.equals("vc"))
                                                         {%>
                                                         <jsp:include page="model/view_contact.jsp"/>
                                                        <% }
                                                        else if(mo.equals("pro"))
                                                         {%>
                                                         <jsp:include page="model/profile.jsp"/>
                                                        <% }
                                                        else if(mo.equals("view_inventory"))
                                                         {%>
                                                         <jsp:include page="model/Inventory.jsp"/>
                                                        <% }
                                                        else if(mo.equals("view_sales"))
                                                         {%>
                                                         <jsp:include page="model/view_sales.jsp"/>
                                                        <% }
                                                          else if(mo.equals("sales"))
                                                         {%>
                                                         <jsp:include page="model/edit_sales.jsp"/>
                                                        <% }
                                                            else if(mo.equals("inventory"))
                                                         {%>
                                                         <jsp:include page="model/edit_inventory.jsp"/>
                                                        <% }
                                                        else if(mo.equals("company"))
                                                         {%>
                                                         <jsp:include page="model/edit_company.jsp"/>
                                                        <% }
                                                        else if(mo.equals("vcomp"))
                                                         {%>
                                                         <jsp:include page="model/view_company.jsp"/>
                                                        <% }
                                                    }
                                                    else{
                        %>
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.jsp">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="index.jsp">Dashboard</a></li>
			</ul>
                        <h2> Dashboard</h2><br>
                        <hr>
                        <div> <p > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%    try
                                                                   {
                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from home where status !='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                         
								
									<%=rs.getString("aboutus")%>
                                                                                                                                                                           
                                                                                                                                                                             <%}}
                                                                                                                                                                                catch(Exception e){}
                                                                                                                                                                             %></p><br><br><br><br><br><br><hr width="70%"> </div>
			<div class="row-fluid">
				
				<div class="span3 statbox blue"><!--onTablet="span6",onDesktop="span3"-->
					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div>
					<div class="number"><%=cat%><i class="icon-arrow-up"></i></div>
					<div class="title">categories</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>	
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart">1,2,6,4,0,8,2,4,5,3,1,7,5</div>
					<div class="number"><%=purchase%><i class="icon-arrow-up"></i></div>
					<div class="title">purchase</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart">5,6,7,2,0,-4,-2,4,8,2,3,3,2</div>
					<div class="number"><%=sales%><i class="icon-arrow-up"></i></div>
					<div class="title">sales</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<!--<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart">7,2,2,2,1,-4,-2,4,8,,0,3,3,5</div>
					<div class="number"><%=orders%><i class="icon-arrow-down"></i></div>
					<div class="title">orders</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>	-->
				
			</div>		

			<!--<div class="row-fluid">
				
				<div class="span8 widget blue" onTablet="span7" onDesktop="span8">
					
					<div id="stats-chart2"  style="height:282px" ></div>
					
				</div>
				
				<div class="sparkLineStats span4 widget green" onTablet="span5" onDesktop="span4">

                    <ul class="unstyled">
                        
                        <li><span class="sparkLineStats3"></span> 
                            Pageviews: 
                            <span class="number">781</span>
                        </li>
                        <li><span class="sparkLineStats4"></span>
                            Pages / Visit: 
                            <span class="number">2,19</span>
                        </li>
                        <li><span class="sparkLineStats5"></span>
                            Avg. Visit Duration: 
                            <span class="number">00:02:58</span>
                        </li>
                        <li><span class="sparkLineStats6"></span>
                            Bounce Rate: <span class="number">59,83%</span>
                        </li>
                        <li><span class="sparkLineStats7"></span>
                            % New Visits: 
                            <span class="number">70,79%</span>
                        </li>
                        <li><span class="sparkLineStats8"></span>
                            % Returning Visitor: 
                            <span class="number">29,21%</span>
                        </li>

                    </ul>
					
					<div class="clearfix"></div>

                </div>--><!-- End .sparkStats -->

			</div>
			
						
			
			
			
       

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2013 <a href="#">Inventory Manegment System  Responsive Dashboard</a></span>
			
		</p>

        </footer>
	<%}%>
	<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js/jquery.ui.touch-punch.js"></script>
	
		<script src="js/modernizr.js"></script>
	
		<script src="js/bootstrap.min.js"></script>
	
		<script src="js/jquery.cookie.js"></script>
	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	
		<script src="js/jquery.chosen.min.js"></script>
	
		<script src="js/jquery.uniform.min.js"></script>
		
		<script src="js/jquery.cleditor.min.js"></script>
	
		<script src="js/jquery.noty.js"></script>
	
		<script src="js/jquery.elfinder.min.js"></script>
	
		<script src="js/jquery.raty.min.js"></script>
	
		<script src="js/jquery.iphone.toggle.js"></script>
	
		<script src="js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js/jquery.gritter.min.js"></script>
	
		<script src="js/jquery.imagesloaded.js"></script>
	
		<script src="js/jquery.masonry.min.js"></script>
	
		<script src="js/jquery.knob.modified.js"></script>
	
		<script src="js/jquery.sparkline.min.js"></script>
	
		<script src="js/counter.js"></script>
	
		<script src="js/retina.js"></script>

		<script src="js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
