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

<body class="container-fluid p-4"  style="background:khaki;font-family:cursive;">
	<h1 style="color:azure;border-bottosm: 2px solid aliceblue;font-weight:bold;font-size:32px;background:chocolate;padding:10px;font-family:cursive;text-align:center;">MAKE CHANGES TO YOUR PATIENTS RECENT VISIT!</h1>
	<div class="container" style=" text-align:center;">
		<div class="row">
			<div class="col">
			 	<h1 style="font-size:26px;">	
	            <a href="/courses/${course.id}" style="text-decoration:none; 
						<c:choose>
	                    <c:when test="${course.programDate == 'Saturday' || course.programDate == 'Sunday'}">
			                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
	                    </c:when>
	                    <c:when test="${course.programDate == 'Monday' || course.programDate == 'Tuesday'}">
			                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
	                    </c:when>
	                    <c:when test="${course.programDate == 'Thursday' || course.programDate == 'Friday'}">
			                color: rgb(412, 580, 515);  background: rgba(17, 104, 130, 0.9); 
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
	                    </c:otherwise>
	               		</c:choose>
	               			padding:15px; border-radius:5%; width:100%; height:100%;"
	               		<c:choose>
	                    <c:when test="${course.programDate == 'Saturday' || course.programDate == 'Sunday'}">
			            	class= "btn btn-warning"
	                    </c:when>
	                    <c:when test="${course.programDate == 'Monday' || course.programDate == 'Tuesday'}">
			            	class= "btn btn-primary"
	                    </c:when>
	                    <c:when test="${course.programDate == 'Thursday' || course.programDate == 'Friday'}">
			            	class= "btn btn-danger"
	                    </c:when>
	                    <c:otherwise>
	                    	class= "btn btn-primary"  
	                    </c:otherwise>
	               		</c:choose>	
	               			><c:out value="Edit ${course.courseName} Yoga Program!"/></a>
				</h1>
				<form:form action="/courses/process/edit/${course.id}" method="PATCH" modelAttribute="course">
					<input type="hidden" name="instructor.id" value="${course.instructor.id}"/>
				    <div class="form-group">
				        <label style="padding:5px 0 10px 0">Chief Complaint</label>
				        <form:input path="courseName" class="form-control" placeholder="Please enter the chief complaint!"/>
				        <form:errors path="courseName" class="text-danger"/>
				    </div>
                    <div class="form-group">
                        <label style="padding:10px 0">Day of Week</label>
                        <form:select path="programDate" class="form-control">
                            <form:option value="Monday" label="Monday" />
                            <form:option value="Tuesday" label="Tuesday" />
                            <form:option value="Wednesday" label="Wednesday" />
                            <form:option value="Thursday" label="Thursday" />
                            <form:option value="Friday" label="Friday" />
                            <form:option value="Saturday" label="Saturday" />
                            <form:option value="Sunday" label="Sunday" />
                        </form:select>
                        <form:errors path="programDate" class="text-danger" />
                    </div>
				    <div class="form-group">
				        <label style="padding:10px 0">Deductible</label>
				        <form:input path="price" class="form-control" placeholder="Please enter the drop-in price for this course!"/>
				        <form:errors path="price" class="text-danger" />
				    </div>
					<div class="form-group">
					    <label style="padding:10px 0">Time</label>
					    <form:select path="courseTime" class="form-control">
					        <form:option value="">${course.courseTime}</form:option>
					        <c:forEach var="i" items="${timeFormat}">
					            <form:option value="${i}:00 AM">${i}:00 AM</form:option>
					            <form:option value="${i}:30 AM">${i}:30 AM</form:option>
					            <form:option value="${i}:00 PM">${i}:00 PM</form:option>
					            <form:option value="${i}:30 PM">${i}:30 PM</form:option>
					        </c:forEach>
					    </form:select>
					    <form:errors path="courseTime" class="text-danger" />
					</div>
		            <div class="form-group">
		                <label style="padding:10px 0">Treatment Plan</label>
		                <form:textarea path="description" class="form-control" rows="5" maxlength="500" placeholder="Please tell us something about this course!"></form:textarea>
		                <form:errors path="description" class="text-danger" />
		            </div>
				    <input type="submit" value="Edit Case" class="btn btn-success" style="margin: 10px 0; width: 100%; padding: 10px;"/>
				</form:form>
				<h1 style="width: 100%"><a style=" margin:10px 0; width: 100%; display:block; padding: 10px"  href="/instructors/classes" class="btn btn-warning">CANCEL!</a></h1>
			</div>
		</div>
	</div>
	
</body>
</html>