package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.connectDB;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Account")
public class Account extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        
        if (id == null) {
            request.setAttribute("errorMessage", "Vui lòng đăng nhập để tiếp tục");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        response.setContentType("text/html; charset=UTF-8");
        String username = request.getParameter("username");
        String phonenumber = request.getParameter("phonenumber");

        try{
            Connection conn = connectDB.getConnection();
            String query = "update logins set username= ?, phonenumber= ? where id= ?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, phonenumber);
                preparedStatement.setInt(3, id);
                    
                    int rows = preparedStatement.executeUpdate();
                    
                    if(rows > 0){
                        response.sendRedirect("account.jsp");
                    }
             else {
                request.setAttribute("errorMessage", "Cập nhật thất bại!");
                request.getRequestDispatcher("account.jsp").forward(request, response);
            }

            conn.close();
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Đã xảy ra lỗi: " + e.getMessage());
        }

        request.getRequestDispatcher("account.jsp").forward(request, response);
    }
}