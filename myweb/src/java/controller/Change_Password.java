package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Change_Password")
public class Change_Password extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        String url = "jdbc:sqlserver://localhost:1433;databaseName=connection_java;encrypt=true;trustServerCertificate=true";
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, "sa", "290904");

            if (password.equals(repassword)) {
                String sql = "UPDATE Logins SET password = ? WHERE username = ?";
                
                PreparedStatement preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, password);
                preparedStatement.setString(2, username);
                    
                    int rows = preparedStatement.executeUpdate();
                    
                    if(rows > 0){
                        response.sendRedirect("login.jsp");
                    }
                }
             else {
                // Mật khẩu nhập lại không đúng
                request.setAttribute("errorMessage", "Nhập lại mật khẩu không đúng!");
                request.getRequestDispatcher("change_password.jsp").forward(request, response);
            }

            conn.close();
        } catch (SQLException e) {
            out.println("Lỗi SQL: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Change_Password.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}