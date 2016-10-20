<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" />
	<title>Login</title>
	<link href="./bootstrap.css" rel="stylesheet" />
	<link href="./app.css" rel="stylesheet" />
</head>
<body>
<div class="form-container">
    <h2>Login</h2>
    <form method="post" onsubmit="logincheck()">
        <div class="form-group">
            <label for="soeid">SOE ID</label>
            <input type="text" name="soeid" id="soeid" class="form-control" required/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Login</button>
            <a href="./register.jsp" class="btn btn-primary">Register</a>
        </div>
    </form>
</div>
<script>
function logincheck() {
	var soeid = document.getElementById("soeid").value;
	var pwd = document.getElementById("password").value;
	var password = localStorage.pwd;
	var soeid_actual = localStorage.soeid; 

	if(password == pwd && soeid == soeid_actual){
		sessionStorage.session = true;
		window.close();
		window.open("./home.jsp");
	} else {
		alert("Enter Correct Details");
	}
};
</script>
</body>
</html>
