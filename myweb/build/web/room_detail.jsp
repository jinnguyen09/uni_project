<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="menu.jsp" />
<%@ page import="java.sql.*, model.connectDB" %>

<!DOCTYPE html>
<html>
<body>    
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try{
            conn = connectDB.getConnection();  // lay ket noi tu model.connectDB
            stmt = conn.createStatement();
            String sql = "select * from property where id ='" + id + "'";
            rs = stmt.executeQuery(sql);
            
            if(rs.next()){
                out.println("<img src='" + rs.getString("images") + "' alt='Hình ảnh phòng' style='margin-left: 200px; margin-top: 30px; width: 600px; height: 400px; border-radius: 10px;>'");
                out.println("<h1 style='margin-left: 200px; margin-top: 30px;'>" + rs.getString("name") + "</h1>");
                out.println("<p style='font-size: 20px; margin: 0 0 5px 0; color: #555; margin-left: 200px; margin-top: 20px;'>" + rs.getString("address") + "</p>");
                out.println("<p style='font-size: 14px; margin: 0 0 5px 0; color: #555;'>" + rs.getString("address") + "</p>");
                out.println("<p style='font-size: 14px; margin: 0 0 5px 0; color: #555;'>" + rs.getFloat("area") + " m²</p>");
                out.println("<h4 style='font-size: 18px; color: #00E5B9; margin: 5px 0;'>" + String.format("%,.0f VNĐ", rs.getInt("price")) + "</h4>");
                out.println("<p style='font-size: 14px; color: #888;'>Trạng thái: " + rs.getInt("approve") + "</p>");
            } else {
                out.println("<p style='text-align: center; font-size: 18px; color: #555;'>Không có phòng nào.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
    

