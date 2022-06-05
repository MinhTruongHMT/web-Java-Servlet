<%@page import="dao.LoaiSachDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>ADD BOOKS</title>
    </head>
    <body>
        <div class="container" style="margin-top: 10px;">
            <div class="row"
                 style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                <div class="col-sm-12">
                    <% LoaiSachDAO lsd = new LoaiSachDAO();%>
                    <h2 class="myclass">ADD BOOKS</h2>
                    <form method="post"  action="sachServlet?action=xulythem" >
                        <div class="form-group">
                            <label>ID</label> 
                            <input type="text" 
                                   class="form-control" name="masach" placeholder="Enter id">
                        </div>
                        <div class="form-group">
                            <label>Full Name</label> 
                            <input type="text" 
                                   class="form-control" name="tensach" placeholder="Enter name">
                        </div>

                        <div class="form-group">
                            <label>gia</label> 
                            <input type="text" 
                                   class="form-control" name="giasach" placeholder="Enter name">
                        </div>

                        <div class="form-group">
                            <label>Mã loại Sách</label> 
                            <select name="list">
                                <c:forEach var="cate" items="<%=lsd.getContacts()%>">
                                    <option value="${cate.maloai}">${cate.tenloai}</option>
                                </c:forEach>

                            </select>
                        </div>

                        <div class="form-group">
                            <label>Photo</label> <br/>

                            <input type="file" 
                                   class="form-control" name="photo" placeholder="Enter photo">
                        </div>
                        <button type="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
