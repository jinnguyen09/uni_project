<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectDB" %>

<%
    try {
        Connection conn = connectDB.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM Logins";
        ResultSet resultSet = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Trị Người Dùng</title>
    
    <style>
        body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        color: #333;
        margin: 0;
        padding: 0;
    }

    h2 {
        margin: 30px 0;
        text-align: center;
        font-size: 28px;
        color: #007bff;
    }

    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #dee2e6;
    }

    th {
        background-color: #007bff;
        color: #fff;
        text-transform: uppercase;
    }

    tr:nth-child(even) {
        background-color: #f8f9fa;
    }

    tr:hover {
        background-color: #e9ecef;
    }

    input, select {
        padding: 6px;
        font-size: 14px;
        border: 1px solid #ced4da;
        border-radius: 4px;
    }

    button {
        width: 90px;
        height: 30px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }

    button:hover {
        background-color: #218838;
    }

    form {
        display: inline-block;
    }

    </style>
</head>
<body>
    <a href="home.jsp">Quay lại trang chính</a>
    <h2>Quản Trị Người Dùng</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên Đăng Nhập</th>
            <th>Vai Trò</th>
            <th>Thao Tác</th>
        </tr>
        <%
            while (resultSet.next()) {
%>
        <tr>
            <td><%= resultSet.getInt("ID") %></td>
            <td><%= resultSet.getString("Username") %></td>
            <td><%= resultSet.getString("Role") %></td>
            <td>
                <form action="update_role.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="user_id" value="<%= resultSet.getInt("ID") %>">
                    <select name="role">
                        <option value="0" <%= resultSet.getString("Role").equals("0") ? "selected" : "" %>>User</option>
                        <option value="1" <%= resultSet.getString("Role").equals("1") ? "selected" : "" %>>Admin</option>
                        <option value="2" <%= resultSet.getString("Role").equals("2") ? "selected" : "" %>>Broker</option>
                    </select>
                    <button type="submit">Cập Nhật</button>
                </form>
                <form action="delete_user.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="user_id" value="<%= resultSet.getInt("ID") %>">
                    <button type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');">Xóa</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>