<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Your File</title>
    <link rel="stylesheet" href="fileupload1.css">
    <link src="fileupload.js">
    
    <script src="https://kit.fontawesome.com/f7b191fa8f.js" crossorigin="anonymous"></script>
</head>
<body background="upload.jpg" style="background-repeat: no-repeat; width: 100%; height: 100%; background-size: cover;">
	<p class="navv">
      <a href="block.html"><i class="fa-sharp fa-solid fa-arrow-left fa-2xl" style="color: white;"></i></a>   
    </p>
	
    <div class="main">
        <form action="fileupload11.jsp" method="get" enctype="multipart/form-data">
        <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
    
        <div><h6 style="color: rgb(18, 44, 18); justify-content: center; padding-left: 70px; font-size: 20px;"><b>Upload Documents</b></h6></div>
        <input type="file" name="file" id="file" required style="justify-content: center; padding-left: 70px; font-size: 15px;">
        <br><br>
        <input type="submit" name="Submit" class="class1">        
        </form>
    </div>
      
        <div class="icons">
          <div style='color:black;'>
          <a href="#"><i class="fa-solid fa-user fa-2xl" style="color: white;"></i></a>
          <%
          out.print("USER : "+session.getAttribute("email").toString()+"</div>");
          %>
        </div>

</body>
</html>