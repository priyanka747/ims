
 <%@page import="java.sql.*"%>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Contact Form </h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <form action="controller/add_invent_c.jsp">
<fieldset style="width: auto ">

<!-- Form Name -->
<legend>Inventory:</legend>
<%
                                                          if(request.getParameter("edit")!=null){
                                                              
                                                              try
                                                              {
                                                                   Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from contact where contactid='"+request.getParameter("edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                                 <div >
    <table align="center" cellpadding="15">
        <tr><td> <input type="hidden" name="hid_edit" value="<%=request.getParameter("edit")%>"></td></tr>
        <tr>
            
            <td>Contact Type:</td>
            <td><input type="text" name="ctype" value="<%=rs.getString("contacttype")%>"></td></tr>  
                
        <tr>
            <td>First name:</td>
            <td><input   type="text" placeholder=""  name="fnm"  value="<%=rs.getString("firstname")%>"></td>
        </tr>
        <tr>
            <td> Last name:</td>
            <td><input   type="text" placeholder=""  name="lnm" value="<%=rs.getString("lastname")%>"></td>
        </tr>
        <tr>
            <td>Company name:</td>
            <td><input   type="text" placeholder="" name="cnm" value="<%=rs.getString("companyid")%>"></td>
        </tr>
        <tr>
            <td>Email-id:</td>
            <td><input   type="text" placeholder="" name="eid" value="<%=rs.getString("email")%>"></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input   type="text" placeholder=""  name="phone" value="<%=rs.getString("phone")%>"></td>
        </tr>
        <tr>
            <td>Fax:</td>
            <td><input   type="text" placeholder=""  name="fax" value="<%=rs.getString("fax")%>"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input   type="text" placeholder=""  name="address" value="<%=rs.getString("address")%>"></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input   type="text" placeholder=""  name="city" value="<%=rs.getString("city")%>"></td>
        </tr>
        <tr>
            <td>Pincode:</td>
            <td><input   type="text" placeholder=""  name="pincode" value="<%=rs.getString("pincode")%>"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><textarea rows="5" cols="10" placeholder="enter description here:" name="desc" ><%=rs.getString("desc")%></textarea></td>
        </tr>
    </table>
<div align="center">
 <button class="btn btn-large btn-success">submit</button>
        
</div>
<!-- Form Name --><%}}
                                                                    catch(Exception e)
                                                                    {
                                                                              System.out.println(e);
                                                                    }
                                                                    }
                                                                    else
                                                                    {%>

<!-- Text input-->
<div >
    <table align="center" cellpadding="15">
        
        <tr>
            <td>purchase Date:</td>
            <td><input  type="date"   name="pd"></td>
        </tr>
        <tr>
            <td>Supplier:</td>
            <td><select name="cid" >
            <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from contact where contacttype='supplier' and status!='Inactive'";
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
            <td>item:</td>
            <td><select name="iid" >
            <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from item where status!='Inactive'";
                                                                     ResultSet  rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getString("itemid")%>"><%=rs.getString("itemname")%> </option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select></td>
        </tr>
        <tr >
            <td colspan="2">Cost</td>
        </tr>
        <tr>
            <td>quantity</td>
            <td><input type="number" name="qt" min="1" max="10000000"></td>
        </tr>
         <tr>
            <td>original</td>
            <td><input type="number" name="original" min="1" max="10000000"></td>
        </tr>
    </table>
      
    <br>
    <br>
    <br>
    <br>
<div align="center">
 <button class="btn btn-large btn-success">Add</button>
          
</div>
          <%}%>
</fieldset>
</form>
                                        
    </div>
                                </div>
     </div>
