<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <!-- Your own local CSS -->
    <link rel="stylesheet" href="/css/main.css"/>
    <!-- Bootstrap JS -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="ISO-8859-1">
    <title>Mellow Health Portal!</title>
</head>
<body class="container-fluid p-8" style="
    <c:choose>
        <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
            background: rgba(1, 10.64, 60, 0.9);
        </c:when>
        <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
            background: rgba(13, 330.2, 360, 0.9);
        </c:when>
        <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
            background: rgba(1, 10.64, 60, 0.9);
        </c:when>
        <c:otherwise>
            background: rgba(0.21, 0.180, 25, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
        </c:otherwise>
    </c:choose>
    font-family: cursive;">
    <c:choose>
        <c:when test="${onePatient.id == loggedInPatient.id and onePatient.patientCases.size() > 1}">
            <h1 class="text-center border-bottom border-2" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color: brown; font-family: fantasy;">
                <a class="text-decoration-none text-brown" href="/mellowHealth/patientsPortal/patients/${onePatient.id}">
                    Welcome To The Mellow Health Patients Portal<c:out value="${onePatient.patientFirstName}"/> : You Have <c:out value="${loggedInPatient.patientCases.size()} "/> Physician Visits!
                </a>
            </h1>
        </c:when>
        <c:when test="${onePatient.id == loggedInPatient.id and onePatient.patientCases.size() == 1}">
            <h1 class="text-center border-bottom border-2" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color: khaki; font-family: fantasy;">
                <a class="text-decoration-none text-brown" href="/mellowHealth/patientsPortal/patients/${loggedInPatient.id}">
                    Welcome To The Mellow Health Patients Portal<c:out value="${onePatient.patientFirstName}"/> : You Have Only <c:out value="${loggedInPatient.patientCases.size()} "/> Physician Visits!
                </a>
            </h1>
        </c:when>
        <c:otherwise>
            <h1 class="text-center border-bottom border-2" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color:brown; font-family: fantasy;">
                <a class="text-decoration-none text-brown" href="/mellowHealth/patientCases/newPatientCase">
                    Welcome To The Mellow Health Patients Portal<c:out value="${loggedInPatient.patientFirstName}"/> : You Have Not Made Any Physician Visit, Please Schedule A New Visit Today!
                </a>
            </h1>
        </c:otherwise>
    </c:choose>

    <table class="table table-dark text-center" style="border-radius: 5%;">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Patient</th>
            <th scope="col">Gender</th>
            <th scope="col">Race</th>
			<c:choose>
			<c:when test="${onePatient.id == loggedInPatient.id}">
            	<th scope="col">Mellow Health Visits</th>
            </c:when>
            <c:otherwise>
            	<th scope="col">Mellow Physician Visits</th>
            </c:otherwise>
            </c:choose>
        </tr>
        </thead>
		<tbody>
		    <tr style="text-decoration:none; color:aqua">
		        <td><c:out value="${onePatient.id}" /></td>
		        <td><a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; color:aqua"><c:out value="${onePatient.patientFirstName}" /></a></td>
		        <td><a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none;
				<c:choose>
				<c:when test="${onePatient.gender == 'Male'}">
					color:silk;
				</c:when>
				<c:when test="${onePatient.gender == 'Female'}">
					color:pink;
				</c:when>
		        <c:otherwise>
	                color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
                </c:otherwise>
           		</c:choose>
				"><c:out value="${onePatient.gender}" /></a></td>
		        <td>
	            	<a href="/mellowHealth/patientsPortal/patients" style="text-decoration:none;
            	<c:choose>
	            <c:when test="${onePatient.gender == 'Female' || onePatient.race == 'Black'}">
	                color: rgb(312, 280, 31.5);
                </c:when>
                <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
	                color: rgb(412, 580, 515);
                </c:when>
                <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
                    color: rgb(412, 580, 515);
                </c:when>
                <c:otherwise>
                   background: rgba(133, 64, 60, 0.9); 
                </c:otherwise>
           		</c:choose>
           		"><c:out value="${onePatient.race}" /></a>
				</td>
		        <c:choose>
				<c:when test="${onePatient.id == loggedInPatient.id}">
				<td class="table-dark">
				<c:forEach items="${onePatient.patientCases}" var="patientCase">
				<a 
					<c:choose>
			        <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
		            	class= "btn btn-warning"
		            </c:when>
		            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
	                	class= "btn btn-primary"
		            </c:when>
		            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
		            	class= "btn btn-danger"
		            </c:when>
			        <c:otherwise>
	 	            	class= "btn btn-primary"  
	                </c:otherwise>
					</c:choose> 
	    				href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; 
					<c:choose>
	                <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
		                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
	                </c:when>
	                <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
		                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
	                </c:when>
	                <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
		                color: rgb(412, 580, 515);  background: rgba(17, 104, 130, 0.9); 
	                </c:when>
	                <c:otherwise>
	                    color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
	                </c:otherwise>
	           		</c:choose>
	           			padding:15px; border-radius:5%; width:100%; height:100%;"
	           		<c:choose>
	                <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
		            	class= "btn btn-warning"
	                </c:when>
	                <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
		            	class= "btn btn-primary"
	                </c:when>
	                <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
		            	class= "btn btn-danger"
	                </c:when>
	                <c:otherwise>
	                   	class= "btn btn-primary"  
	                </c:otherwise>
	           		</c:choose>	
	                	><p style="text-decoration:none;"><c:out value="${patientCase.chiefComplaint}" /></p>
	           		</a>
           		</c:forEach>
       			</td>
		 				</c:when>
		 				
						<c:otherwise>
					  	<td class="table-dark">
					  		<a 
		               		<c:choose>
		                    <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
				            	class= "btn btn-warning"
		                    </c:when>
		                    <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
				            	class= "btn btn-primary"
		                    </c:when>
		                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				            	class= "btn btn-danger"
		                    </c:when>
		                    <c:otherwise>
		                    	class= "btn btn-primary"  
		                    </c:otherwise>
		               		</c:choose>	
		               			href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; 
							<c:choose>
		                    <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
				                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                    </c:when>
		                    <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
				                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                    </c:when>
		                    <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				                color: rgb(412, 580, 515);  background: rgba(17, 104, 130, 0.9); 
		                    </c:when>
		                    <c:otherwise>
		                        color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
		                    </c:otherwise>
		               		</c:choose>
		               			padding:15px; border-radius:5%; width:100%; height:100%;">
			               	<p style="text-decoration:none;"><c:out value="${patient.currentChiefComplaint}"/></p>
		               		</a>
							</c:otherwise>
	            			</c:choose>
	            		</td>
				    </tr>
					</tbody>
					</table>
				<c:choose>
				<c:when test="${onePatient.patientCases.size() < 1}">
				<h1 style="width: 100%"><a style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(13, 114, 160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 0.180, 255); color:pink;
	             </c:otherwise>
	             </c:choose>
	              	  margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientCases/newPatientCase" class="btn btn-danger">YOU HAVE NOT YET SCHEDULED ANY VISIT, CLICK HERE TO SCHEDULE NEW VISIT!</a></h1>
				</c:when>
				<c:otherwise>
					<h1 style="width: 100%"><a style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(13, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;background: rgba(13, 114, 160, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose> 
	             	margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientsPortal/patients/${onePatient.id}" class="btn btn-success">NUMBER OF MELLOW PHYSICIAN VISIT: <c:out value="${onePatient.patientCases.size()}" /> PHYISICIAN VISITS!</a></h1>
				 </c:otherwise>
			     </c:choose>

	    	<div class="form-group"style="display:flex; justify-content:space-between;align-items:center;
				<c:choose>
	              <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			           color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
	              </c:when>
	              <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			          color: rgb(412, 580, 515);  background: rgba(17, 0.64, 130, 0.9); 
	              </c:when>
	              <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			          color: rgb(412, 580, 51);  background: rgba(11, 34, 73, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
	             </c:otherwise>
	             </c:choose>
	             border-radius:5%;padding:5px;">
				    <a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none;text-align:center; width:100%;"><h1 style="font-family:fantasy;background:rgba(18, 12, 11, 0.7);border-radius:5%;padding:5px;">${onePatient.patientFirstName}'s Details: ${onePatient.patientCases.size()} Mellow Health Visit Visits</h1></a>
				   </div>
				   

			<c:forEach items="${onePatient.patientCases}" var="patientCase">
	    	<div class="form-group"style="display:flex; justify-content:space-between;align-items:center;padding:10px;margin:5px;
				<c:choose>
	              <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			           color: rgb(512, 0.80, 191.5);  background: rgba(17, 0.64, 130, 0.9); 
	              </c:when>
	              <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			          color: rgb(92, 380, 15.15); background: rgba(17, 0.64, 130, 0.9); 
	              </c:when>
	              <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			          color: rgb(4.12, 580, 51);  background: rgba(1.1, 34, 73, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 0.60, 0.9); 
	             </c:otherwise>
	             </c:choose>
	             border-radius:5%;padding:5px;">
				    <p style="text-align:center;">Treating Physician: <a href="/mellowHealth/patientsPortal/patients/${patientCase.patient.id}" style="text-decoration:none;color: rgb(412, 280, 5.15);text-align:center;">
		      			<c:out value="Dr. ${patientCase.physician.firstName}" /></a></p>
		        	<p style="text-align:center;">Differential Diagnosis: <a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; 
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 80, 5.15);
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(512, 150.80, 1.5); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(42, 580, 515); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;
	             </c:otherwise>
	             </c:choose>
	             text-align:center;"><c:out value="${patientCase.differentialDiagnosis}"/></a></p>
				    <p style="text-align:center;background: rgba(13, 64, 60, 0.9); padding:5px; border-radius:5%;">
					    <a href="/mellowHealth/patientsPortal/patients/${patientCase.patient.id}" style="text-decoration:none; color:khaki;text-align:center;">
					    	Follow Up: <c:out value="${patientCase.followUpConsultation}"/>
					    </a>
				    </p>
				    <div class="d-flex justify-content-around" style="padding:10px;
		        		<c:choose>
			            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
					         color: rgb(412, 580, 515);
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || onePatient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515);
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;
			             </c:otherwise>
			             </c:choose>
			             ">
	    		<p style="
		    		<c:choose>
		            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(1.3, 0.64, 60, 0.9); 
		            </c:when>
		            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(0.13, 0.114, 16, 0.9); 
		            </c:when>
		            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255); color:pink;
		             </c:otherwise>
		             </c:choose>
		             border-radius:5%;padding:5px;font-weight:bold;"><a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; 
		    			<c:choose>
		                    <c:when test="${onePatient.race.contains('AM')}">
				                color: rgb(412, 580, 515);
		                    </c:when>
		                    <c:otherwise>
		                        color: rgb(211, 180, 255);
		                    </c:otherwise>
		                </c:choose>
		             text-align:center;"><c:out value="${onePatient.race}:"/>
		            </a>
		        </p>
	    		<p style="
		    		<c:choose>
		            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(13, 0.64, 60, 0.9); 
		            </c:when>
		            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(13, 1.14, 16, 0.9); 
		            </c:when>
		            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255); color:pink;
		             </c:otherwise>
		             </c:choose>
		             border-radius:5%;padding:5px;font-weight:bold;">
		             <a href="/mellowHealth/patientsPortal/patients/${onePatient.id}" style="text-decoration:none; 
		    			<c:choose>
		                    <c:when test="${onePatient.race.contains('AM')}">
				                color: rgb(412, 580, 515);
		                    </c:when>
		                    <c:otherwise>
		                        color: rgb(211, 180, 255);
		                    </c:otherwise>
		                </c:choose>
		                text-align:center;text-decoration:none;			        
		    			<c:choose>
				            <c:when test="${course.price lt 20}">
				                color:rgb(11, 180, 245);color:pink;
				            </c:when>
				            <c:otherwise>
				                color: rgb(111, 180, 255);
				            </c:otherwise>
				        </c:choose>
				        text-align:center; font-weight:bold;">
				        <c:out value="${onePatient.gender}" />
				    </a>
			    </p>
		</div>
    </div>	
    </c:forEach>
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 0.64, 60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(0.130, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
		<h1 style=" margin: 0px 15px 0 0; width: 100%"><a href="/mellowHealth/patientCases/newPatientCase" class="btn btn-primary" style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(30, 0.114, 160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;
	             </c:otherwise>
	             </c:choose>width: 100%; display:block; padding: 10px">Schedule A New Visit!</a></h1>
		<h1 style=" margin: 0px 15px 0 0; width: 100%"><a href="/mellowHealth/patientsPortal/patients" class="btn btn-warning" style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(130, 1.14, 160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink; background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose>
	             width: 100%; display:block; padding:10px 0">Patients Portal Access!</a></h1>
			    <c:choose>
			        <c:when test="${onePatient.id == loggedInPatient.id and onePatient.patientCases.size() > 1}">
			        <h1 class="text-center border-bottom border-2" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color: brown; font-family: fantasy;">
						<form action="/mellowHealth/patientsPortal/patients/${onePatient.id}" method="get">	
						<input type="submit" value="${onePatient.patientCases.size()}: Physician Visits!" class="btn btn-success"style="
				    		<c:choose>
				            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
						         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
				            </c:when>
				            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
						         color: rgb(412, 580, 515); background: rgba(553, 0.114, 16, 0.9); 
				            </c:when>
				            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
						     	 color: rgb(412, 580, 515); background: rgba(0.531,64, 16, 0.9); 
				             </c:when>
				             <c:otherwise>
				                  color: rgb(21, 180, 255); color:pink;
				             </c:otherwise>
				             </c:choose>margin: 10px 0; width:100%; padding: 10px"/>
						</form>
			        </h1>
			        </c:when>
			        <c:when test="${onePatient.id == loggedInPatient.id and onePatient.patientCases.size() == 1}">
			            <h1 class="text-center" style="border-radius:5%;color: khaki;">
						<form action="/mellowHealth/patientsPortal/patients/${onePatient.id}" method="get" style="border-radius:5%;color: khaki;padding:10px; margin-top:5px;">	
						<input type="submit" value="${onePatient.patientCases.size()}: Physician Visit!" class="btn btn-success"style="
				    		<c:choose>
				            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
						         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
				            </c:when>
				            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
						         color: rgb(412, 580, 515); background: rgba(553, 0.114, 16, 0.9); 
				            </c:when>
				            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
						     	 color: rgb(412, 580, 515); background: rgba(0.531,64, 16, 0.9);
				             </c:when>
				     <c:otherwise>
							<input type="submit" value="${onePatient.patientCases.size()}: Physician Visits!" class="btn btn-success border-bottom border-2"style="
					    		<c:choose>
					            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
							         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
					            </c:when>
					            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
							         color: rgb(412, 580, 515); background: rgba(553, 0.114, 16, 0.9); 
					            </c:when>
					            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
							     	 color: rgb(412, 580, 515); background: rgba(0.531,64, 16, 0.9); 
					             </c:when>
					             <c:otherwise>
					                  color: rgb(21, 180, 255); color:pink;
					             </c:otherwise>
					             </c:choose>margin: 10px 0; width:100%; padding: 10px"/>
						</form>
				      </c:otherwise>
			          </c:choose>margin: 5px 0; width:100%; padding: 10px"/>
				      </form>
			          </h1>
			        </c:when>
			        <c:otherwise>
			           <h1 class="text-center" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color:brown; font-family: fantasy;">
					   <form action="/mellowHealth/patientsPortal/patients/${onePatient.id}" method="get" style=";background: rgba(13, 64, 60, 0.9);border-radius:5%;color: khaki;padding:10px; margin-top:3px;">	
						<input type="submit" value="${onePatient.patientCases.size()}: Physician Visits!" class="btn btn-success"style="
				    		<c:choose>
				            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
						         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
				            </c:when>
				            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
						         color: rgb(412, 580, 515); background: rgba(553, 0.114, 16, 0.9); 
				            </c:when>
				            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
						     	 color: rgb(412, 580, 515); background: rgba(0.531,64, 16, 0.9); 
				             </c:when>
				             <c:otherwise>
				                  color: rgb(21, 180, 255); color:pink;
				             </c:otherwise>
				             </c:choose>margin: 10px 0; width:100%; padding: 10px"/>
					</form>
			            </h1>
			        </c:otherwise>
			    </c:choose>	
	</div>
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(0.13, 0.64, 1.60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(86, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
	 	<h1 style=" margin: 10px; width: 100%"><a href="/mellowHealth/patientCases/newPatientCase" class="btn btn-warning" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px;font-weight:bold;">SCHEDULE NEW PHYSICIAN VISIT!</a></h1>		
		<h1 style="width: 100%;margin:10px; "><a style=" width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientsPortal/patients/${onePatient.id }" class="btn btn-primary"><c:out value="You have ${loggedInPatient.patientCases.size()} Physician Visits ${loggedInPatient.patientFirstName} ${loggedInPatient.patientLastName}"/>!</a></h1>	
	</div>
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 0.64, 0.60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(10, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 0.316, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(18.31, 2.64, 1.116, 0.9); 
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
	
		<h1 style=" margin: 10px; width: 100%"><a href="/mellowHealth/patientsPortal/logout" class="btn btn-danger" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
		<h1 style="width: 100%;margin:10px"><a style="margin:10px 0;width:100%;display:block;padding:10px"  href="/mellowHealth/physicians" class="btn btn-success">GO BACK!</a></h1>
	</div>	
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${onePatient.gender == 'Male' || onePatient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 0.64, 0.60, 0.9); 
	            </c:when>
	            <c:when test="${onePatient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || onePatient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(10, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 0.316, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(18.31, 2.64, 1.116, 0.9); 
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
     <h1 style="width:100%"><a style="background: rgba(68, 8, 120, 0.9); margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientsPortal/patients/${onePatient.id }" class="btn btn-success">${loggedInPatient.patientFirstName }'s Patient Portal!</a></h1>
	</div>
</body>
</html>