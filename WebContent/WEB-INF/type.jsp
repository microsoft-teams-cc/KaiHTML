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
<div class="row">
		<form id="search" class="form-inline">
			<div class="form-group">
				&emsp;&emsp;&emsp;
				<label class="sr-only">Search</label> <input type="text"
					class="form-control" id="keyword" placeholder="Keyword">
				<button type="submit" class="btn btn-default">Search Kai</button>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;
				<a href="./home.jsp" class="btn btn-primary">Your Dashboard</a>
			</div>
		</form>
	</div>
	<br />
	<div>
		<table id="projectsTable" class="table table-bordered">
			<thead>
				<tr>
					<th>Project</th>
					<th>Description</th>
					<th>Explore</th>
				</tr>
			</thead>
			<tbody id="projectsBody">
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(
				function () {
					
					var parameters = location.search.substring(1).split("&");
					var temp = parameters[0].split("=");
					var type = temp[1];
					var types = JSON.parse(localStorage.types);
					fillProjects(type,types);
				});
		
		function fillProjects(type,types) {
			var projects = JSON.parse(localStorage.projects);
			var projectTypes = JSON.parse(localStorage.projectTypes);
			var descriptions = JSON.parse(localStorage.descriptions); 
			var statuses = JSON.parse(localStorage.statuses); 
			$("#projectsBody").empty();
			$.each(projectTypes,function(i, type_i) {
				if(type_i.replace(/\s/g, "") == type && statuses[i] == "Approved"){
					var rowclass = "info";
					var project = projects[i];
				    var projectLink = '<a href="project.jsp?project=' + project.replace(/\s/g, "") + '" class="btn btn-primary""> Explore </a>';
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