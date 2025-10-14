<%-- 
    Document   : delete.jsp
    Created on : 22 Sept 2025, 11:50:48 pm
    Author     : Nitin Mehra
--%>
<%--
<%@page import="db.DBConnector"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            String email = (String)session.getAttribute("email");
            
            String query = "Delete From userRegisteration Where email='"+email+"'";
            
            Connection con = DBConnector.getConnection();
            Statement st = con.createStatement();
            st.executeQuery(query);
            session.invalidate();
            
            response.sendRedirect("login.jsp");
        
        %>
    </body>
</html>
--%>
<%@ page import="db.DBConnector" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Account</title>
</head>
<body>
    <%
        String email = (String) session.getAttribute("email");

        if (email != null) {
            try {
                Connection con = DBConnector.getConnection();
                String query = "DELETE FROM userRegisteration WHERE email = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, email);

                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    session.invalidate(); // Logout user
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("<p style='color:red;'>Account not found or already deleted.</p>");
                }

                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
