<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
  String fname = request.getParameter("fname");
  String lname = request.getParameter("lname");
  String email = request.getParameter("email");
  String pass = request.getParameter("pass");
  String skey = request.getParameter("skey");
  
  session.setAttribute("email",email);
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

    PreparedStatement statement = conn.prepareStatement("INSERT INTO user VALUES (?, ?, ?,?,?)");
    statement.setString(1, fname);
    statement.setString(2, lname);
    statement.setString(3, email);
    statement.setString(4, pass);
    statement.setString(5, skey);
    statement.executeUpdate();
    
    response.sendRedirect("two.html");
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>