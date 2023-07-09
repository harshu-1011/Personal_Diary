<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
  //String name = request.getParameter("name");
  String name = "demo.txt";
  //String description = request.getParameter("description");
  String description = "File Regarding Testing";
  InputStream fileContent = request.getPart("file").getInputStream();

  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

    PreparedStatement statement = conn.prepareStatement("INSERT INTO documents (name, description, file_content) VALUES (?, ?, ?)");
    statement.setString(1, name);
    statement.setString(2, description);
    statement.setBlob(3, fileContent);
    statement.executeUpdate();
    
    out.println("File uploaded successfully.");
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>