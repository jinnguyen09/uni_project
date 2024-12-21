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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=connection_java;encrypt=true;trustServerCertificate=true";
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url, "sa", "290904");
            
            String sql = "select * from Logins where username = ? and password = ?";
            
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            if(rs.next()){
                int id = rs.getInt("id");
                int role = rs.getInt("role");
                
                session.setAttribute("id", id);
                session.setAttribute("username", username);
                request.setAttribute("role", role);
                
                if(role != 1){
                    response.sendRedirect("home.jsp");
                }
                
                else{
                    response.sendRedirect("admin.jsp");
                }
            }
            
            else {
            // Đăng nhập thất bại
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
            rs.close();
            preparedStatement.close();
            conn.close();
        }
        
        catch(SQLException e){
            out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //dung cookie de nho tai khoan trong vong 30 ngay
        if("on".equals(rememberMe)){
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(30 * 24 * 60 * 60);
            
            response.addCookie(cookie);
        }
    }
}