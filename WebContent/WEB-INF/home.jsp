<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<meta charset="ISO-8859-1" />
<title>Login</title>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/app.css" rel="stylesheet" />
<script src="js/htmlshiv.js"></script>
<script src="js/respond.js"></script>
<script src="js/jquery/jquery.js"></script>
</head>
<body>
	<h2>
		&emsp;Welcome
		<script>
			document.write(sessionStorage.soeid);
		</script>
	</h2>
	<div class="row">
			<form id="search" class="form-inline" onsubmit="search()">
				<div class="form-group">
					&emsp;&emsp; 
					<label class="sr-only">Search</label> <input 
					type="text" class="form-control" id="keyword" placeholder="Keyword">
					<button type="submit" class="btn btn-default">Search Kai</button>
				</div>
			</form>
		</div>
		<br />
	<div class="col-md-10">
		<div>
			<table id="projectsTable" class="table table-bordered">
				<thead>
					<tr>
						<th>Project</th>
						<th>Description</th>
						<th>Open</th>
					</tr>
				</thead>
				<tbody id="projectsBody">
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-2">
		<div class="panel panel-info">
			<ul class="list-group">
				<li class="list-group-item"><a href="./addjira.jsp">Add JIRA</a></li>
				<li class="list-group-item"><a href="./viewjira.jsp">View JIRAs</a></li>
				<li class="list-group-item"><a href="./addproject.jsp">Upload a new Project</a></li>
				<li class="list-group-item"><a href="./checkStatus.jsp">Uploaded Projects Status</a></li>
			</ul>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			if (!(sessionStorage.session == JSON.stringify(true))) {
				window.close();
				window.open("./login.jsp");
			}
			fillProjects();
		});
		
		function fillProjects(){
			var projects = JSON.parse(localStorage.projects);
			var owners = JSON.parse(localStorage.owners);
			var descriptions = JSON.parse(localStorage.descriptions);
			var statuses = JSON.parse(localStorage.statuses); 
			var user = sessionStorage.user;
			var enter = false;
			$("#projectsBody").empty();
			$.each(owners,function(i, owner) {
				if(owner == user && statuses[i] == "Approved"){
					enter = true;
					var rowclass = "info";
					var project = projects[i];
				    var projectLink = '<a href="project.jsp?project=' + project.replace(/\s/g, "") + '" class="btn btn-primary""> Open </a>';
					var row = '<tr class="' + rowclass + '">'
										+ '<td>'
										+ project.toLocaleString()
										+ '</td>'
										+'<td>'
										+ descriptions[i].toLocaleString()
										+'</td>'
										+'<td>'
										+ projectLink
										+'</td>'
										+ '</tr>';
					$("#projectsBody").append(row);  
				}
			});
			if(enter == false){
				alert("You have no approved projects yet yo display");
			}
		};
		
		function search() {
			var keyword = document.getElementById("keyword").value;
			window.close();
			window.open("./search.jsp?keyword=" + keyword);
		};
	</script>
</body>
</html>