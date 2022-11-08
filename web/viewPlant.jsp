<%-- 
    Document   : viewPlant
    Created on : Jul 11, 2022, 10:38:31 PM
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
        <jsp:useBean id="plantObj" class="sample.dto.Plant" scope="request"/>
        <table border="1">
            <tbody>
                <tr>
                    <td rowspan="8"><img scr="<jsp:getProperty name="plantObj" property="imgPath"></jsp:getProperty>"</td>
                </tr>
                <tr>
                    <td>ID: <jsp:getProperty name="plantObj" property="id"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Product Name: <jsp:getProperty name="plantObj" property="name"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Price: <jsp:getProperty name="plantObj" property="price"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Description: <jsp:getProperty name="plantObj" property="description"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Status: <jsp:getProperty name="plantObj" property="status"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Cate id: <jsp:getProperty name="plantObj" property="cateid"></jsp:getProperty></td>
                </tr>
                <tr>
                    <td>Category: <jsp:getProperty name="plantObj" property="catename"></jsp:getProperty></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
