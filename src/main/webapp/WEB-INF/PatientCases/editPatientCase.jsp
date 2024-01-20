<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>BOOK CLUB</title>
</head>
<body class="container-fluid p-4" style="background:khaki;">
<h1 style="border-bottom: 2px solid chocolate;text-align:center;color: green">Edit <c:out value="${book.title}"/>!</h1>
<form:form action="/books/process/edit/${book.id}" method="PATCH" modelAttribute="book">
	<input type="hidden"name="_method" value="PATCH">
    <input type="hidden" name="user.id" value="${book.user.id}" />
    <div class="form-group"style="text-align:center;">
        <label style="text-align:center;font-weight:bold;">Title</label>
        <form:input type="text" path="title" class="form-control"/>
        <form:errors path="title"/>
    </div>
    <div class="form-group"style="text-align:center;">
        <label style="text-align:center;font-weight:bold;">Author</label>
        <form:input type="text" path="author" class="form-control"/>
        <form:errors path="author"/>
    </div>
    <div class="form-group"style="text-align:center;">
         <label style="padding:10px 0;font-weight:bold;text-align:center;">Your Thoughts</label>
         <form:textarea path="thought" class="form-control" rows="4" placeholder="Please tell us something about this book!"></form:textarea>
         <form:errors path="thought" class="text-danger" />
    </div>
    <input type="submit" value="Edit Book" class="btn btn-primary"style="margin: 10px 0; width: 100%; padding: 10px"/>
 
    <h1 style="width: 100%"><a style=" margin:10px 0; width: 100%; display:block; padding: 10px"  href="/books" class="btn btn-success">Go Back!</a></h1>
 </form:form>  
	<form action="/books/delete/${book.id}" method="post">
		 <input type="hidden" name="_method" value="delete">
		 <input class ="btn btn-danger" type="submit" value="Delete Book" style=" margin:10px 0; width: 100%; display:block; padding: 10px">
	</form>
</body>
</html>