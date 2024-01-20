<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Mellow Health!</title>
</head>
<body class="container-fluid p-8" style="
 		                <c:choose>
	                    <c:when test="${loggedInPatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || loggedInPatient.patientCases.size() % 2 == 1}">
			                color: khaki;background:aqua;background:rgba(1.802,300.4, 316.6, 0.9);
	                    </c:when>
	                    <c:when test="${loggedInPatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || loggedInPatient.patientCases.size() % 2 == 0}">
			                color:pink;background:rgba(18.2, 370.4, 446.6, 0.9);
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(211, 180, 255);background:rgba(18.2, 370.4, 446.6, 0.9);
	                    </c:otherwise>
	               		</c:choose>font-family:cursive;">
	<h1 style="text-align:center;border-bottom: 2px solid chocolate;border-radius:5%;background:rgba(0.1, 0.4, 0.9, 0.9);margin-top:5px;"><a style="width: 100%; display:block; padding: 10px;text-decoration:none;font-family:fantasy;font-size:32px"  href="/mellowHealth/patientsPortal/patients/${loggedInPatient.id}">Welcome To The Mellow Heath Patients Dashboard <c:out value=" ${loggedInPatient.patientFirstName} ${loggedInPatient.patientLastName }!"/></a></h1>
	<table class="table table-dark"style="border-radius:5%;">
			  <thead>
			    <tr style="text-align:center">
			      <th scope="col">Id</th>
			      <th scope="col">Patient</th>
			      <th scope="col">Incidence</th>
			      <th scope="col">Gender</th>
			      <th scope="col">Race</th>
			      <th scope="col">Date Of Birth</th>
			      <th scope="col">Actions</th>
			      
			    </tr>
			  </thead>
			<c:forEach items="${allPatients}" var="patient">
			<tbody>
			    <tr style="text-align:center">
			      <td style=" 	
		        		<c:choose>
			            <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
					         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(13, 114, 160, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(133, 64, 60, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9);
			             </c:otherwise>
			             </c:choose>
			             "><c:out value="${patient.id}" /></td>
				  <td><a href="/mellowHealth/patientsPortal/patients/${patient.id}" style="text-decoration:none; 
				  	<c:choose>
	                    <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			                color: aquamarine;
	                    </c:when>
	                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			                color:aqua;
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(211, 180, 255); color;color:azure;
	                    </c:otherwise>
	               		</c:choose>"><c:out value="${patient.patientFirstName} ${patient.patientLastName}"/></a></td>
				  <td><a href="/mellowHealth/patientsPortal/patients/${patient.id}" style="text-decoration:none; 
				  		<c:choose>
	                    <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			                color: khaki;
	                    </c:when>
	                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			                color:pink;color:orange;
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(211, 180, 255); color;
	                    </c:otherwise>
	               		</c:choose>"><c:out value="${patient.currentChiefComplaint}"/></a></td>
				  <td><a href="/mellowHealth/patientsPortal/patients/${patient.id}" style="text-decoration:none; 
				  		<c:choose>
	                    <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			                color:silk;
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(21, 180, 255);
	                    </c:otherwise>
	               		</c:choose>"><c:out value="${patient.gender}"/>
	              </a>
	              </td>
				  <td><a href="/mellowHealth/patientsPortal/patients/${patient.id}" style="text-decoration:none; 
				  		<c:choose>
	                    <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			                color: khaki;
	                    </c:when>
	                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			                color:pink;
	                    </c:when>
	                    <c:otherwise>
	                        color: rgb(211, 180, 255); color;
	                    </c:otherwise>
	               		</c:choose>
	               		"><c:out value="${patient.race}"/></a></td>
				  <td><a href="/mellowHealth/patientsPortal/patients/${patient.id}" style="text-decoration:none; 
		        		<c:choose>
			            <c:when test="${patient.gender == 'Female'}">
					         color: rgb(43, 580, 515); color:pink;
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 58, 515);
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0 || patient.race != 'Black'}">
					     	 color: rgb(412, 580, 515); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:aqua;
			             </c:otherwise>
			             </c:choose>
			            "><c:out value="${patient.dateOfBirth}"/></a></td>
			      <c:choose>
						<c:when test="${patient.id == loggedInPatient.id}">
				        <td class="d-flex justify-content-around"style=" 	
		        		<c:choose>
			            <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
					         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(13, 114, 160, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(133, 64, 60, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9);
			             </c:otherwise>
			             </c:choose>
			             ">
							<form action="/mellowHealth/patientsPortal/edit/${patient.id}" method="get" style="margin:0 10px 0 0; ">
							    <input type="hidden" name="_method" value="edit">
							    <input class ="btn btn-warning" type="submit" value="Update Profile" style=" margin:10px 0; width: 100%; display:block; padding: 10px" >
							</form>
							<form action="/mellowHealth/patientsPortal/delete/${patient.id}" method="post">
							    <input type="hidden" name="_method" value="delete">
								<input class ="btn btn-danger" type="submit" value="Delete Profile" style=" margin:10px 0; width: 100%; display:block; padding: 10px">
							</form>
						</td>
		 				</c:when>
						<c:otherwise>
						  <td class="table-dark"> <a  href="/mellowHealth/patientsPortal/patients/${patient.id}" style=" margin:10px 0; width: 100%; display:block; padding: 10px;" 
				  		<c:choose>
	                    <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			            	 color: khaki;" class= "btn btn-warning"
	                    </c:when>
	                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			            	 color:pink;" class= "btn btn-primary"
	                    </c:when>
	                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			            	 color:pink;" class= "btn btn-danger"
	                    </c:when>
	                    <c:otherwise>
	                    	 color: rgb(211, 180, 255);" class= "btn btn-primary"  
	                    </c:otherwise>
	               		</c:choose>
	               		>
	               		<c:out value="${patient.dateOfBirth}"/></a></td>
						</c:otherwise>
            			</c:choose>
			    </tr>
			 </tbody>
			 </c:forEach>
		</table>
	<div class="form-group"style="text-decoration:none;
		        		<c:choose>
			            <c:when test="${patient.gender == 'Female' || patient.race == 'Black'}">
					         color: rgb(412, 580, 515);background:rgba(1.3, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515);background:rgba(1.3, 1.14, 1.60, 0.9); 
			            </c:when>
			            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515);background:rgba(1.33, 0.64, 0.60, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;background: rgba(1.33, 6.4, 60, 0.9);
			             </c:otherwise>
			             </c:choose>
			             display:flex; justify-content:space-between;padding: 10px;border-radius:5%;">
		<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/patientsPortal/patientDairyNotes/newDairyNote"style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px; background:rgba(71, 81, 120, 0.3);" class="btn btn-success" >REPORT NEW INCIDENT!</a></h1>
		<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/patientsPortal/logout" class="btn btn-danger" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
		 	<h1 style="width: 100%"><a style=" margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientsPortal/patients/${loggedInPatient.id }" class="btn btn-primary">PATIENT PORTAL ACCESS!</a></h1>
	</div>	
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			         color: rgb(4.12, 58.0, 5.15);background: rgba(13, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			         color: rgb(41.2, 5.80, 5.15); background: rgba(1.10, 0.114, 5.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 5.80, 51.5); background: rgba(0.531, 0.64, 3.16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(1.21, 0.180, 2.5);background: rgba(18, 1.10, 18, 0.9); color:pink;
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
		 <h1 style=" margin:10px 5px 10px 0;width: 100%"><a style="width:100%; display:block;padding:10px" href="/mellowHealth/patientsPortal/patients/${loggedInPatient.id }" class="btn btn-primary"><c:out value="${loggedInPatient.patientFirstName}"/>'s Profile Details!</a></h1>
		 <h1 style=" margin:10px 0px 10px 5px;width:100%"><a href="/mellowHealth/patientsPortal/patientDairyNotes/newDairyNote" class="btn btn-warning" style="; width: 100%; display:block; padding: 10px">Report A New Incident!</a></h1>
	 </div>	
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${patient.gender == 'Male' || patient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(1.3, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(10, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 3.16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(0.8, 3.33, 10, 0.9);
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
					 <h1 style=" margin:10px 5px 10px 0;width: 100%"><a href="/mellowHealth/patientsPortal/logout" class="btn btn-danger" style="width: 100%; display:block; padding: 10px">LOG OUT!</a></h1>	
					 <h1 style=" margin:10px 0 10px 5px;width: 100%"><a style="width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientsPortal/patients" class="btn btn-success">GO BACK!</a></h1>
	</div>
</body>
</html>