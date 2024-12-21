<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<%@ page import="java.sql.*, model.connectDB" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Tài Khoản</title>
    <style>
        h3 {
            margin: 30px;
            text-align: center;
            font-size: 28px;
            color: #333;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        table th,
        table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        input {
            width: 90%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .error-message {
            text-align: center;
            color: red;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
    
    <h3>Thông tin tài khoản</h3>

    <%
        session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");

        if (id != null) {
            Connection conn = connectDB.getConnection();
            String sql = "SELECT * FROM logins WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên tài khoản</th>
            <th>Số điện thoại</th>
            <th>Quyền</th>
            <th>Actions</th>
        </tr>
        <tr>
            <form action="Account" method="post">
                <td><input type="number" name="id" value="<%= rs.getInt("id") %>" readonly></td>
                <td><input type="text" name="username" value="<%= rs.getString("username") %>" required></td>
                <td><input type="text" name="phonenumber" value="<%= rs.getString("phonenumber") %>" required></td>
                <td><input type="text" name="role" value="<%= rs.getInt("role") %>" readonly></td>
                <td><button type="submit">Cập nhật</button></td>
            </form>
        </tr>
    </table>
    <%
            } else {
                out.println("<div class='error-message'>Không tìm thấy tài khoản.</div>");
            }
            conn.close();
        } else {
            out.println("<div class='error-message'>Vui lòng đăng nhập để tiếp tục.</div>");
        }
    %>
</body>
</html>