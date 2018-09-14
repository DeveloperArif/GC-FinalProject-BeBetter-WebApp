<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="sidenav">
      <a href="/user-home">${user.name}</a>
      <a href="/user-home">Home</a>
      <a href="/moodDetails">Add Mood</a>
      <a href="/journal">Journal</a>
      <a href="/taskList">My Tasks</a>
      <a href="/quotesList">My Quotes</a>
      <a href="/logout">Logout</a>
    </div>

<h1>Your Affirmations</h1>


	
<table>
	<body>
	
		<c:forEach items ="${allAffirmations}" var = "item" >
			<tr>
			
				<td>${item.affirmation} </td>
			
	    	<td><a href="/affirmation/${ item.id }/delete" onclick="return confirm('Are you sure you want to delete this affirmation?')">Delete</a></td>
	   	 	<%-- <td><a href="/edit-item/${ item.id }/edit">Edit</a></td>--%>
			</tr>
		</c:forEach>
	</table>
		
		<form action="/affirmation/add-affirmation" method="post">
			<label for="task">Enter Affirmation: <input name="affirmation" required minlength="2"/> </label>
			
			<p>
			<button type="submit" class="btn btn-outline-success">Add</button>
			</p>
		</form>

</body>
</html>