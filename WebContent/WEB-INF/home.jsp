<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<h2>Welcome <script>document.write(localStorage.name);</script></h2>
<script src="js/jquery/jquery.js"></script>
<script>
$(document).ready(function() {
	if(!(sessionStorage.session == JSON.stringify(true))){
		alert("First login to explore Kai");
		window.close();
		window.open("./login.jsp");
    } else {
    	var storedProjects = JSON.parse(localStorage.getItem("projects"));
    	var storedOwners = JSON.parse(localStorage.getItem("owners"));
    	int i = 0;
    	for(project : storedProjects){
    		var owner = storedOwners[i];
    		if(owner.localeCompare(localStorage.name) == 0){
    			
    		}
    	}
    }
});
</script>
</body>
</html>