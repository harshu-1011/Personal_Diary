
<%@page import="java.sql.*" %>
<style>
b
{
color:white;
}
h1
{
color:red;
}
</style>
<h1 align=left>Add Products here</h1>
<div class="row" align=center>
<div class="col-sm-4"><center>


<form method=post action="demoFile.jsp" enctype="multipart/form-data" > 
                              <span></span>
                                  <div class="form-group">
                                    <input type="file" class="form-control py-1 px-5"  id="mimg" name="mimg" placeholder="Product Image " required="required" />
                                </div>
                                
                                <center>
                                   <button class="btn btn-primary py-md-3 px-md-5 mt-2" type="submit" id="btns" name="btns">Upload Image</button>
                               </center>
</form> 
                               
                               
<form id="frmreg" method ="POST" name="myForm">
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
<select name="type" class="form-control">
<option>--Select Type--</option>
<option value="Veg">Veg</option>
<option value="Non Veg">Non Veg</option>
</select>
</div>
<br>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
<select name="subtype" class="form-control">
<option>--Select Subtype--</option>
<option value="Starter">Starter</option>
<option value="Rice">Rice</option>
<option value="Noodles">Noodles</option>
</select>
</div>
<br>
<div class"input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
<input ng-model="contact" id="name" type="text" class="form-control" name="name" placeholder="Enter the name">
</div>
<br>
<div class"input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
<input ng-model="contact" id="hprice" type="text" class="form-control" name="hprice" placeholder="Half price" pattern="\d+" required>
</div>
<br>
<div class"input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
<input ng-model="contact" id="fprice" type="text" class="form-control" name="fprice" placeholder="Full price" pattern="\d+" required>
</div>
<br>

<button type="submit" class="btn btn-primary" id="btnsub1" name="btnsub1">submit</button>
<button type="reset" class="btn btn-danger" id="btnres">Reset</button>
</form></center>
</div>
</div>
</div>


<%
String mimg2=(String)session.getAttribute("filepath");
out.println("<b>"+mimg2+"</b>");
if(request.getParameter("btnsub1")!=null)
{
String type,subtype,name,fn,hprice,fprice,mimg;
type=request.getParameter("type");
subtype=request.getParameter("subtype");
name=request.getParameter("name");
hprice=request.getParameter("hprice");
fprice=request.getParameter("fprice");
mimg=(String)session.getAttribute("filepath");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/luckydb","root","");
	
PreparedStatement pst1=cn.prepareStatement("insert into product(type,subtype,name,image,fullprice,halfprice) values(?,?,?,?,?,?)");
pst1.setString(1,type);
pst1.setString(2,subtype);
pst1.setString(3,name);
pst1.setString(4,mimg2);
pst1.setString(5,fprice);
pst1.setString(6,hprice);
pst1.executeUpdate();
out.println("<script>alert('Added Successfully');window.location='mngproduct.jsp';</script>");
}


catch(Exception ex)
{
ex.printStackTrace();	
}
}
%>

