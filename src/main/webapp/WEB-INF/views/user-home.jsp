<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
<title>user-home</title>
</head>
	<body>
	
		
	<div class="sidenav">
      <a href="/user-home">${user.name}</a>
      <a href="/user-home">Home</a>
      <a href="/moodDetails">Add Mood</a>
      <a href="/journal">Journal</a>
      <a href="/tasklist">My Tasks</a>
      <a href="/affirmation">My Affirmations</a>
      <a href="/quote-list">My Quotes</a>
      <a href="/logout">Logout</a>
      <a href="/about-page">About</a>
    </div>
    
    <!-- Start of body -->
    <div class="listBody">
    
    
    <p>
    <div>
    
    <div class="containerhome">
    
	<img src="https://i.postimg.cc/BnbFGGb4/Untitled_design_8.png" alt="calm" style="width: 100vw; height: 350px;">
	
  <div class="centered">
  
    <form action="/user-home/add-quote">
			<div>
				<h2><label class="quotebox" name="quote">${quotes.quote}</label></h2>
				<br></b><br></b><br>
			
				<p><input  id="quoteauthor" name="author" value="~${quotes.author}"></p>
			</div>
	</div>
	</p>
		<button type="submit" class="btn btn-success">Save Quote</button>
		<button type="redirect/user-home" class="btn btn-success">Next Quote</button>
	</form>	
	</div>
	<br></br>
	</div>
	
			<h1>Daily Affirmation</h1>
				<h2>"${affirmation}"</h2>
			<div>
			<form action="/user-home/add-affirmation" method="post">
				<h4><label for="affirmation">Record your affirmation here: <input name="affirmation" required minlength="2"/> </label>

				<button type="submit" class="btn btn-success">Add</button></h4>
				
			</form>	
			</div>
			<br></b>
			
			<!-- Begin Mood Tracker -->
		<div class="tracker">
	      <div class="head">
	        <span>Mood Tracker</span>
	      </div>
	      
	       <div class="moods">
          	<c:forEach items="${moods}" var="scoreVar" end="30" >
				<!--<a href="#${scoreVar}">  -->
	            	<div class="scores"><label class="hideScore">${scoreVar.score}</label>
 		            	<div class="hoverinfo"><span class="hideThis">iiiiiiiii</span> 
						    <p>Mood Score: ${scoreVar.score}</p>
						</div>
	            	</div>
            	<!--</a> -->	
	      	</c:forEach>
		  </div>
        </div> <!-- End of Mood Tracker -->
				
		<br></b><br></b>
		<table class="table">
		<tbody>
			<thead>
		<h5>Task List</h5>
		<tr>
			<h4><th>Completed</th> <th>Date</th> <th>Task</th> <th>Action</th></h4>
		</tr>
	</thead>
	<tbody>
		<c:forEach items ="${tasks}" var = "item" >
			<tr>
			<td> 
				<form action="/user-home/${ item.id }/complete-task" method="post">
					<input name="complete" type="checkbox" value="true"> 
					<button  type="submit" class="btn btn-success">Completed</button>
				</form>
			</td>
				<td>${item.dueDate}</td> 
				<td>${item.task} </td>
			
	    	<td><a href="/user-home/${ item.id }/delete" onclick="return confirm('Are you sure you want to delete this task?')">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
		
		<form action="/user-home/add-task" method="post">
			<h4><label for="task">Add a new task: <input name="task" required minlength="2"/> </label>
			<label for="dueDate">Due Date: <input name="dueDate" required minlength="2"/> </label>
			<button type="submit" class="btn btn-success">Add</button></h4>
			<p>
			
			</p>
		</form>	
		</tbody>
		</table>
		<br></b><br></b><br></b><br></b>	
		
		  
        
        
    <p id="showMessage" style="color:black;">${show_message}</p>
    <p id="goodMessage" style="color:white;">${good_message}</p>
    <p id="helpfulMessage" style="color:white;">${helpful_message}</p>
    
    
        
        
	 <script>
			 window.onload = function(){
			    	var gm = document.getElementById("goodMessage");
			    	var hm = document.getElementById("helpfulMessage");
			    	var m = document.getElementById("showMessage");
		 	
			    	if(m.innerHTML == "good")
			   		{
			   			alert(gm.innerHTML);
			   		}
			    	else if(m.innerHTML == "help")
			   		{
			   			alert(hm.innerHTML);
			   		}
			    	
			    	m.style.display = "none";
			    	gm.style.display = "none";
			    	hm.style.display = "none";

		 	}
	          for(var i = 0; i <= 29; i++)
	          {
	
	            var moodText = document.getElementsByClassName("scores");
	
	            var score = document.getElementsByClassName("hideScore");
	            var infoIcon = document.getElementsByClassName("hideThis");

	            var colorThreshold = score[i].innerHTML;
	
	            function changeColor(val)
	            {
	              var color = "white";
	
	              if (val <= 20) 
	              {
	                color = "#444eff";
	              }
	              else if (20 < val && val <= 40)
	              {
	                color = "#4c67ff";
	              }
	              else if (40 < val && val <= 60)
	              {
	                color = "#5e91ff";
	              }
	              else if (60 < val && val <= 80)
	              {
	                color = "#6db8ff";
	              }
	              else if (80 < val && val <= 100)
	              {
	                color = "#7cdeff";
	              }
	              
	
	             moodText[i].style.backgroundColor = color;
	
	             score[i].style.opacity = 0;
	             infoIcon[i].style.opacity = 0;
	            }
	
	            changeColor(colorThreshold);
	
	          } 
	
			
    	
    </script>
    

        
		<!-- End of body -->
	</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
		
	</body>
</html>