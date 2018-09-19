<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
<title>Insert title here</title>
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
    
<div class="listBody">

<h1>Your Journal Entries</h1>

<table>

	<body>
	<%--this comes from controller --%>
	<c:forEach items ="${alljournalentries}" var = "item" >
		<tr>
			<%--this comes from .java --%>
			<td>${item.journalEntry} </td>
			
			
	    <td><a href="/journalentry/${ item.id }/delete" onclick="return confirm('Are you sure you want to delete this affirmation?')">Delete</a></td>
	   	 <%-- <td><a href="/edit-item/${ item.id }/edit">Edit</a></td>--%>
		</tr>
	</c:forEach>
</table>
		

 <div class="form-group">
	<div class="col-5"> 
		<form action="/journal/journal-entry" method="post">
													<%--pojo name used in .java --%>
	  	<label for="journalEntry">Journal Entry<textarea name="journalEntry" class="form-control" rows="3" id="comment"></textarea>
		<input type="submit" value="Submit"></label>
		
	  	</form>
 </div>
  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	

</body>
</html>