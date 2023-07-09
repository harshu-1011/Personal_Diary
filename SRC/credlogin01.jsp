<!-- We have to remove the moving effect -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="credlogin.css">
</head>
<body background="wood1.png" style="background-repeat: no-repeat; width: 100%; height: 100%; background-size: cover;">
    <div class="icons">
        <h2 class="class1">Keep your passwords safe here!!</h2>
        <div style='color:black;margin-left: 70%;font-size: 20px;height: 35px; padding: 12px; width:400px;background-color:rgb(221, 153, 70);margin-top: 10px;'>
          <a href="#"><i class="fa-solid fa-user fa-2xl" style="color: white;"></i></a>
          <%
          out.print("USER : "+session.getAttribute("email").toString()+"</div>");
          %>
      </div>

        
    <div class="login-box">
        <h2>Username and Password</h2>
        <form action="creadlogin.jsp">
            <div class="user-box">
                <input type="text" name="title" required="">
                <label>Title</label>
            </div>

            <div class="user-box">
                <input type="text" name="user" required="">
                <label>Username</label>
            </div>
    
            <div class="user-box">
                <input type="password" name="pass" required="">
                <label>Password</label>
            </div>
    
            <a href="#">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <button>Submit</button>
            </a>
    
        </form>
    
    </div>
    <script src="https://kit.fontawesome.com/f7b191fa8f.js" crossorigin="anonymous"></script>
</body>
</html>
