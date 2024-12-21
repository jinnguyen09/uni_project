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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Forgot_Password")
public class Forgot_Password extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        
        String url = "jdbc:sqlserver://localhost:1433;databaseName=connection_java;encrypt=true;trustServerCertificate=true"; 
        PrintWriter out = response.getWriter();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, "sa", "290904");
            
            String sql = "select username from Logins where username = ?";
            
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, username);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("change_password.jsp");
            }
            
            else{
                request.setAttribute("errorMessage", "Không tìm thấy thông tin tài khoản!");
                request.getRequestDispatcher("forget_password.jsp").forward(request, response);
            }
            
            rs.close();
            preparedStatement.close();
            conn.close();
        }
        
        catch(SQLException e){
            out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Forgot_Password.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
