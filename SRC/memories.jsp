<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%    try
    {
        int i =0,cnt=1;
             Class.forName("com.mysql.jdbc.Driver");    
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root", "");

            Statement stmt=conn.createStatement();
            String mail=(session.getAttribute("email")).toString();
            ResultSet rs=stmt.executeQuery("SELECT * FROM credlogin Where email='"+mail+"';");
            
            out.println("<h2>Your Credentials - </h2>");
            while(rs.next())  {
                out.print("<br><b>"+cnt+".</b>  ");
            out.print(" TITLE : <b>"+rs.getString("ltitle")+"</b>");
               //Decrypt
                //for UserName
                String finalUser = rs.getString("luser");
                char[] dUser1 = finalUser.toCharArray();
                String dFinalUser="";
                for(i=0;i<(finalUser.length());i++)
                {
                    int a = (int)dUser1[i];
                    int b = a-3;
                    char c = (char)b;
                    dFinalUser+=Character.toString(c);
                }
                out.print("<br>USERNAME : <b>"+dFinalUser+"</b>");
                //for Pass
                String finalPass = rs.getString("lpass");
                char[] dpass1 = finalPass.toCharArray();
                String dFinalPass="";
                for(i=0;i<(finalPass.length());i++)
                {
                    int a = (int)dpass1[i];
                    int b = a-3;
                    char c = (char)b;
                    dFinalPass+=Character.toString(c);
                }      
                out.print("<br>PASSWORD : <b>"+dFinalPass+"</b><br>");
                cnt++;
            }                         
    }catch(Exception e) {   out.print(e); e.printStackTrace();        } %>          