<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Home</title>
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/app.css" rel="stylesheet" />
<script src="js/htmlshiv.js"></script>
<script src="js/respond.js"></script>
<script src="js/jquery/jquery.js"></script>
</head>
<body>
	<div class="col-md-10">
		<table id="detailsTable" class="table table-bordered">
			<thead>
				<tr>
					<th>Attribute</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody id="detailsBody">
			</tbody>
		</table>
	</div>
	<div class="col-md-2">
		<div class="panel panel-info">
			<ul class="list-group">
				<li class="list-group-item">
					<form method="post" onsubmit="downloadProject()">
						<button type="submit" class="btn btn-link">Download
							Project File</button>
					</form>
				</li>
				<li class="list-group-item">
					<form method="post" onsubmit="copyurl()">
						<button type="submit" class="btn btn-link">Get git URI
						</button>
					</form>
				</li>
				<li class = "list-group-item">
					<form method="post" onsubmit="check('Approved')">
						<button type="submit" class="btn btn-link">Approve</button>
					</form>
				</li>
				<li class = "list-group-item">
					<form method="post" onsubmit="check('Rejected')">
						<button type="submit" class="btn btn-link">Reject</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			var project = temp[1];
			fillDetails(project);
		});
		
		function check(status){
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			var project = temp[1];
			var projects = JSON.parse(localStorage.projects);
			var statuses = JSON.parse(localStorage.statuses);
			$.each(projects, function(i, project_i) {
				if(project_i.replace(/\s/g, "") == project){
					statuses[i] = status;
				}
				localStorage.statuses = JSON.stringify(statuses);
			});
			window.close();
			window.open("./gov.jsp");
		};

		function downloadProject() {
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			var project = temp[1];
			var projects = JSON.parse(localStorage.projects);
			var statuses = JSON.parse(localStorage.statuses);
			$.each(projects, function(i, project_i) {
				if(project_i.replace(/\s/g, "") == project){
					if(!(statuses[i] == "Approved")){
						alert("Project is not yet Approved. Cannot Download");
					} else {
						alert("File downloaded Successfully");
					}
				}
			});
		};

		function copyurl() {
			alert("git URI coiped to the clipboard");
		};

		function fillDetails(project) {
			var descriptions = JSON.parse(localStorage.descriptions);
			var projects = JSON.parse(localStorage.projects);
			var owners = JSON.parse(localStorage.owners);
			var jiras = JSON.parse(localStorage.jiras);
			var statuses = JSON.parse(localStorage.statuses);
			var links = JSON.parse(localStorage.links);
			var projectTypes = JSON.parse(localStorage.projectTypes);
			$.each(projects, function(i, project_i) {
				if(project_i.replace(/\s/g, "") == project){
					var rowclass = "info";
					var row = '<tr class="' + rowclass + '"> <td>Name</td>' + '<td>'+ project.toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>Description</td>' + '<td>'+ descriptions[i].toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>Owner</td>' + '<td>'+ owners[i].toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>JIRA</td>' + '<td>'+ jiras[i].toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>Type</td>' + '<td>'+ projectTypes[i].toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>Status</td>' + '<td>'+ statuses[i].toLocaleString() + '</td> </tr>'
							+'<tr class="' + rowclass + '"> <td>Github URI</td>' + '<td>'+ links[i].toLocaleString() + '</td> </tr>'
					$("#detailsBody").append(row);
				}
			});
		};
	</script>
</body>
</html>