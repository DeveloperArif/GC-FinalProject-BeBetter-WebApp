<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

<br>
<br>
<div class="listBody">
 <center> <h1>Meet Our Team</h1></div> </center>
 <br>
 <br>
 
            <div class="container2">
                    <div class="row">
                        
 
                        <div class="col-md-3 col-sm-3">
                            <div class="team-member">
                                <div class="team-img">
                                   <img src="https://i.postimg.cc/kg1F736n/Untitled_design_2.png" alt="" height="180" width="180" class="img-circle"/>
                                </div>
                            </div>
                            <div class="team-name">
                                <h5>Kari Mcfarlin</h5>
                                
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-sm-3">
                            <div class="team-member">
                                <div class="team-img">
                                   <img src="https://i.postimg.cc/MHS19z4Y/Untitled_design.png" alt="" height="180" width="180" class="img-circle"/>
                                </div>
                                
                            </div>
                            <div class="team-name">
                                <h5>Kris Runde</h5>
                                
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="team-member">
                                <div class="team-img">
                                    <img src="https://i.postimg.cc/BvRT1TBk/Untitled_design_3.png" alt="" height="180" width="180" class="img-circle"/>
                                </div>
                                
                            </div>
                            <div class="team-name">
                                <h5>Jasmine S. Allen</h5>
                            </div>
                        </div>
                        
                        <div class="col-md-3 col-sm-3">
                            <div class="team-member">
                                <div class="team-img">
                                   <img src="https://i.postimg.cc/KjPDb1LV/Untitled_design_1.png" alt="" height="180" width="180" class="img-circle"/>
                                </div>
                                
                            </div>
                            <div class="team-name">
                                <h5>Arif Istiaque</h5>
                               
                            </div>
                        </div>
                    </div>
                </div>
                
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>	

</body>
</html>