<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Entry: ${entry}</p>
	
	<form action="/user-home" method="post">
		<p>Slide for new Score: </p>
		
		<div class="slidecontainer">
	  		<input name="newScore"type="range" min="-1" max="1" step=".1" value="${entry}" class="slider" id="myRange">
		</div>
		<script> 
			var slider = document.getElementById("myRange");
			var output = document.getElementById("demo");
			output.innerHTML = slider.value; // Display the default slider value
		
			// Update the current slider value (each time you drag the slider handle)
			slider.oninput = function() {
			    output.innerHTML = this.value;
			}
		</script>
			<input type="submit">
	
	</form>
	
</body>
</html>