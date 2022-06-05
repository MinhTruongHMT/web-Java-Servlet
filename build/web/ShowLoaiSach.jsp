<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.*" %>
<%@page import="dao.*" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOẠI SÁCH</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <a class="btn btn-primary" href="index.jsp">TRANG CHỦ</a><br>
            <a class="btn btn-primary" href="ThemLoaiSach.jsp">THÊM LOẠI SÁCH</a><br>

            <br>
            <% LoaiSachDAO lsd = new LoaiSachDAO();%>

            <table border ="1" cellspacing="0" style="margin-bottom: 50px" class="table table-bordered">
                <tr>
                    <th>Mã loại</th>
                    <th>Loại</th>
                    <th>option</th>
                </tr>
                <c:forEach var="dm" items="<%=lsd.getContacts()%>">
                    <tr>
                        <td>${dm.maloai}</td>
                        <td> ${dm.tenloai}</td>
                        <td>
                             <a class="btn btn-primary btn-sm" href="LoaiSachServlet?maloai=${dm.maloai}&action=sua">sua</a>
                            <a class="btn btn-danger btn-sm" href="LoaiSachServlet?maloai=${dm.maloai}&action=xoa" onclick="return confirm('ARE YOU SURE ?')">Xóa</a></td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
