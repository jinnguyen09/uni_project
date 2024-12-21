<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" %>
<%@ page import="model.connectDB" %>
<%
    Integer userId = (Integer) session.getAttribute("id");

    // Kiểm tra nếu người dùng chưa đăng nhập
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return; // Dừng thực hiện tiếp
    }

    // Kết nối đến cơ sở dữ liệu
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet resultSet = null;

    try {
        conn = connectDB.getConnection();
        String query = "SELECT * FROM property WHERE user_id = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, userId);
        resultSet = pstmt.executeQuery();
    } catch (SQLException e) {
        out.println("Lỗi truy vấn cơ sở dữ liệu: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách phòng trọ</title>
</head>
<body>
    <h2>Danh sách phòng trọ</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên phòng trọ</th>
                <th>Địa chỉ</th>
                <th>Giá</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (resultSet != null && resultSet.next()) {
            %>
            <tr>
                <td><%= resultSet.getInt("ID") %></td>
                <td><%= resultSet.getString("title") %></td>
                <td><%= resultSet.getString("address") %></td>
                <td><%= String.format("%,.0f VND", resultSet.getDouble("price")) %></td>
                <td>
                    <a href="edit_room.jsp?ID=<%= resultSet.getInt("ID") %>">Sửa</a>
                    <a href="delete_room.jsp?ID=<%= resultSet.getInt("ID") %>" onclick="return confirm('Bạn có chắc chắn muốn xóa phòng trọ này?')">Xóa</a>
                    <a href="is_active.jsp?ID=<%= resultSet.getInt("ID") %>">Ẩn</a>
                    <a href="is_active1.jsp?ID=<%= resultSet.getInt("ID") %>">Hiện</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <div class="center-button">
        <a href="home.jsp"><button type="button">Quay lại Trang Chủ</button></a>
    </div>
</body>
</html>

<%
    // Đóng kết nối cơ sở dữ liệu
    if (resultSet != null) {
        resultSet.close();
    }
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
%>