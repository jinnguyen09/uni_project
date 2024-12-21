<%-- 
    Document   : login
    Created on : Oct 21, 2024, 1:00:54 AM
    Author     : Trung
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>  
    
    <style>
          #login-container {
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            height: calc(100vh -40px);  
            flex-direction: row ;
        }
        
        #imgage{
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
            width: 300px;
            height: 700px;
            flex-direction: column;

        }
        
        #login{
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex; /* Sử dụng Flexbox để căn giữa nội dung trong khung */
            width: 400px; /* Chiều rộng khung đăng nhập */
            height: 600px;
            flex-direction: column;
            align-items: center; /* Căn giữa theo chiều ngang */           
        }
        
        .bi-arrow-left{
            cursor: pointer;
            font-size: 20px;
            color: rgba(0, 0, 0, 0.5);
        }
        
        input{
            width: 90%;
            height: 30px;
            font-size: 15px;
            border-radius: 5px;
            border-width: 1px;
        }
        
        input[type="submit"] {
            background-color: #FF839A;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            height: 40px;
            width: 90%;
        }
        
        p{
            font-size: 15px;
        }
        
        i{
            font-size: 16px;
        }
    </style>
</head>
<body>    
    <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>
    <div id="login-container">
        <div id="imgage">
            <img src="image/property.png" alt="Programming">
        </div>
        <div id="login">
            <a href="login.jsp" style="padding-top: 30px; padding-right: 350px">
                <i class="bi bi-arrow-left"></i>
            </a>
            <p style="padding-right: 220px; font-size: 17px">Khôi phục tài khoản</p>
            <form action="Forgot_Password" method="Post">
                <input type="text" name="username" placeholder="Nhập tên tài khoản" style="width: 350px; margin-left: 20px;" required>
                <input type="submit" style="width: 200px; margin-left: 100px" value="Gửi">
            </form>
            <p>Bạn chưa có tài khoản? <a href="register.jsp" style="color: red; text-decoration: none"><i>Đăng ký</i></a> tại đây</p>
        </div>
                
    </div>
</body> 
</html>