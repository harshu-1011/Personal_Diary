<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | MyDiary</title>
    <script>  
        var request;  
        function sendInfo()  
        {  
        var a=document.getElementById("forMail").value;
        var b=document.getElementById("forSkey").value;  
        var url="forgotPass1.jsp?val1="+a+"&val2="+b;  
          
        if(window.XMLHttpRequest){  
        request=new XMLHttpRequest();  
        }  
        else if(window.ActiveXObject){  
        request=new ActiveXObject("Microsoft.XMLHTTP");  
        }  
          
        try  
        {  
        request.onreadystatechange=getInfo;  
        request.open("GET",url,true);  
        request.send();  
        }  
        catch(e)  
        {  
        alert("Unable to connect to server");  
        }  
        }  
          
        function getInfo(){  
        if(request.readyState==4){  
        var val=request.responseText;  
        document.getElementById('res').innerHTML=val;  
        }  
        }  
          
        </script>
</head>
<body>
    <center>
        
        <h2>Follow Up With Following Credentials - </h2>
        <label>Enter Email : </label>
        <input type="email" name="forMail" id="forMail"><br>
        <label>Enter Security Key : </label>
        <input type="text" name="forSkey" id="forSkey"><br><br>
        <button onclick="sendInfo()"> Get Password </button><br><br>
        <div id="res"></div>
    </center>
</body>
</html>