<%-- Document : personalPage Created on : Jun 23, 2022, 10:04:55 AM Author : vphoa --%>

<%@page import="sample.dto.Account"%>
<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="mycss.css" type="text/css">
        </head>

        <body>
            <% 
                String name=(String) session.getAttribute("name"); 
                String email = (String) session.getAttribute("email");
                Cookie[] c = request.getCookies();
                boolean login = false;
                if (name==null) { 
                    String token = "";
                    if (c != null) {
                        for (Cookie aCookie: c) {
                            if (aCookie.getName().equals("selector")) {
                                token = aCookie.getValue();
                                Account acc = AccountDAO.getAccount(token);
                                if (acc != null) {
                                    name = acc.getFullname();
                                    email = acc.getEmail();
                                    login = true;
                                }
                            }
                        }
                    }
                } else {
                    login = true;
                }
            if (!login) {
            %>
                <p>
                    <font color='red'>You must login to view personal page</font>
                </p>
            <% } else {%>
                
                    <header>
                        <%@include file="header_loginedUser.jsp" %>
                    </header>
                    <section>
                        <h3>Welcome <%= name%> come back</h3>
                        <h3><a href="mainController?action=logout">Logout</a></h3>
                    </section>
                    <section>
                        <%  
                            int accId = (int) session.getAttribute("accId");
                            ArrayList<Order> list = OrderDAO.getOrders(accId);
                            String[] status = {"", "processing", "completed", "canceled"};
                            if (list != null && !list.isEmpty()) {
                                for (Order ord: list) { %>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>Status</th>
                                            <th>action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%= ord.getOrderId() %></td>
                                            <td><%= ord.getOrderDate() %></td>
                                            <td><%= ord.getShipDate() %></td>
                                            <td><%= status[ord.getStatus()] %>
                                                <br>
                                                <% if (ord.getStatus() == 1) %>
                                                    <a href="#">Cancel Order</a>
                                            </td>
                                            <td><a href="orderDetail.jsp?orderId=<%= ord.getOrderId()%>">detail</a></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <%}
                            } else {
                        %>
                        <p>You don't have any order</p>
                        <% } %>
                    </section>
                    <footer>
                        <%@include file="footer.jsp" %>
                    </footer>
                <% } %>
        </body>

        </html>