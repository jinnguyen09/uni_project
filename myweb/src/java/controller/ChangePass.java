package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.connectDB;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            request.setAttribute("errorMessage", "Bạn cần đăng nhập để thay đổi mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String oldpass = request.getParameter("oldpass");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        PrintWriter out = response.getWriter();
        Connection conn = null;

        try {
            conn = connectDB.getConnection();
            String checkOldPassQuery = "SELECT * FROM logins WHERE username = ? AND password = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkOldPassQuery);
            checkStmt.setString(1, username);
            checkStmt.setString(2, oldpass);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                if (password.equals(repassword)) {
                    String updateQuery = "UPDATE logins SET password = ? WHERE username = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setString(1, password);
                    updateStmt.setString(2, username);

                    int rows = updateStmt.executeUpdate();
                    if (rows > 0) {
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật mật khẩu!");
                        request.getRequestDispatcher("changepass.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "Nhập lại mật khẩu không đúng!");
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Mật khẩu cũ không đúng!");
                request.getRequestDispatcher("changepass.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            out.println("Lỗi SQL: " + e.getMessage());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println("Lỗi khi đóng kết nối: " + e.getMessage());
                }
            }
        }
    }
}