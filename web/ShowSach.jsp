<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="domain.*" %>
<%@page import="dao.*" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SÁCH</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <h2>DANH SÁCH</h2>
            <p>
                <a class="btn btn-primary" href="index.jsp">Trang Chủ</a>
            </p>
            <p>
                <a class="btn btn-primary" href="ThemSach.jsp">Thêm Sách</a>
            </p>
            <% SachDAO lsd = new SachDAO();%>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Mã Sách</th>
                        <th>Tên Sách</th>
                        <th>Gía</th>
                        <th>Loại Sách</th>
                        <th>option</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="dm" items="<%=lsd.getContacts()%>">
                        <tr>
                            <td width="100"><img src="${dm.anh}" width="80" height="70"/></td>
                            <td>${dm.masach}</td>
                            <td>${dm.tensach}</td>
                            <td>${dm.giasach}</td>
                            <td>${dm.loaisach.tenloai}</td>
                            <td>
                                <a class="btn btn-primary btn-sm" href="sachServlet?masach=${dm.masach}&action=sua&masach=${dm.masach}">sua</a>
                                <a class="btn btn-danger btn-sm" href="sachServlet?masach=${dm.masach}&action=xoa" onclick="return confirm('ARE YOU SURE ?')">xoa</a></td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

