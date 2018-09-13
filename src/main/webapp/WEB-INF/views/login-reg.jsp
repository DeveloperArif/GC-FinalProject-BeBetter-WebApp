<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							 <input type="hidden" name="url" value="/results">
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
					        			<input type="hidden" name="url" value="/results">
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
</body>
</html>