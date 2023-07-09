<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%
    String user=request.getParameter("user");
    String pass=request.getParameter("pass");
    
    try
    {
             Class.forName("com.mysql.jdbc.Driver");    
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

            Statement stmt=conn.createStatement();

            ResultSet rs=stmt.executeQuery("SELECT * FROM user;");
            int flag=0;
            while(rs.next())  {
                if(user.equals(rs.getString("email")))
                {
                    if(pass.equals(rs.getString("password")))
                    {
                        flag=1;
                        session.setAttribute("email",rs.getString("email"));
                        session.setAttribute("pass",rs.getString("password"));
                    }
                }      
            }            
            if(flag==1)
            {
                response.sendRedirect("block.html");
             }
            else
            {
                out.print("<h2>Oooopsss....Something Went Wrong...!!! </h2>");
                out.println("<br>Enter Valid UserName and Password, Try Again With Proper Details...!!");
            }          
			
			}
                catch(Exception e)
                {
                        out.print(e);
                        e.printStackTrace();
                                                                                                      }
                             %>