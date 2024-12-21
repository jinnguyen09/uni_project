<%-- 
    Document   : update_role
    Created on : Dec 18, 2024, 2:09:11 PM
    Author     : Admins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.connectDB" %>

<%
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    int role = Integer.parseInt(request.getParameter("role"));
    try{
        Connection conn = connectDB.getConnection();
        Statement stmt = conn.createStatement();
        String sql = "update logins set role = " + role + " where id = " + user_id;
        
        int rows = stmt.executeUpdate(sql);
        
        if(rows > 0){
           response.sendRedirect("admin.jsp");
        }
        
        else{
           request.setAttribute("errorMessage", "Cap nhat thong tin that bai!");
           request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
        
    } catch(SQLException e){
        out.println(e);
    }
    %>