<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="./bootstrap.css" rel="stylesheet" />
<link href="./app.css" rel="stylesheet" />
</head>
<body>
	<div class="form-container" onsubmit="register()">
    <h2>Register</h2>
    <form method="post">
        <div class="form-group">
            <label for="firstName">First name</label>
            <input type="text" name="firstName" id="firstName" class="form-control"  required />
        </div>
        <div class="form-group">
            <label for="lastName">Last name</label>
            <input type="text" name="lastName" id="lastName" class="form-control" required />
        </div>
        <div class="form-group">
            <label for="soeid">SOE ID</label>
            <input type="text" name="soeid" id="soeid" class="form-control" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" required />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Register</button>
            <a href="./login.jsp" class="btn btn-primary">Cancel</a></div>
	</form>
</div>
<script>
function register() {
	var soeid = document.getElementById("soeid").value;
	var pwd = document.getElementById("password").value;
	var name = document.getElementById("firstName").value;
	localStorage.soeid = soeid;
	localStorage.pwd = pwd;
	localStorage.name = name;
	alert("Registartion Successful");
	window.close();
	window.open("./login.jsp");
};
</script>
</body>
</html>