<%-- 
    Document   : header
    Created on : Jun 21, 2022, 9:27:18 AM
    Author     : vphoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href=""><img src="images/logo.jpg" id="logo"></a></li>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="mainController?action=viewcart">View Cart</a></li>
                    <li>
                        <form action="mainController" method="post" class="formsearch">
                            <input type="text" name="txtsearch" value='<%= (request.getParameter("txtsearch") == null)?"": request.getParameter("txtsearch")%>'>
                            <select name="searchby">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
