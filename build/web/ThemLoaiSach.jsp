
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Sách</title>
    </head>
    <body>
        <form method="post" action="LoaiSachServlet?action=xulythem">
            TÊN LOẠI SÁCH  <input type="text" name = "tenloaisach"><br>
            <input type="submit" value="save" >
        </form>
    </body>
</html>
