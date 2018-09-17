<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
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
    </div>
    
 <div class="listBody">

<h1>Your tasks</h1>

<table>
	<thead>
		<tr>
			<th>Completed  </th> <th>Date  </th> <th>Task  </th> <th>Action </th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items ="${task}" var = "item" >
			<tr>
			<td> 
				<form action="/tasklist/${ item.id }/complete-task" method="post">
					<input name="complete" type="checkbox" value="true"> 
					<button  type="submit" class="btn btn-outline-success">submit</button>
				</form>
			</td>
				<td>${item.dueDate}</td> 
				<td>${item.task} </td>
			
	    	<td><a href="/tasklist/${ item.id }/delete" onclick="return confirm('Are you sure you want to delete this task?')">Delete</a></td>
	   	 	<%-- <td><a href="/edit-item/${ item.id }/edit">Edit</a></td>--%>
			</tr>
		</c:forEach>
	</table>
		
		<form action="/tasklist/add-task" method="post">
			<label for="task">Task: <input name="task" required minlength="2"/> </label>
			<label for="dueDate">Due Date: <input name="dueDate" required minlength="2"/> </label>
			<p>
			<button type="submit" class="btn btn-outline-success">Add Task</button>
			</p>
		</form>	
 </div>
		
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	

</body>
</html>