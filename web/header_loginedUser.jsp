<%-- 
    Document   : header_loginedUser
    Created on : Jun 23, 2022, 10:05:26 AM
    Author     : vphoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="">Change profile</a></li>
                <li><a href="">Completed orders</a></li>
                <li><a href="">Canceled orders</a></li>
                <li><a href="">Processing orders</a></li>
                <li>from<input type="date" name="from"> to <input type="date" name="to">
                    <input type="submit" value="search">
                </li>
            </ul>
        </nav>
    </body>
</html>
