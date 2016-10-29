<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Projects</title>
	<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/app.css" rel="stylesheet" />
	<script src="js/htmlshiv.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/jquery/jquery.js"></script>
</head>
<body>
<div class="col-md-10" align = "center">
	<div>
		<table id="projectsTable" class="table table-bordered">
			<thead>
				<tr>
					<th>Project</th>
					<th>Description</th>
					<th>Check</th>
				</tr>
			</thead>
			<tbody id="projectsBody">
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(
				function () {
					fillProjects();
				});
		
		function fillProjects() {
			var projects = JSON.parse(localStorage.projects);
			var projectTypes = JSON.parse(localStorage.projectTypes);
			var descriptions = JSON.parse(localStorage.descriptions); 
			var statuses = JSON.parse(localStorage.statuses); 
			$("#projectsBody").empty();
			$.each(projects,function(i, project) {
				if(statuses[i] == "Tobe Approved"){
					var rowclass = "info";
				    var projectLink = '<a href="check.jsp?project=' + project.replace(/\s/g, "") + '" class="btn btn-primary""> Check </a>';
					var row = '<tr class="' + rowclass + '">'
										+ '<td>'
										+ project.toLocaleString()
										+ '</td>'
										+ '<td>'
										+ descriptions[i].toLocaleString()
										+ '</td>'
										+'<td>'
										+ projectLink
										+'</td>'
										+ '</tr>';
								$("#projectsBody").append(row);  
							}
			});
		};
		
	</script>
</body>
</html>