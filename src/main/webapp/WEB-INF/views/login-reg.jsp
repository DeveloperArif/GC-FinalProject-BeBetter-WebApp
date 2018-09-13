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
			<p class="message">${ message }</p>
      	</div>
      	
      	<div class="container">
      		<span class="headers">Login</span>
      		<div>
      			<form action="/login-score" method="post" autocomplete=off >
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
      		
      		  <span class="headers">Register</span>
      		<div>
      			<form action="/register-score" method="post" autocomplete=off >
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
    
</body>
</html>