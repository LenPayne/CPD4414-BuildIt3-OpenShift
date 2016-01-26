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
        <title>Database Sample Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-2.2.0.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%  String strId = request.getParameter("id");            
            if (strId != null && !strId.isEmpty()) {
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
        <p><a class="btn btn-primary" href="#">Reload</a></p>
        <form method="GET" action="#">Query By ID: <input name="id" /><input type="submit" class="btn btn-default" /></form>                
    </body>
</html>
