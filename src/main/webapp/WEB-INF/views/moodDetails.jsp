<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
</head>
<body>
	<div class="sidenav">
      <a href="/user-home">${user.name}</a>
      <a href="/user-home">Home</a>
      <a href="/journal">Journal</a>
      <a href="/tasklist">My Tasks</a>
      <a href="/affirmation">My Affirmations</a>
      <a href="/quote-list">My Quotes</a>
      <a href="/logout">Logout</a>
    </div>
    
    <!-- Start of body -->
    <div class="listBody">
    <h1>Mood Details</h1>
	 
	 <!-- Begin "Add Mood" -->
	 	<div class="form-group">
			<div class="col-5"> 
				<form action="/moodDetailsSubmit">
				  <label for="comment">How are you feeling today?</label>
				  <textarea name="entry" class="form-control" rows="3" id="comment"></textarea>
				  <input type="submit" value="Submit">
				 </form>
 		 	</div>
		</div>
	 <!-- End "Add Mood -->
	 
	 <!-- Begin Mood Tracker -->
		<div class="tracker">
	      <div class="head">
	        <span>Mood Tracker</span>
	      </div>
	      
	      <div class="moods">
          	<c:forEach items="${testing}" var="scores" end="12" >
	            <div class="scores"><span class="hideScore">${scores}</span>
	            	<div class="hoverinfo"><span class="hideThis">i</span>
					    <p>Mood Score: ${scores}</p>
					</div>
	            </div>
					<script>
			          for(var i = 0; i <= 29; i++)
			          {
			
			            var dayText = document.getElementsByClassName("scores");
			
			            var score = document.getElementsByClassName("hideScore");
			            var infoIcon = document.getElementsByClassName("hideThis");

			
			            var colorThreshold = score[i].innerHTML;
			
			
			            function changeColor(val)
			            {
			              var color = "dodgerblue";
			
			              if (val < -0.5) 
			              {
			                color = "darkblue";
			              }
			              else if (-0.5 < val < 0.0)
			              {
			                color = "blue";
			              }
			              else if (val === 0.0)
			              {
			                color = "white";
			              }
			              else if (0.0 < val <= 0.5)
			              {
			                color = "lightblue";
			              }
			              else if (val < 0.5)
			              {
			                color = "aqua";
			              }
			              else if (val <= 1.0)
			              {
			                color = "aliceblue";
			              }
			
			              dayText[i].style.backgroundColor = color;
			
			              score[i].style.opacity = 0;
			              infoIcon[i].style.opacity = 0;
			            }
			
			            changeColor(colorThreshold);
			
			          } 
			
			        </script>
	          </c:forEach>
		  </div>
	      
        </div> <!-- End of Mood Tracker -->
	 
	 
	 
	 <!-- Begin Mood detailed list -->
	 <h2>Previous Moods</h2>
	 	 <div class="moodListContainer">
          	<c:forEach items="${moodList}" var="scores" end="12" >
	            <div class="scoreDetail"> 
	            	<div class="scores"><span class="hideScore">${scores.score}</span></div>
	            	<div><p>" ${scores.text} " on ${scores.date} </p></div>
	            </div>
	            <br>
	            <script>
			          for(var i = 0; i <= 29; i++)
			          {
			
			            var moodText = document.getElementsByClassName("scores");
			
			            var score = document.getElementsByClassName("hideScore");

			
			            var colorThreshold = score[i].innerHTML;
			
			
			            function changeColor(val)
			            {
			              var color = "dodgerblue";
			
			              if (val < 25) 
			              {
			                color = "#00095B";
			              }
			              else if (25 < val <= 50)
			              {
			                color = "#4B80FC";
			              }
			              else if (val === 50)
			              {
			                color = "#4B80FC";
			              }
			              else if (50 < val <= 75)
			              {
			                color = "#4da6ff";
			              }
			              else if (val < 100)
			              {
			                color = "#4da9ff";
			              }
			              else if (val === 100)
			              {
			                color = "#4da9ff";
			              }
			
			              moodText[i].style.backgroundColor = color;
			
			            }
			            
			            changeColor(colorThreshold);
			
			          } 
			
			        </script>
	        </c:forEach>
	 	</div>
	 <!-- End Mood detailed list -->
		
	</div>
	<!-- End of body -->
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	
	
</body>
</html>