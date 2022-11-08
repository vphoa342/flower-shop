<%-- 
    Document   : header_loginedAdmin
    Created on : Jul 11, 2022, 11:48:34 PM
    Author     : vphoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <header>
            <li><a href="MainController?action=manageAccounts">Manage Accounts</a></li>
            <li><a href="#">Manage Orders</a></li>
            <li><a href="#">Manage Plants</a></li>
            <li><a href="#">Manage Categories</a></li>
            <li>Welcome ${sessionScope.name}<a href="#">logout</a></li>
        </header>
    </body>
</html>
