<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Register</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/app.css" rel="stylesheet" />
	<script src="js/htmlshiv.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/jquery/jquery.js"></script>
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
            <label for="soeid">SOE ID</label>
            <input type="text" name="soeid" id="soeid" class="form-control" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" required />
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Register</button>
            <a href="./login.jsp" class="btn btn-primary">Cancel</a>
        </div>
	</form>
</div>
<script>
function register() {
	var soeid = document.getElementById("soeid").value;
	var pwd = document.getElementById("password").value;
	var name = document.getElementById("firstName").value;
	var users = JSON.parse(localStorage.users);
	var passwords = JSON.parse(localStorage.passwords);
	var soeids = JSON.parse(localStorage.soeids);
	users.push(name);
	passwords.push(pwd);
	soeids.push(soeid);
	localStorage.users = JSON.stringify(users);
	localStorage.soeids = JSON.stringify(soeids);
	localStorage.passwords = JSON.stringify(passwords);
	alert("Registartion Successful");
	window.close();
	window.open("./login.jsp");
};
</script>
</body>
</html>