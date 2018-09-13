<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
</head>
<body>

	<div>
         <p><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal" data-backdrop="false">
           Login
           </button> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registerModal" data-backdrop="false">
           Register
         </button></p>
			<p class="message">${ message }</p>
      </div>

	<p>Entry: ${entry}</p>
	
	<form action="/user-home/submit-result" method="post">
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
	
	
	
	
	
	
	

		<!-- Login Modal -->
			<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 style="color: black" class="modal-title" id="loginModalLongTitle">Login</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div style="color: black" class="modal-body">
						<form action="/login-submit" method="post" autocomplete=off >
							<div class="input-group mb-3">
				  				<div class="input-group-prepend">
				   				 <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
				  				</div>
				  				<input type="email" class="form-control" aria-label="Sizing example input" 
				  				aria-describedby="inputGroup-sizing-default" name="email" autofocus required>
							</div>
							<div class="input-group mb-3">
				  				<div class="input-group-prepend">
				   				 <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
				  				</div>
				  				<input type="password" class="form-control" aria-label="Sizing example input" 
				  				aria-describedby="inputGroup-sizing-default" name="password" required>
							</div>
							
							
							<div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="submit" class="btn btn-primary">Log in</button>
					     	</div>
						</form>
					</div>
			      
			    </div>
			  </div>
			</div>
	
		<!-- Register Modal -->
					<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="registerModalLongTitle" style="color: #686a69">Register</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div style="color: black" class="modal-body">
					        <form action="/register-submit" method="post" autocomplete=off >
										<div class="input-group mb-3">
							  				<div class="input-group-prepend">
							   				 <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
							  				</div>
							  				<input type="text" class="form-control" aria-label="Sizing example input" 
							  				aria-describedby="inputGroup-sizing-default" name="name" required>
										</div>
										<div class="input-group mb-3">
							  				<div class="input-group-prepend">
							   				 <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
							  				</div>
							  				<input type="email" class="form-control" aria-label="Sizing example input" 
							  				aria-describedby="inputGroup-sizing-default" name="email" required>
										</div>
										<div class="input-group mb-3">
							  				<div class="input-group-prepend">
							   				 <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
							  				</div>
							  				<input type="text" class="form-control" aria-label="Sizing example input" 
							  				aria-describedby="inputGroup-sizing-default" name="password" required>
										</div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="submit" class="btn btn-primary">Register</button>
						      </div>
					      </form>
					      </div>
					    </div>
					  </div>
					</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	

	
	
</body>
</html>