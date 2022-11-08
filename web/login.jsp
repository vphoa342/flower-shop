<%-- 
    Document   : login
    Created on : Jun 21, 2022, 9:45:01 AM
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
            <%@include file="header.jsp" %>
        </header>
        <section>
            <form action="mainController" method="post" class="form">
                <font style="color:red;">
                    <%=(request.getAttribute("WARNING")==null)?"":request.getAttribute("WARNING") %>
                </font>
                <table>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="txtemail"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="login" name="action"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" value="savelogin" name="savelogin">Stayed signed in</td>
                    </tr>
                </table>

            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
