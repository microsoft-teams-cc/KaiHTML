<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<meta charset="ISO-8859-1" />
<title>View JIRAs</title>
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
						<th>JIRA</th>
						<th>Upload Project for this JIRA</th>
					</tr>
				</thead>
				<tbody id="projectsBody">
				</tbody>
			</table>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			fillJiras();
		});
		
		function fillJiras(){
			var jiras_temp = JSON.parse(localStorage.jiras_temp);
			var enter = false;
			$("#projectsBody").empty();
			$.each(jiras_temp,function(i, jira) {
				var rowclass = "info";
				enter = true;
				var jiraLink = '<a href="addforjira.jsp?jira=' + jira.replace(/\s/g, "") + '" class="btn btn-primary""> Add </a>';
				var row = '<tr class="' + rowclass + '">'
									+ '<td>'
									+ jira.toLocaleString()
									+ '</td>'
									+'<td>'
									+ jiraLink
									+'</td>'
									+ '</tr>';
				$("#projectsBody").append(row);
			});
			if(enter == false){
				alert("No unresolved Jiras present. Happy Day!!");
			}
		};
	</script>
</body>
</html>