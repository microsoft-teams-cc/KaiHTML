<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kai</title>
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
		<table id="typesTable" class="table table-bordered">
			<thead>
				<tr>
					<th>Type</th>
					<th>Explore</th>
				</tr>
			</thead>
			<tbody id="typesBody">
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(
				function() {
					var sessionState = sessionStorage.session;
					var init = localStorage.init;
					if (!(init == "true")) {
						alert("Initialising");
						var projects = [ "AT Pricing", "Mongo-Nodejs", "3.3.1",
								"Struts Helper", "Cucumber Framework",
								"Trade Logs", "AT Pricing", "Mongo-Nodejs",
								"3.3.1", "Struts Helper", "Cucumber Framework",
								"Trade Logs", "AT Pricing", "Mongo-Nodejs",
								"3.3.1", "Struts Helper", "Cucumber Framework",
								"Trade Logs" ];
						var owners = [ "sai", "sai", "sai", "sai", "sai",
								"sai", "mani", "mani", "mani", "mani", "mani",
								"mani", "teja", "teja", "teja", "teja", "teja",
								"teja" ];
						var links = [ "github.com/atpricing",
								"github.com/mongonodejs", "github.com/3.3.1",
								"github.com/strutshelper",
								"github.com/cucumberframework",
								"github.com/tradelogs", "github.com/atpricing",
								"github.com/mongonodejs", "github.com/3.3.1",
								"github.com/strutshelper",
								"github.com/cucumberframework",
								"github.com/tradelogs", "github.com/atpricing",
								"github.com/mongonodejs", "github.com/3.3.1",
								"github.com/strutshelper",
								"github.com/cucumberframework",
								"github.com/tradelogs" ];
						var jiras = [ "qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm" ];
						var descriptions = [ "qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm",
								"qwertyuiopasdfghjklzxcvbnm" ];
						var statuses = [ "Approved", "Tobe Approved",
								"Rejected", "Approved", "Tobe Approved",
								"Rejected", "Approved", "Tobe Approved",
								"Rejected", "Approved", "Tobe Approved",
								"Rejected", "Approved", "Tobe Approved",
								"Rejected", "Approved", "Tobe Approved",
								"Rejected" ];
						var projectTypes = [ "Server End Code",
								"Database Helpers", "Bootstraps",
								"MVC Providers", "Testing Frameworks",
								"Dashboard Helpers", "Server End Code",
								"Database Helpers", "Bootstraps",
								"MVC Providers", "Testing Frameworks",
								"Dashboard Helpers", "Server End Code",
								"Database Helpers", "Bootstraps",
								"MVC Providers", "Testing Frameworks",
								"Dashboard Helpers" ];
						var types = [ "Server End Code", "Database Helpers",
								"Bootstraps", "MVC Providers",
								"Testing Frameworks", "Dashboard Helpers" ];
						var users = [ "sai", "mani", "teja" ];
						var soeids = ["sn26232" , "bm64503" , "dk63507"];
						var passwords = [ "sai", "mani", "teja" ];
						var jiras_temp = ["fdh" , "hd", "fhds", "hd"];
						localStorage.projects = JSON.stringify(projects);
						localStorage.jiras_temp = JSON.stringify(jiras_temp);
						localStorage.owners = JSON.stringify(owners);
						localStorage.links = JSON.stringify(links);
						localStorage.jiras = JSON.stringify(jiras);
						localStorage.statuses = JSON.stringify(statuses);
						localStorage.types = JSON.stringify(types);
						localStorage.projectTypes = JSON.stringify(projectTypes);
						localStorage.users = JSON.stringify(users);
						localStorage.soeids = JSON.stringify(soeids);
						localStorage.passwords = JSON.stringify(passwords);
						localStorage.descriptions = JSON
								.stringify(descriptions);
						localStorage.init = true;
					}
					var types = JSON.parse(localStorage.types);
					fillTypes(types);
				});
		function fillTypes(types) {
			$("#typesBody").empty();
			$.each(types,function(i, type) {
					var rowclass = "info";
				    var typeLink = '<a href="type.jsp?type=' + type.replace(/\s/g, "") + '" class="btn btn-primary""> Explore </a>';
					var row = '<tr class="' + rowclass + '">'
										+ '<td>'
										+ type.toLocaleString()
										+ '</td>'
										+'<td>'
										+ typeLink
										+'</td>'
										+ '</tr>';
								$("#typesBody").append(row);  
							});
		};
	</script>
</body>
</html>