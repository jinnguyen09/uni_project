package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.PrintWriter;
import model.connectDB;
import java.io.File;

@WebServlet("/Property_posting")
@MultipartConfig
public class Property_posting extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        float area = Float.parseFloat(request.getParameter("area"));
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        int phone = Integer.parseInt(request.getParameter("phone"));
        Part image = request.getPart("image");
        String utilities = request.getParameter("utilities");
        int approve = Integer.parseInt(request.getParameter("approve"));
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String targetDir = getServletContext().getRealPath("/image/");
        File targetDirFile = new File(targetDir);
        
        if (!targetDirFile.exists()) {
            targetDirFile.mkdirs();
        }

        // Lưu hình ảnh
        String fileName = image.getSubmittedFileName(); // Lấy tên tệp
        String targetFile = targetDir + File.separator + fileName; // Tạo đường dẫn đầy đủ

        image.write(targetFile); // Lưu hình ảnh

        // Chỉ lưu tên tệp vào cơ sở dữ liệu
        String relativePath = "image/" + fileName;
        
        try {
            Connection conn = connectDB.getConnection();
            Statement stmt = conn.createStatement();
    
            String sql = "INSERT INTO property (name, price, area, address, description, phone, images, utilities, approve) VALUES ('" + name + "', " + price + ", " + area + ", '" + address + "', '" + description + "', " + phone + ", '" + relativePath + "', '" + utilities + "', " + approve + ")";
            
            if (stmt.executeUpdate(sql) > 0) {
                response.sendRedirect("home.jsp");
            } else {
                out.println("Thêm bất động sản thất bại!");
            }
        } catch (SQLException e) {
            out.println("Lỗi: " + e.getMessage());
        }
    }
}