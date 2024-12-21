<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    
    <style>
        body {
            background-color: white;
            margin: 0;
            height: 100vh;
            width: 100%;
            overflow-x: hidden;
        }

        .home_container {
            background-color: white;
            margin: 0;
            padding: 0;
        }   
        
        .home_menu {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            height: 50px;
            background-color: white;
            padding: 0 10px;
        }

        h2 {
            margin: 0;
            margin-left: 30px;
            cursor: pointer;
            font-size: 25px;
            font-family: Arial, sans-serif;
        }

        ul {
            display: flex;
            list-style-type: none;
            padding: 0;
            margin: 0;
            align-items: center;
            justify-content: center;
        }

        li {
            margin-right: 50px;
            font-size: 15px;
            cursor: pointer;
        }
        
        .bi-heart {
            font-size: 20px;
        }
        
        button {
            cursor: pointer;
            color: white;
            background-color: #00E5B9;
            width: 100px;
            height: 35px;
            border-radius: 10px;
            margin-right: 40px;
            font-size: 15px;
            font-weight: bold;
            border: 0;
        }
        
        li:hover {
            color: #83e6d3;
        }
        
        button:hover {
            color: rgb(116, 116, 204);
        }
        
        .divider {
            border-top: 3px solid rgba(0, 0, 0, 0.03); /* Đường kẻ ngang */
            margin: 1px 0;
        }
        
        h2 a, li a, button a {
            text-decoration: none;
            color: inherit;
        }
        
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none; /* Ẩn danh sách ban đầu */
            position: absolute;
            background-color: white;
            min-width: 270px;
            box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.2);
            z-index: 1;
            font-size: 15px;
            border-radius: 5px;
        }

        .dropdown-content a {
            color: black;
            padding: 6px 8px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f2f2f2;
        }

        /* Hiện danh sách khi hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        .hidden{
            position: relative;
            display: inline-block;
        }

        .hidden-content {
            display: none; /* Ẩn danh sách ban đầu */
            position: absolute;
            min-width: 110px;
            font-size: 15px;
            top: 200%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .hidden-content p {
            color: black;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        /* Hiện danh sách khi hover */
        .hidden:hover .hidden-content {
            display: block;
        }
    </style>
</head>
<body>
    <%
        String username = (session != null) ? (String) session.getAttribute("username") : null;
    %>
                
    <div class="home_container">
        <div class="home_menu">
            <h2 style="margin: 20px"><a href="home.jsp">Property</a></h2>
            <ul>
                <li>
                    <form action="search_property.jsp">
                        <input type="text" name="search_property" placeholder="Tìm kiếm bất động sản"style="width: 400px; height: 30px; border-radius: 10px; border: 1px solid rgba(0, 0, 0, 0.5)"></a>
                    </form>
                </li>
                <li class="dropdown">
                    <a href="real_estate_for_sale.jsp">Nhà đất bán</a>
                    <div class="dropdown-content">
                        <a href="#">Bán căn hộ chung cư</a>
                        <a href="#">Bán chung cư mini, căn hộ dịch vụ</a>
                        <a href="#">Bán nhà riêng</a>
                        <a href="#">Bán nhà biệt thự, liền kề</a>
                        <a href="#">Bán nhà mặt phố</a>
                        <a href="#">Bán shophouse, nhà phố thương mại</a>
                        <a href="#">Bán đất nền dự án</a>
                        <a href="#">Bán đất</a>
                        <a href="#">Bán trang trại, khu nghỉ dưỡng</a>
                        <a href="#">Bán condotel</a>
                        <a href="#">Bán kho, nhà xưởng</a>
                        <a href="#">Bán loại bất động sản khác</a>                        
                    </div>
                </li>
                <li class="dropdown">
                    <a href="real_estate_for_rent.jsp">Nhà đất cho thuê</a>
                    <div class="dropdown-content">
                        <a href="#">Cho thuê căn hộ chung cư</a>
                        <a href="#">Cho thuê chung cư mini, căn hộ dịch vụ</a>
                        <a href="#">Cho thuê nhà riêng</a>
                        <a href="#">Cho thuê nhà biệt thự, liền kề</a>
                        <a href="#">Cho thuê nhà mặt phố</a>
                        <a href="#">Cho thuê shophouse, nhà phố thương mại</a>
                        <a href="#">Cho thuê nhà trọ, phòng trọ</a>
                        <a href="#">Cho thuê văn phòng</a>
                        <a href="#">Cho thuê, sang nhượng cửa hàng, ki ốt</a>
                        <a href="#">Bán condotel</a>
                        <a href="#">Cho thuê kho, nhà xưởng, đất</a>
                        <a href="#">Cho thuê loại bất động sản khác</a>                        
                    </div>
                </li>
                <li class="dropdown">
                    <a href="project.jsp">Dự án</a>
                    <div class="dropdown-content">
                        <a href="#">Căn hộ chung cư</a>
                        <a href="#">Cao ốc văn phòng</a>
                        <a href="#">Trung tâm thương mại</a>
                        <a href="#">Khu đô thị mới</a>
                        <a href="#">Khu phức hợp</a>
                        <a href="#">Nhà ở xã hội</a>
                        <a href="#">Khu nghỉ dưỡng, Sinh thái</a>
                        <a href="#">Khu công nghiệp</a>
                        <a href="#">Biệt thự, liền kề</a>
                        <a href="#">Shophouse</a>
                        <a href="#">Nhà mặt phố</a>
                        <a href="#">Dự án khác</a>                        
                    </div>
                </li>
                <li><a href="news.jsp">Tin tức</a></li>
                <li class="dropdown">
                    <a href="wiki.jsp">Wiki BĐS</a>
                    <div class="dropdown-content">
                        <a href="#">Mua BĐS</a>
                        <a href="#">Bán BĐS</a>
                        <a href="#">Thuê BĐS</a>
                        <a href="#">Tài chính BĐS</a>
                        <a href="#">Quy hoạch - Pháp lý</a>
                        <a href="#">Nội - Ngoại thất</a>
                        <a href="#">Phong thủy</a>                   
                    </div>
                </li>
                <li class="hidden">
                    <a href="stored.jsp"><i class="bi bi-heart" style="color: black"></i></a>
                    <div class="hidden-content">
                        <p>Danh sách đã lưu</p>
                    </div>
                </li>
                <%if(username == null){%>
                <li><a href="login.jsp">Đăng nhập</a></li>
                       <%}else{ %>
                <li class="dropdown">
                    <a href="logout.jsp">Đăng xuất</a>
                    <div class="dropdown-content">
                        <a href="account.jsp">Tổng quan</a>
                        <a href="list_room.jsp">Quản lý tin đăng</a>
                        <a href="#">Quản lý khách hàng</a>
                        <a href="#">Thay đổi thông tin cá nhân</a>
                        <a href="changepass.jsp">Thay đổi mật khẩu</a>
                        <a href="#">Nạp tiền</a>
                    </div>
                </li>           
                <%}%>
            </ul>
            <button type="submit"><a href="up_story.jsp">Đăng tin</a></button>
        </div>
        <div class="divider"></div>
    </div>
</body>
</html>
