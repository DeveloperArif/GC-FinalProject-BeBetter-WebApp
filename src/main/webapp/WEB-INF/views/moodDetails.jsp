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
	  <div class="img">
      	 <img src="https://i.postimg.cc/9MfpGm6w/be_better.png" height="180" width="180"/>
      </div>
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
    <br></br>
    <h1>Mood Details</h1>
	 <br></br><br></br>
	 <!-- Begin "Add Mood" -->
	 	<div class="form-group">
			<div class="col-5" align="center"> 
				<form action="/moodDetailsSubmit">
				  <h1></h1><label for="comment">How are you feeling today?</label></h1>
				  <textarea name="entry" class="form-control" rows="2" id="comment"></textarea>
				  <button type="submit" class="btn btn-primary">Submit</button>
				 </form>
 		 	</div>
		</div>
	 <!-- End "Add Mood -->
	 	 <br></br>
	 <!-- Begin Mood detailed list -->
	 <h5>Previous Moods</h5>
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