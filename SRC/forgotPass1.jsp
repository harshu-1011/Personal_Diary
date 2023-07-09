<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%
    //String email = "harshu@gmail.com";
    //String Skey="Sheru1";
    String email = (request.getParameter("val1"));
    String Skey = (request.getParameter("val2"));
    int flag = 0;
    String Pass = "";
    try{
             Class.forName("com.mysql.jdbc.Driver");    
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("SELECT * FROM user");

            while(rs.next())  {
                if((email.equals(rs.getString("email")))&&(Skey.equals(rs.getString("scr_key"))))
                {
                    flag = 1;
                    Pass += rs.getString("password");
                }              
            }       
            if(flag == 0)
            {
                out.println("<b>Invalid Data...!!</b>");
            }                  
            else{
                out.println("<b>Your PassWord : "+Pass+"</b>");
            }
    }catch(Exception e) {   out.print(e); e.printStackTrace();        } %>          