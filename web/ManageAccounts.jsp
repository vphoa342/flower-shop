<%-- 
    Document   : ManageAccounts
    Created on : Jul 11, 2022, 11:57:10 PM
    Author     : vphoa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/>
        <form action="mainController" method="post">
            <input type="text" name="txtSearch">
            <input type="submit" name="action" value="searchAccount">
        </form>
        <h1></h1>
        <table class="order">
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Full name</th>
                <th>Status</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            <c:forEach var="acc" items="${requestScope.accountList}">
                <tr>
                    <td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullname()}"></c:out></td>
                    <td>
                        <c:choose>
                            <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                    <td>
                        <c:choose>
                            <c:when test="${acc.getRole() eq 1}">Admin</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unblock</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
