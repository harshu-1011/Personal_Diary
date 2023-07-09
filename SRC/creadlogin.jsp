<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
int i = 0;
  String title = request.getParameter("title");
  String user = request.getParameter("user");
  String pass = request.getParameter("pass");

  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

    //Encrypt
    //for UserName
    char[] user1 = user.toCharArray();
    String finalUser="";
    for(i=0;i<(user.length());i++)
    {
        int a = (int)user1[i];
        int b = a+3;
        char c = (char)b;
        finalUser+=Character.toString(c);
    }
    //for Password
    char[] pass1 = pass.toCharArray();
    String finalPass="";
    for(i=0;i<(pass.length());i++)
    {
        int a = (int)pass1[i];
        int b = a+3;
        char c = (char)b;
        finalPass+=Character.toString(c);
    }
   

    //Decrypt
    //for UserName
    char[] dUser1 = finalUser.toCharArray();
    String dFinalUser="";
    for(i=0;i<(finalUser.length());i++)
    {
        int a = (int)dUser1[i];
        int b = a-3;
        char c = (char)b;
        dFinalUser+=Character.toString(c);
    }
    //for Pass
    char[] dpass1 = finalPass.toCharArray();
    String dFinalPass="";
    for(i=0;i<(finalPass.length());i++)
    {
        int a = (int)dpass1[i];
        int b = a-3;
        char c = (char)b;
        dFinalPass+=Character.toString(c);
    }
    
    PreparedStatement statement = conn.prepareStatement("INSERT INTO credlogin VALUES (?, ?, ?,?)");
    statement.setString(1, title);
    statement.setString(2, finalUser);
    statement.setString(3, finalPass);
    String email = (session.getAttribute("email")).toString();
    statement.setString(4, email);
    statement.executeUpdate();

    response.sendRedirect("Thanks.html");

  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
  }
%>
<!-- PreparedStatement statement = conn.prepareStatement("INSERT INTO pdfs (file_name, file_content) VALUES (?, ?)");
    statement.setString(1, fileName);
    statement.setBlob(2, fileContent);
    statement.executeUpdate(); -->