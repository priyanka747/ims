
 <%@page import="java.sql.*"%>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Company Form </h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <form action="controller/add_company_c.jsp" method="post">
<fieldset style="width: auto ">

<!-- Form Name -->
<legend>Company:</legend>
<%
                                                          if(request.getParameter("edit")!=null){
                                                              
                                                              try
                                                              {
                                                                   Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from company where companyid='"+request.getParameter("edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                                 <div >
    <table align="center" cellpadding="15">
        <tr><td> <input type="hidden" name="hid_edit" value="<%=request.getParameter("edit")%>"></td></tr>
         <tr>
            <td>Company name:</td>
            <td><input   type="text"   name="cnm" value="<%=rs.getString("companyname")%>"></td>
        </tr>
        <tr>
            <td>proprietor :</td>
            <td><input   type="text"  name="pnm" value="<%=rs.getString("proprietor") %>" ></td>
        </tr>
        <tr>
            <td> Iec:</td>
            <td><input   type="text"  name="iec" value="<%=rs.getInt("iec") %>"></td>
        </tr>
        <tr>
            <td>gst no:</td>
            <td><input   type="text"  name="gst" value="<%=rs.getString("gstno") %>"></td>
        </tr>
        <tr>
            <td>Email-id:</td>
            <td><input   type="text"  name="eid" value="<%=rs.getString("emailid") %>"></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input   type="text"  name="phone" value="<%=rs.getInt("phone") %>"></td>
        </tr>
        <tr>
            <td>Fax:</td>
            <td><input   type="text"   name="fax" value="<%=rs.getInt("fax") %> "></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input   type="text"  name="address"  value="<%=rs.getString("address") %>"></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input   type="text"  name="city" value="<%=rs.getString("city") %>"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><textarea rows="5" cols="10" placeholder="enter description here:" name="desc"><%=rs.getString("description") %></textarea></td>
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
     <%
        if(request.getParameter("a")!=null)
    {%>
        <div class="box-content alerts">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>Oh snap!</strong> Company  already exists.
						</div>
<%}%>
    <table align="center" cellpadding="15">
        <tr>
            <td>Company name:</td>
            <td><input   type="text"   name="cnm"></td>
        </tr>
        <tr>
            <td>proprietor :</td>
            <td><input   type="text"  name="pnm"></td>
        </tr>
        <tr>
            <td> Iec:</td>
            <td><input   type="text"  name="iec"></td>
        </tr>
        <tr>
            <td>gst no:</td>
            <td><input   type="text"  name="gst" ></td>
        </tr>
        <tr>
            <td>Email-id:</td>
            <td><input   type="text"  name="eid"></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input   type="text"  name="phone"></td>
        </tr>
        <tr>
            <td>Fax:</td>
            <td><input   type="text"   name="fax"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input   type="text"  name="address"></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><input   type="text"  name="city"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><textarea rows="5" cols="10" placeholder="enter description here:" name="desc"></textarea></td>
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
