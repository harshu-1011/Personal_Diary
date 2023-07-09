<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="com.servlet.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="bg-light">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Image Upload</p>

						<%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<h4 class="text-center text-success"><%=msg%></h4>
						<%
						session.removeAttribute("msg");
						}
						%>

						<form method="post" action="uploady.java" enctype="multipart/form-data">
							<div class="mb-3">
								<label>Image</label> <input type="file" name="files" class="form-control">
							</div>

							<div class="mb-3">
								<label>Remark</label> <input type="text" name="remark"
									class="form-control">
							</div>
							<div class="text-center">
								<button class="btn btn-primary">Upload</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>


		<table class="table mt-4">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Ramark</th>

				</tr>
			</thead>
			<tbody>

				<%
				Connection conn;
                Class.forName("com.mysql.cj.jdbc.Driver");
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/diary", "root","");

				PreparedStatement ps = conn.prepareStatement("select * from img_details");
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
				%>
				<tr>

					<%
					if (rs.getString("img_name").endsWith(".pdf")) {
					%>

					<th scope="row"><img alt="" src="imgs/pdf.png" width="200px"
						height="100px"></th>


					<%
					} else if (rs.getString("img_name").endsWith(".xlsx")) {
					%>

					<th scope="row"><img alt="" src="imgs/xls.jpg" width="200px"
						height="100px"></th>


					<%
					} else {
					%>
					<th scope="row"><img alt=""
						src="imgs/<%=rs.getString("img_name")%>" width="200px"
						height="100px"></th>
					<%
					}
					%>




					<td><%=rs.getString("remark")%></td>

				</tr>
				<%
				}
				%>



			</tbody>
		</table>



	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>