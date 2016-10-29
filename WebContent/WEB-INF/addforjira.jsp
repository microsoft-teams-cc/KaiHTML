<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Project for Jira</title>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/app.css" rel="stylesheet" />
<script src="js/htmlshiv.js"></script>
<script src="js/respond.js"></script>
<script src="js/jquery/jquery.js"></script>
</head>
<body>
	<div class="col-md-8" align="center">
		<h2> Contribute your Project</h2><br />
		<form method="post" onsubmit="addProject()">
			<input class="form-control" type="text" id="name"
				placeholder="Project Name" required><br />
			<br /> <input class="form-control" type="text" id="desc"
				placeholder="Description" required><br />
			<br /> <select class="form-control" id="type">
				<option value="Server End Code">Server End Code</option>
				<option value="Database Helpers">Database Helpers</option>
				<option value="Bootstraps">Bootstraps</option>
				<option value="MVC Providers">MVC Providers</option>
				<option value="Testing Frameworks">Testing Frameworks</option>
				<option value="Dashboard Helpers">Dashboard Helpers</option>
			</select> <br />
			<br /> <input class="form-control" type="text" id="link"
				placeholder="Enter the github URI of local file location" required><br />
			<br />
			<button class="btn btn-primary" type="submit" >Add Project</button>
		</form>
	</div>
	<script>
		function addProject() {
			var project = (document.getElementById("name").value);
			var desc = (document.getElementById("desc").value);
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			var jira = temp[1];
			var type = (document.getElementById("type").value);
			var link = (document.getElementById("link").value);
			var link_temp = "github.com/" + (project).replace(/\s/g, "");
			var descriptions = JSON.parse(localStorage.descriptions);
			var projects = JSON.parse(localStorage.projects);
			var owners = JSON.parse(localStorage.owners);
			var jiras = JSON.parse(localStorage.jiras);
			var statuses = JSON.parse(localStorage.statuses);
			var links = JSON.parse(localStorage.links);
			var projectTypes = JSON.parse(localStorage.projectTypes);
			projects.push(project);
			descriptions.push(desc);
			jiras.push(jira);
			projectTypes.push(type);
			links.push(link_temp);
			statuses.push("Tobe Approved");
			owners.push(sessionStorage.user);
			localStorage.projects = JSON.stringify(projects);
			localStorage.owners = JSON.stringify(owners);
			localStorage.links = JSON.stringify(links);
			localStorage.jiras = JSON.stringify(jiras);
			localStorage.statuses = JSON.stringify(statuses);
			localStorage.projectTypes = JSON.stringify(projectTypes);
			localStorage.descriptions = JSON.stringify(descriptions);
			deletetempjira(jira);
			alert("Project Added Successfully");
			window.close();
			window.open("./checkStatus.jsp");
		};
		
		function deletetempjira(jira) {
			var jiras_temp = JSON.parse(localStorage.jiras_temp);
			$.each(jiras_temp,function(i, jira_i) {
				if(jira_i == jira){
					jiras_temp.splice(i,1);
				} 
			});
			localStorage.jiras_temp = JSON.stringify(jiras_temp);
		};
	</script>
</body>
</html>