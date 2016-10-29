<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<meta charset="ISO-8859-1" />
<title>Unapproved Projects</title>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/app.css" rel="stylesheet" />
<script src="js/htmlshiv.js"></script>
<script src="js/respond.js"></script>
<script src="js/jquery/jquery.js"></script>
</head>
<body>
	<div class="col-md-10" align="center">
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
	<script>
		$(document).ready(function() {
			if (!(sessionStorage.session == JSON.stringify(true))) {
				window.close();
				window.open("./login.jsp");
			}
			fillProjects(sessionStorage.user);
		});
		
		function fillProjects(user){
			var projects = JSON.parse(localStorage.projects);
			var owners = JSON.parse(localStorage.owners);
			var descriptions = JSON.parse(localStorage.descriptions);
			var statuses = JSON.parse(localStorage.statuses); 
			var user = sessionStorage.user;
			var enter = false;
			$("#projectsBody").empty();
			$.each(statuses,function(i, status) {
				if((!(statuses == "Approved")) && owners[i] == user){
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
				alert("You have no projects yet to be approved");
			}
		};
	</script>
</body>
</html>