<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Jira</title>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/app.css" rel="stylesheet" />
<script src="js/htmlshiv.js"></script>
<script src="js/respond.js"></script>
<script src="js/jquery/jquery.js"></script>
</head>
<body>
	<div class="col-md-8" align="center">
		<h2> Contribute your Project</h2><br />
		<form method="post" onsubmit="addjira()">
			<input class="form-control" type="text" id="jira"
				placeholder="JIRA" required><br /><br />
			<button class="btn btn-primary" type="submit">Add Jira</button>
		</form>
	</div>
	<script>
		function addjira() {
			var jiras_temp = JSON.parse(localStorage.jiras_temp);
			alert("entered");
			var jira = document.getElementById("jira").value;
			alert(jira);
			jiras_temp.push(jira);
			localStorage.jiras_temp = JSON.stringify(jiras_temp);
			alert("JIRA Added Successfully");
			window.close();
			window.open("./viewjira.jsp");
		};
	</script>
</body>
</html>