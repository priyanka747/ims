
 <%@page import="java.sql.*"%>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Sales Form </h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <form action="controller/add_sales.jsp">
<fieldset style="width: auto ">

<!-- Form Name -->
<legend>Sales:</legend>


<!-- Text input-->
 <%
        if(request.getParameter("a")!=null)
    {%>
        <div class="box-content alerts">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>Oh snap!</strong> not enough inventory available.
						</div>
<%}%>
<div >
    <table align="center" cellpadding="15">
        <tr>                                                                                                                                                                
            <td>Sale Date:</td>
            <td><input  type="date"   name="sd"></td>
        </tr>
        <tr>
            <td>contactid</td>
            <td> <select name="contid"  >
           <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from contact where status!='Inactive'";
                                                                     ResultSet  rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getString("contactid")%>"><%=rs.getString("firstname")%>   <%=rs.getString("lastname")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select></td>
        </tr>
         <tr>
            <td> item</td>
            <td><select name="iid" >
           <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from stock where status!='Inactive'";
                                                                     ResultSet  rs=stm.executeQuery(query);
                                                                     
                                                                     while(rs.next())
                                                                     {
                                                                         
    %>
        
            <option value="<%=rs.getString("stockid")%>"><%=rs.getString("itemname")%> <%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select></td>
        </tr>
       
        <tr>
            <td>Sell Price:</td>
            <td><input   type="text" placeholder="" name="sp"></td>
        </tr>
       <%! int quant=0;%>
       
        <tr>
            <td>Quantity </td>
            <td><input type="number" name="qt" min="1" max="10000000"></td>
        </tr>
       
        <tr>
            <td>tax</td>
            <td><input   type="text" placeholder=""  name="tax"></td>
        </tr>
        
        
    </table>
      
    <br>
    <br>
    <br>
    <br>
<div align="center">
 <button class="btn btn-large btn-success">Add</button>
          
</div>

          
</fieldset>
</form>
                                        
    </div>
                                </div>
     </div>
