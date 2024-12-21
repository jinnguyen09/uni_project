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
    <title>Đăng nhập</title>  
    
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
        
        h2 {
            color: black;
            margin-bottom: 20px; /* Khoảng cách dưới tiêu đề */
            font-size: 25px;
        }
        
        .form-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        input {
            width: 400px;
            height: 50px;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Bao gồm padding và border trong kích thước */
        }
        
        input[type="submit"] {
            background-color: #FF839A;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s; /* Hiệu ứng chuyển màu */
        }
        
        input[type="submit"]:hover {
            background-color: #FF046A;
        }
        
        input[type="checkbox"]{
            width: 15px;
        }
        
        p{
            color: red;
            cursor: pointer;   
        }
        
        p a{
            text-decoration: none;
            color: inherit;
        }
        
        i{
            color: red;
            font-style:normal;
            cursor: pointer;
        }
        
        i:hover{
            color: #FF839A;
        }
    </style>
</head>
<body>    
    <div id="login-container">
        <div id="imgage">
            <img src="image/property.png" alt="Programming">
        </div>
            <div id="login">
                <h3>Xin chào bạn</h3>
                <h2 style="cursor:inherit">Đăng ký tài khoản mới</h2>
        <form action="Register" method="POST">
            <c:if test="${not empty errorMessage}">
            <div style="color: red;">${errorMessage}</div>
        </c:if>
            <div class="form-group">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            <div class="form-group">
                <input type="text" name="phonenumber" placeholder="Số điện thoại" required>
            </div>
            <input type="submit" value="Đăng ký">
            <div class="form-group">
                <label for="miss" style="display: flex; align-items: center; cursor: pointer">
                    <input type="checkbox" id="miss"  name="rememberMe" style="margin-right: 5px; cursor: pointer"> Nhớ tài khoản
                </label>
            </div>
            
            <p style="color: black; cursor: inherit">Bạn đã có tài khoản? <a href="login.jsp"><i>Đăng nhập</i></a> tại đây</p>
        </form>
        </div>
                
    </div>
</body>
</html>