package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/Register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phonenumber = request.getParameter("phonenumber");
        String rememberMe = request.getParameter("rememberMe");
        
        String url = "jdbc:sqlserver://localhost:1433;databaseName=connection_java;encrypt=true;trustServerCertificate=true";
        
        PrintWriter out = response.getWriter();
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, "sa", "290904");
            
            String sql = "select username from Logins where username = ?";
            PreparedStatement checkpreparedStatement = conn.prepareStatement(sql);
            checkpreparedStatement.setString(1, username);
            ResultSet rs = checkpreparedStatement.executeQuery();
            
            if(rs.next()){
                request.setAttribute("errorMessage", "Người dùng đã tồn tại!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            String sql1 = "insert into Logins(username, password, phonenumber) values (?, ?, ?)";
            
            PreparedStatement insertpreparedStatement = conn.prepareStatement(sql1);
            insertpreparedStatement.setString(1, username);
            insertpreparedStatement.setString(2, password);
            insertpreparedStatement.setString(3, phonenumber);

            int rows = insertpreparedStatement.executeUpdate();
            
            if(rows > 0){
                response.sendRedirect("login.jsp");
            }
            
            else{
                request.setAttribute("errorMessage" ,"Đăng ký thất bại!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            
            checkpreparedStatement.close();
            insertpreparedStatement.close();
            conn.close();
        }
        
        catch(SQLException e){
            out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if("on".equals(rememberMe)){
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(30 * 24 * 60 * 60);
            
            response.addCookie(cookie);
        }
    }
}
