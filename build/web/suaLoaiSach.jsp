
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Sách</title>
    </head>
    <body>
        <form method="post" action="LoaiSachServlet?action=update">
            <table>
                <tr>
                    <td><label>TÊN LOẠI SÁCH</label></td> 
                    <td>  <input type="text" name = "maloai" value="${loaisach.maloai}" ><br></td> 
                </tr>
                <tr>
                    <td><label>TÊN LOẠI SÁCH</label></td> 
                    <td><input type="text" name = "tenloaisach" value="${loaisach.tenloai}"><br></td> 
                </tr>
            </table>
            <input type="submit" value="save">
        </form>
    </body>
</html>
