<% package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploady")
@MultipartConfig
public class UploadFile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Part p = req.getPart("files");
		String fileName = p.getSubmittedFileName();

		String remark = req.getParameter("remark");

		HttpSession session = req.getSession();

		try {

			Connection conn = DbConnect.getConn();

			PreparedStatement ps = conn.prepareStatement("insert into img_details(img_name,remark) values(?,?)");
			ps.setString(1, fileName);
			ps.setString(2, remark);

			int i = ps.executeUpdate();

			if (i == 1) {

				String path = getServletContext().getRealPath("") + "imgs";

				File file = new File(path);

				p.write(path + File.separator + fileName);

				session.setAttribute("msg", "Upload Sucess");

				resp.sendRedirect("index.jsp");

			} else {
				System.out.println("Error in server");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}%>