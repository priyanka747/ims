     
<head>
    <script type="text/javascript">
        function chng()
        {
            var sbox=document.getElementedById("sb");
            var sboxvalue=sbox.options[sb.selectedIndex].value;
            alert(sboxvalue);
        }
        </script>
</head><%@page import="java.sql.*"%>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Form Elements</h2>
						<div class="box-icon">
						<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <center>
                                                <form  action="controller/add_location_c.jsp" method="post">
          <fieldset style="width: auto "><legend>Location</legend>
<%
                                                          if(request.getParameter("edit")!=null){
                                                              
                                                              try
                                                              {
                                                                   Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from location where locationid='"+request.getParameter("edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                                     <div >
         Location:
         <input type="hidden" name="hid_edit" id="hid_edit" value="<%=request.getParameter("edit")%>"/>

         <input type="text" placeholder="enter location" name="cat" value="<%=rs.getString("locationname")%>"/>
		  <br>
          <div >  </div></div>
        <div align="center"> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="view" size="7" >
            <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     stm=conn.createStatement();
                                                                     query="select * from location where status!='Inactive";
                                                                      rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value='<%=rs.getString("locationid")%>'><%=rs.getString("locationname")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select>
          <br>
          <br>
    </div>
<div align="center">
    <button type="submit" class="btn btn-primary">Submit</button>
    <input type="reset" name="reset" value="reset" >
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
							<strong>Oh snap!</strong> Location already exists.
						</div>
<%}%>
         Location:
         <input type="text" placeholder="enter location" name="cat"/>
		  <br>
          <div >  </div></div>
          <div align="center"> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="view"  id="sb" size="7"  >
<%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                     Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from location where status!='Inactive'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value='<%=rs.getString("locationid")%>'><%=rs.getString("locationname")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
         </select>
          <br>
          <br>
    </div>
<div align="center">
   <button class="btn btn-large btn-success" name="add">Add</button>
         
</div><%}%>
</fieldset>
</form>
                                            </center>
                                        </div>
                                </div>
     </div>
