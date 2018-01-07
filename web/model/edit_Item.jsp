 <%@page import="java.sql.*"%>
<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Category Form </h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <form action="controller/add_item_c.jsp">
<fieldset style="width: auto ">

<!-- Form Name -->
<legend>Item</legend>
<%
                                                          if(request.getParameter("edit")!=null){
                                                              
                                                              try
                                                              {
                                                                   Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="select * from item where itemid='"+request.getParameter("edit")+"'";
                                                                     ResultSet rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {%>
                                                                   <div >
         category:
           <input  name="category" type="text" placeholder="enter category" value="<%=rs.getString("category_nm")%>">
           
		  
          <div >  </div></div>
        <div> <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <select name="select" size="7" >
           <%
    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     stm=conn.createStatement();
                                                                      query="select * from item where status!='Inactive'";
                                                                       rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        
            <option value="<%=rs.getString("itemname")%>"><%=rs.getString("itemname")%>-<%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select>
          <br>
          <br>
    </div>
       <%    try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     stm=conn.createStatement();
                                                                      query="select * from item where itemid='"+request.getParameter("edit")+"'";
                                                                       rs=stm.executeQuery(query);
                                                                     while(rs.next())
                                                                     {
    %>
        <div>&nbsp;&nbsp;&nbsp;Item: 
          <input  name="item" type="text" placeholder="enter item" value="<%=rs.getString("itemname")%>">
            <%}}catch(Exception e)
{
    out.println(e);
}%>
          <button class="btn btn-large btn-success" name="add">Add</button>
          <!--<button class="btn btn-large btn-danger">Delete</button>-->
 
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
         category:
          <select  name="category" >
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
        
            <option value="<%=rs.getString("category_nm")%>"><%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
		  </select>
          <div >  </div></div>
        <div> <br> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <select name="select" size="7" >
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
        
            <option value="<%=rs.getString("itemname")%>"><%=rs.getString("itemname")%>-<%=rs.getString("category_nm")%></option>
         
          <%}}catch(Exception e)
{
    out.println(e);
}%>
          </select>
          <br>
          <br>
    </div>
        <div>&nbsp;&nbsp;&nbsp;Item: 
          <input  name="item" type="text" placeholder="enter item" >
          <button class="btn btn-large btn-success" name="add">Add</button>
          <!--<button class="btn btn-large btn-danger">Delete</button>-->
 
        </div>
          <%}%>
</fieldset>
</form>
                                        
    </div>
                                </div>
     </div>
