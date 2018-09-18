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
	 <!-- Begin drop down to find avg by date -->
	 
	 <form action="/avgdd" method="post">
	
	<p>
	Choose a date to see your average score
	</p>
				<div class="col-auto my-1">
			      <label class="mr-sm-2" for="inlineFormCustomSelect">Date</label>
			      	<select id="date" name="date">
			      		<option selected>Choose date</option>
			      		<c:forEach items ="${dates}" var = "date">
					        <option value="dates">${date}</option>
						</c:forEach> 
					</select>
				</div>
		
		<button type="submit" >Submit</button>
</form>
	 
	 <!-- End drop down to find avg by date -->
	 	 
	 <!-- Begin Mood detailed list -->
	 <h2>Previous Moods</h2>
	 	 <div class="moodListContainer">
          	<c:forEach items="${moodList}" var="scoreVar" end="30" >
	            <div id="${scoreVar}" class="scoreDetail"> 
	            	<div class="scores"><span class="hideScore">${scoreVar.score}</span></div>
	            	<div><p>" ${scoreVar.text} " on ${scoreVar.date} </p></div>
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
              var color = "red";

              if (val <= 20) 
              {
                color = "black";
              }
              else if (20 < val && val <= 40)
              {
                color = "blue";
              }
              else if (40 < val && val <= 60)
              {
                color = "green";
              }
              else if (60 < val && val <= 80)
              {
                color = "orange";
              }
              else if (80 < val && val <= 100)
              {
                color = "yellow";
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