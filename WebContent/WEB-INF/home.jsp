<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<h2>Welcome <script>document.write(localStorage.name);</script></h2>
<script src="js/jquery/jquery.js"></script>
<script>
$(document).ready(function() {
	if(!(sessionStorage.session == JSON.stringify(true))){
    	alert("Login to Access the website");
		//window.location.href = "./login.jsp";
		window.close();
		window.open("./login.jsp");
    }
});
</script>
</body>
</html>