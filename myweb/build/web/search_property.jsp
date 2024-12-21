<%-- 
    Document   : search_property
    Created on : Dec 12, 2024, 3:13:27 AM
    Author     : Admins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<%@ page import="java.sql.*, model.connectDB" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .room-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 320px;
            background-color: white;
            height: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .room-card img {
            width: 320px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }
        
        .container {
            display: flex;
            flex-wrap: wrap; 
            justify-content: center; 
            gap: 20px; /* Khoảng cách giữa các thẻ */
            padding: 20px;
        }
        </style>
    </head>
    <body>
        <%
            String search_property = request.getParameter("search_property");
            try{
            Connection conn = connectDB.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM property WHERE name LIKE '%" + search_property + "%' OR address LIKE '%" + search_property + "%' OR price LIKE '%" + search_property + "%' OR area LIKE '%" + search_property + "%'";
            ResultSet rs = stmt.executeQuery(sql);
            
            if(rs.next()){
               int id = rs.getInt("id");
                out.println("<div class='container'>");
                do {
                    out.println("<div class='room-card'>");
                    out.println("<a href='room_detail.jsp?id=" + rs.getInt("id") + "' style='display: block; text-decoration: none; color: inherit;'>");
                    out.println("<img src='" + rs.getString("images") + "' alt='Hình ảnh phòng'>");
                    out.println("<h3 style='font-size: 20px; margin: 0 0 10px 0; color: #333;'>" + rs.getString("name") + "</h3>");
                    out.println("<p style='font-size: 14px; margin: 0 0 5px 0; color: black;'>" + rs.getFloat("area") + " m²</p>");
                    out.println("<p style='font-size: 14px; margin: 0 0 5px 0; color: #555;'>" + rs.getString("address") + "</p>");
                    out.println("</a></div>");
                } while (rs.next());
                out.println("</div>");
            } else {
                out.println("<p style='text-align: center; font-size: 18px; color: #555;'>Không có phòng nào.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </body>
</html>
