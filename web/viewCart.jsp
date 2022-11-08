<%-- 
    Document   : viewcart
    Created on : Jul 10, 2022, 1:48:49 PM
    Author     : vphoa
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>      
                    <h3>Welcome <%= session.getAttribute("name")%> come back</h3>
                    <h3><a href="mainController?action=logout">Log out</a></h3>
                    <h3><a href="personalPage.jsp">personal page</a></h3>
            <%    
                }
            %>
            <font style="color:red;">
                <%= (request.getAttribute("WARNING")==null)?"":request.getAttribute("WARNING")%>
            </font>
            <table width="100%" class="shopping">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                        int money = 0;
                        if (cart != null) {
                            Set<String> pids = cart.keySet();
                            for (String pid: pids) {
                                int quantity = cart.get(pid);
                                money += quantity * 1000;
                    %>
                                <form action="mainController" method="post">
                                    <tr>
                                        <td><input type="hidden" value="<%= pid %>" name="pid"><a href="getPlantServlet?pid=<%= pid%>"><%=pid%></a></td>
                                        <td><input type="number" value="<%= quantity %>" name="quantity"></td>
                                        <td>
                                            <input type="submit" value="update" name="action">
                                            <input type="submit" value="delete" name="action">
                                        </td>
                                    </tr>
                                </form>
                    <%
                            }
                        } else {
                    %>
                            <tr>
                                <td>Your cart is empty</td>
                            </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td>Total money: <%= cart==null?0:money%></td>
                    </tr>
                    <tr>
                        <td>Order Date = <%= (new Date()).toString()%></td>
                    </tr>
                    <tr>
                        <td>Ship Date: N/A></td>
                    </tr>
                </tbody>
            </table>
        </section>
        <section>
            <form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action" class="submitorder">
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
