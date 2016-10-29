<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" />
	<title>Login</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/app.css" rel="stylesheet" />
	<script src="js/htmlshiv.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/jquery/jquery.js"></script>
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
	var users = JSON.parse(localStorage.users);
	var passwords = JSON.parse(localStorage.passwords);
	var soeids = JSON.parse(localStorage.soeids);
	var password_i = null;
	var user_i = null;
	
	$.each(soeids,function(i, soeid_i) {
		if(soeid_i == soeid){
			password_i = passwords[i];
			user_i = users[i];
		}
	});

	if(password_i == pwd){
		sessionStorage.session = true;
		sessionStorage.user = user_i;
		sessionStorage.soeid = soeid;
		window.close();
		window.open("./home.jsp");
	} else {
		alert("Enter Correct Details");
	}
};
</script>
</body>
</html>
