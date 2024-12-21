<%-- 
    Document   : delete_user
    Created on : Dec 18, 2024, 2:38:07 PM
    Author     : Admins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectDB" %>

<%
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    try{
        Connection conn = connectDB.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "delete from logins where id = " + user_id;
        int rows = stmt.executeUpdate(sql);
        
        if(rows > 0){
            //xoa thanh cong
            response.sendRedirect("admin.jsp");
        }
        
        else{
            request.setAttribute("errorMessage", "Xoa nguoi dung that bai!");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    } catch(SQLException e){
        out.println(e);
    }
    %>
