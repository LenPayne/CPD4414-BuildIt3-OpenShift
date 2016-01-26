<%-- 
    Document   : dbsample
    Created on : Jan 26, 2016, 11:03:31 AM
    Author     : Len Payne <len.payne@lambtoncollege.ca>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbsample.DBSample"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%  String strId = request.getParameter("id");
            if (!strId.isEmpty()) {
                try {
                    int id = Integer.parseInt(strId);
                    out.print(DBSample.getJSON(id));
                } catch (NumberFormatException ex) {
                    out.print("Error with ID. " + strId + " is not a number.");
                }

            } else {
                out.print(DBSample.getJSON());
            }
        %>
    </body>
</html>
