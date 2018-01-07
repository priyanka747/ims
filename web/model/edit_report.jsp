     <%@page import="java.sql.*"%>
     <html>
     <head>
     <jsp:include page="../include/head.jsp"/>
     </head>
     <body>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Reports</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                           
          
<fieldset style="width: auto ">

<!-- Form Name -->
<legend>Report</legend>

<!-- Text input-->
	<center><div ><br>
            
                <form action="controller/view_report_c.jsp?rep=csummarry" method="post">
                
            <button class="btn btn-small btn-warning">Category Summary </button>
             </form>
                
                
    
             <form action="controller/view_report_c.jsp?rep=lsummary" method="post"> 
                 <button class="btn btn-small btn-warning" name="lsummary">Location Summary </button>
                    </form>
                
                
        <hr><br>
        </div>
                      </center>                    
        
		<table border="0" align="center" cellspacing="0" cellpadding="35">
		<tr>
        <td><form action="controller/view_report_c.jsp?rep=category" method="post"><fieldset style="   width: fit-content ">
        <legend>Category Wise Report</legend>
      <div >
         category:
          <select  name="cate" >
              <option>none</option>
		  <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from category where status!='Inactive'";
                                                                     out.print(query);
                                                                      ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getString("category_id")%>" ><%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
		  </select>
          <div > <br>
          <a href="controller/view_report_c.jsp?report=category"><button class="btn btn-large btn-success" name="category">View Report</button></a>
        </div>
                 
                  
            </fieldset>  </form></td>
            
           
           
   		<td>  <form action="controller/view_report_c.jsp?rep=item" method="post"> <fieldset style="   width: fit-content ">
        <legend>Item Wise Report</legend>
        <div >
         Item:
          <select  name="item" >
              <option>none</option>
		  <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from item where status!='Inactive'";
                                                                     out.print(query);
                                                                      ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getInt("itemid")%>"><%=rs.getString("itemname")%>-<%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
		  </select>
          <div > <br>
          <a href="controller/view_report_c.jsp?rep=item"><button class="btn btn-large btn-success" name="item">View Report</button></a>
        </div>
            </fieldset></form></td>
            
            <td><form action="controller/view_report_c.jsp?rep=location" method="post"><fieldset style=" width: fit-content">
        <legend>Location Wise Report</legend>
        <div >
         location:
          <select  name="loc" >
              <option>none</option>
		  <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from location where status!='Inactive'";
                                                                     out.print(query);
                                                                      ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getString("locationid")%>"><%=rs.getString("locationname")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
		  </select>
          <div > <br>
          <a href="controller/view_report_c.jsp?rep=location"> <button class="btn btn-large btn-success" name="location">View Report</button></a>
        </div>
		
    </fieldset></form></td>
	</tr></table>
                  
	<br>
	<br>
        
	<div>
        
                
	
	</div>

</fieldset>

                                        </div>
                                </div>
     
</body>
</html>

<!--<fieldset>
	<legend>Date Wise Report</legend>
	<table align="left" border="0" cellspacing="0" >
            <tr ><div> <form action="controller/view_report_c.jsp?pdate" method="post">
		<td>Items Purchased on date   : </td>
		<td><div class="control-group">
							  <label class="control-label" for="date01">Date input</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							  </div></td>
                                                          <td><button class="btn btn-small btn-warning" name="purchasedate" >View Report</button><br></td>
                </form></div>
	</tr>
      
                 
                     <tr>
                     <div>
                         <form action="controller/view_report_c.jsp" >
		<td>Items Purchased In Dates    :</td>
		<td><div class="control-group">
							  <label class="control-label" for="date01">Date input</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							  </div></td>
                                                          <td>  <button class="btn btn-small btn-warning" name="purchaserange">View Report</button><br></td>
                         </form>
          </div>
	</tr>
                 
                 <form action="controller/view_report_c.jsp" >
	<tr>
		<td>Items Sold on date    :</td>
		<td> <div class="control-group">
							  <label class="control-label" for="date01">Date input</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							  </div></td>
		<td>  <button class="btn btn-small btn-warning" name="salesdate">View Report</button><br></td>
	</tr>
                 </form>
                
                     <tr><div> <form action="controller/view_report_c.jsp" > 
		<td>Items Sold In Dates   :  </td>
		<td> <div class="control-group">
							  <label class="control-label" for="date01">Date input</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							div>to<div class="control-group">
							  <label class="control-label" for="date01">Date input</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" >
							  </div>
                                       </td>
		<td><button class="btn btn-small btn-warning" name="salserange">View Report</button><br>
	</td>    </form></div>
	</tr>
    
	</table>
	
	
	
	
	
	</fieldset>-->