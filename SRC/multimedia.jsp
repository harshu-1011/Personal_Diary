<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Your File</title>
    <link rel="stylesheet" href="multimedia.css">
    <link src="multimedia.js">
    
</head>
<body background="multimedia22.png" style="background-repeat: no-repeat; width: 100%; height: 100%; background-size: cover;">
    <p class="navv">
      <a href="block.html"><i class="fa-sharp fa-solid fa-arrow-left fa-2xl" style="color: white;"></i></a>   
    </p>
    
    <div class="main">
        
        <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
    
        <div><h6 style="color: rgb(78, 252, 3); padding-left: 70px; font-size: 30px;"><b style="font-family:Algerian;">Upload your audio and video here!!</b></h6></div>
        <input id="fileb" type="file" style="justify-content: center; padding-left: 70px; font-size: 15px; color: white;">
        
    </div>
      
        <div class="icons">
          <div style='color:white;'>
            <a href="#"><i class="fa-solid fa-user fa-2xl" style="color: white;"></i></a>
            <%
            out.print("USER : "+session.getAttribute("email").toString()+"</div>");
            %>
        </div>

      <script src="https://kit.fontawesome.com/f7b191fa8f.js" crossorigin="anonymous"></script>
</body>
</html>