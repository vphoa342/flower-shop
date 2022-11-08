<%-- 
    Document   : orderDetail
    Created on : Jul 9, 2022, 11:08:59 AM
    Author     : vphoa
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <%  String orderId = request.getParameter("orderId");
                if (orderId != null) {
                    int orderID = Integer.parseInt(orderId.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail: list) { %>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Plant ID</th>
                                        <th>Plant Name</th>
                                        <th>Image</th>
                                        <th>quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%= detail.getOrderId()%></td>
                                        <td><%= detail.getPlantId()%></td>
                                        <td><%= detail.getPlantName()%></td>
                                        <td><img src='<%= detail.getImgPath()%>' class='plantimg'><br> <%=detail.getPrice()%></td>
                                        <td><%= detail.getQuantity()%></td>
                                        <% money = money + detail.getPrice() * detail.getQuantity(); %>
                                    </tr>
                                </tbody>
                            </table>
                        <%} %>
                        <h3>Total money: <%= money%></h3>
                    <%}
                    else { %>
                        <p>You don't have any order</p>
                    <%}
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        
       
    </body>
</html>
