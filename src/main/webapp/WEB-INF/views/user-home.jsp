<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
		<h1>User Home Page</h1>

			<div>
				<h3>${quotes.content}</h3>
				<p> ${quotes.title}</p>
			</div>
					
		<h1>Task List</h1>	
	<table>
	<thead>
	<tr>
		<th>Date</th><th>Task</th><th>Action</th>
	</tr>
	</thead>
	
	<tbody>
	
	<c:forEach items ="${tasks }" var = "item" >
	
	<tr>
		<td>${item.date }</td> 
		<td>${item.task } </td>
		<%--  <td> <input type ="checkbox" value = "true" ${task.complete ? 'checked' : ' '}> </td> --%>
		<td>${item.id }</td>
    	<td><a href="/user-home/${ item.id }/delete">Delete</a></td>
    
   	 	<%-- <td><a href="/edit-item/${ item.id }/edit">Edit</a></td>--%>
		
	</tr>
	</c:forEach>
	</table>
			
	</body>
</html>