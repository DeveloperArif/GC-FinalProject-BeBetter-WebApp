<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/style.css"/>
<title>Insert title here</title>
</head>
	<body>
		<h1>User Home Page</h1>
      <a href="/logout">Logout</a>

			<div>
				<h3>${quotes.content}</h3>
				<p> ${quotes.title}</p>
			</div>
					
		<h1>Task List</h1>	
	<table>
	<thead>
		<tr>
			<th>Completed</th> <th>Date</th> <th>Task</th> <th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items ="${tasks}" var = "item" >
			<tr>
			<td> 
				<form action="/user-home/${ item.id }/complete-task" method="post">
					<input name="complete" type="checkbox" value="true"> 
					<button  type="submit" class="btn btn-outline-success">submit</button>
				</form>
			</td>
				<td>${item.dueDate}</td> 
				<td>${item.task} </td>
			
	    	<td><a href="/user-home/${ item.id }/delete" onclick="return confirm('Are you sure you want to add this task?')">Delete</a></td>
	   	 	<%-- <td><a href="/edit-item/${ item.id }/edit">Edit</a></td>--%>
			</tr>
		</c:forEach>
	</table>
		
		<form action="/user-home/add-task" method="post">
			<label for="task">Task: <input name="task" required minlength="2"/> </label>
			<label for="dueDate">Due Date: <input name="dueDate" required minlength="2"/> </label>
			<p>
			<button type="submit" class="btn btn-outline-success">Add Task</button>
			</p>
		</form>		
		
		
		
		<div class="moods">
			
          <c:forEach items ="${testing}" var = "days" >

            <div class="day"><span class="hideScore">${days}</span></div>

          </c:forEach>

        </div>

        <script>
          for(var i = 0; i <= 12; i++)
          {

            var dayText = document.getElementsByClassName("day");

            var score = document.getElementsByClassName("hideScore");

            var colorThreshold = score[i].innerHTML;


            function changeColor(val)
            {
              var color = "dodgerblue";

              if (val < -.5) 
              {
                color = "darkblue";
              } 
              else if (val == 0)
              {
                color = "white";
              }
              else if (val < .5)
              {
                color = "aqua";
              }
              else if (val <= 1)
              {
                color = "aliceblue";
              }

              dayText[i].style.backgroundColor = color;

              score[i].style.opacity = 0;		          
            }

            changeColor(colorThreshold);

          } 

        </script>
		
		
		
	</body>
</html>