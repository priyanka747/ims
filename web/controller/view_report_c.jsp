<%-- 
    Document   : view_report_c
    Created on : May 26, 2017, 3:31:33 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <title>JSP Page</title>
        <jsp:include page="../include/head.jsp"/>
       
    </head>
    <body>
        <%
                                                    if(request.getParameter("rep")!=null)
                                                    {
                                                        String rep=request.getParameter("rep");
                                                         if(rep.equals("csummarry"))
                                                        {%>
                                                        <jsp:include page="csummary.jsp"/>
                                                        <%}
                                                        else if(rep.equals("lsummary"))
                                                         {%>
                                                         <jsp:include page="lsummary.jsp"/>
                                                        <% }
                                                        else if(rep.equals("category"))
                                                         {%>
                                                         <jsp:include page="category.jsp"/>
                                                        <% }
                                                        else if(rep.equals("item"))
                                                         {%>
                                                         <jsp:include page="item.jsp"/>
                                                        <% }
                                                          else if(rep.equals("location"))
                                                         {%>
                                                         <jsp:include page="location.jsp"/>
                                                        <% }
                                                    }
%>
    </body>
</html>
