<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<%@ page import="java.sql.*, model.connectDB" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đăng tin</title>
    
    <style>
        .posting{
            background-color: white;
            margin-left: 400px;
            width: 700px;
            height: 550px;
            border: 1px solid rgba(0, 0, 0, 0.09);
            border-radius: 10px;
        }
        
        .posting input{
            width: 500px;
            height: 25px;
            padding: 5px;
            margin-top: 15px;
            margin-left: 90px;
            border-radius: 5px;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }
        
        .posting button{
            margin-top: 30px;
            margin-left: 250px;
            width: 170px;
            height: 35px;
            font-size: 20px;
            background: #FF839A;
        }
        
        .posting button:hover{
            background-color: rgba(255, 131, 154, 0.5);
            color: white;
        }
    </style>
</head>
<body>
    <h3 style="font-size: 25px; text-align: center; color: #333; padding: 20px;">Đăng tin bất động sản</h3>
    
    <form action="Property_posting" method="post" enctype="multipart/form-data">
        <div class="posting">
        <input type="text" name="name" placeholder="Nhập tên phòng trọ" required><br>
        <input type="text" name="price" placeholder="Nhập giá tiền" required><br>
        <input type="text" name="area" placeholder="Nhập diện tích" required><br>
        <input type="text" name="address" placeholder="Nhập địa chỉ" required><br>
        <input type="text" name="description" placeholder="Nhập mô tả" required><br>
        <input type="number" name="phone" placeholder="Nhập số điện thoại" required><br>
        <input type="file" name="image" accept="image*/" required ><br>
        <input type="text" name="utilities" placeholder="Nhập tiện ích" required><br>
        <input type="number" name="approve" placeholder="Trạng thái" required><br>
        <button type="submit">Đăng tin</button>
        </div>
    </form>
</body>
</html>
    

