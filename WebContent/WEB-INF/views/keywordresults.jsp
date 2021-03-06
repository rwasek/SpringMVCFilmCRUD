<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="styles.css">

<title>Film</title>
</head>
<body>

<div class="container-fluid">
		<div class="jumbotron- text-left" role="alert">

<c:forEach var="film" items="${films}">
 	
  <c:choose>
    <c:when test="${! empty film}">
      <ul class="list-group">
     	<li class="list-group-item">ID: ${film.id }</li>
        <li class="list-group-item">TITLE: ${film.title}</li>
        <li class="list-group-item">DESCRIPTION: ${film.description}</li>
        <li class="list-group-item">RELEASE YEAR: ${film.releaseYear}</li>
        <li class="list-group-item">LANGUAGE: ${film.languageString}</li>
        <li class="list-group-item">RATING: ${film.rating}</li>
        <li class="list-group-item">ACTORS: ${film.actors}</li>
        <li class="list-group-item">CATEGORY: ${film.category}</li>
      </ul>
    </c:when>
    <c:otherwise>
      <p>No film with that keyword!</p>
    </c:otherwise>
  </c:choose>
    Delete this film?
    <form action="deleteFilm.do" method="POST">
    Enter the film ID to Delete:
 	<input type="number" name="filmId"/>
    <input type="submit" value="Delete Film"/>
  </form>
  <form action="updateFilm.do" method="POST">
  	Change the film?:
  	<br>
  	<input type="hidden" name="id" value="${film.id}"/>
  	<c:choose>
  	 <c:when test="${film.id > 1000}">
  	<input type="hidden" name="languageId" value="1"/>
  	</c:when>
  	<c:otherwise>
  	<input type="hidden" name="languageId" value="${film.languageId}"/>
  	</c:otherwise>
  	</c:choose>
    Title:
    <input type="text" name="title" value="${film.title}"/> 
    Description:
    <input type="text" name="description" value="${film.description}"/> 
    Release Year:
    <input type="number" name="releaseYear" value="${film.releaseYear}"/>
    Rating: ${film.rating}
    
    <select id="rating" name="rating">
    	<option value="G">General Audiences</option>
    	<option value="PG">Parental Guidance Suggested</option>
    	<option value="PG13">Parents Strongly Cautioned</option>
    	<option value="R">Restricted</option>
    	<option value="NC17">Adults Only</option>
    </select>
    <!-- Language:
    <select id="languageId" name="languageId">
    	<option value="1">English</option>
    	<option value="2">Italian</option>
    	<option value="3">Japanese</option>
    	<option value="4">Mandarin</option>
    	<option value="5">French</option>
    	<option value="6">German</option>
    </select> -->
    <input type="submit" value="Update Film Data"/>
  </form>
</c:forEach> 

  </div>
	</div>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>