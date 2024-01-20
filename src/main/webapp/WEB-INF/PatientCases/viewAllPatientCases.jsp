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
	     <c:when test="${loggedInPhysician.isBoardCertified = true }">
            background: rgba(1, 10.64, 60, 0.9);
        </c:when>
	    <c:when test="${loggedInPhysician.isBoardCertified = false}">
            background: rgba(13, 330.2, 360, 0.9);
        </c:when>
	    <c:when test="${loggedInPhysician.patientCases.size() % 2 == 1}">
            background: rgba(1, 10.64, 60, 0.9);
        </c:when>
        <c:otherwise>
            background: rgba(0.21, 0.180, 25, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
        </c:otherwise>
    </c:choose>
    font-family: cursive;">
            <h1 class="text-center border-bottom border-2" style="margin-top:5px;border-radius:5%;background: rgba(0.21, 0.180, 25, 0.9);color: brown; font-family: fantasy;font-size:32px">
                <a class="text-decoration-none text-brown" href="/mellowHealth/physicians/${loggedInPhysician.id}">
                    Welcome To The Mellow Health Patient Cases Portal <c:out value="Dr. ${loggedInPhysician.firstName} ${loggedInPhysician.lastName}"/> : You Have <c:out value="${loggedInPhysician.patientCases.size()}"/> Patients In Your Care!
                </a>
            </h1>

    <table class="table table-dark text-center" style="border-radius: 5%;">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Patient</th>
            <th scope="col">Gender</th>
            <th scope="col">Chief Complaint</th>
            <th scope="col">Objective Findings</th>
            <th scope="col">Treatment Plan</th>
           	<th scope="col">Mellow Physician Visits</th>
        </tr>
        </thead>
		<tbody>
		<c:forEach items="${allPatientCases}" var="patientCase">
		    <tr style="text-decoration:none; color:aqua">
		        <td><c:out value="${patientCase.id}" /></td>
		        <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; color:aqua"><c:out value="${patientCase.patient.patientFirstName}" /></a></td>
		        <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none;
				<c:choose>
					<c:when test="${patientCase.patient.gender == 'Male'}">
						color:silk;
					</c:when>
					<c:when test="${patientCase.patient.gender == 'Female'}">
						color:pink;
					</c:when>
			        <c:otherwise>
		                color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
	                </c:otherwise>
           		</c:choose>
				"><c:out value="${patientCase.patient.gender}"/>
				</a></td>
		        <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none;
            	<c:choose>
		            <c:when test="${patientCase.patient.gender == 'Female' || patientCase.patient.race == 'Black'}">
		                color: rgb(312, 280, 31.5);
	                </c:when>
	                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
		                color: rgb(412, 580, 515);
	                </c:when>
	                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patientCase.patient.patientCases.size() % 2 == 0}">
	                    color: rgb(412, 580, 515);
	                </c:when>
	                <c:otherwise>
	                   background: rgba(133, 64, 60, 0.9); 
	                </c:otherwise>
           		</c:choose>
           		"><c:out value="${patientCase.chiefComplaint}"/></a>
				</td>	        
	            <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none;
					<c:choose>
						<c:when test="${patientCase.patient.gender == 'Male'}">
				            color: rgb(321, 189.0, 25.5);
						</c:when>
						<c:when test="${patientCase.patient.gender == 'Female'}">
							color:pink;
						</c:when>
					    <c:otherwise>
				            color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
			            </c:otherwise>
		            </c:choose>
					"><c:out value="${patientCase.objectiveFindings}" />
					</a>
				</td>		        
	            <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none;
					<c:choose>
						<c:when test="${patientCase.patient.gender == 'Male'}">
				            color: rgb(121, 180, 255);
						</c:when>
						<c:when test="${patientCase.patient.gender == 'Female'}">
				            color: rgb(10.21, 180, 123.55);
						</c:when>
					    <c:otherwise>
				            color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
			            </c:otherwise>
		           	</c:choose>
					"><c:out value="${patientCase.treatmentPlan}" /></a>
				</td>
				<td class="table-dark"><a 
					<c:choose>
				      <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black' || patientCase.physician.patientCases.size() % 2 == 1}">
			          	 	class= "btn btn-warning"
			          </c:when>
			          <c:when test="${patientCase.physician.patientCases.size() % 2 == 1 || patientCase.patient.patientCases.size() % 2 == 1}">
		              	 	class= "btn btn-primary"
			          </c:when>
			          <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			    	       	class= "btn btn-danger"
			            </c:when>
				        <c:otherwise>
		 	            	class= "btn btn-primary"  
		                </c:otherwise>
						</c:choose> 
		    			href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; 
						<c:choose>
		                <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
			                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                </c:when>
		                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
			                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                </c:when>
		                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			                color: rgb(412, 580, 515);  background: rgba(17, 104, 130, 0.9); 
		                </c:when>
		                <c:otherwise>
		                    color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
		                </c:otherwise>
		           		</c:choose>
		           			padding:15px; border-radius:5%; width:100%; height:100%;"
		           		<c:choose>
		                <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
			            	class= "btn btn-warning"
		                </c:when>
		                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
			            	class= "btn btn-primary"
		                </c:when>
		                <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			            	class= "btn btn-danger"
		                </c:when>
		                <c:otherwise>
		                   	class= "btn btn-primary"  
		                </c:otherwise>
		           		</c:choose>	
		                	><p style="text-decoration:none;"><c:out value="${patientCase.objectiveFindings}" />: Dr. ${patientCase.physician.firstName}</p>
		           		</a>
	       			</td>	
			    </tr>
				</c:forEach>
				</tbody>
				</table>

				<c:choose>
				<c:when test="${loggedInPhysician.patientCases.size() < 1}">
				<h1 style="width: 100%"><a style="
		    		<c:choose>
			            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
					         color: rgb(4.12, 58.0, 515);background: rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(13, 114, 160, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 0.180, 255); color:pink;
			             </c:otherwise>
		             </c:choose>
	              	  margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/patientCases/newPatientCase" class="btn btn-danger">YOU HAVE NOT YET SCHEDULED ANY VISIT, CLICK HERE TO SCHEDULE NEW VISIT!</a>
	            </h1>
				</c:when>
				<c:otherwise>
					<h1 style="width: 100%"><a style="
	    		<c:choose>
	            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
	            </c:when>
	            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(13, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255); color:pink;background: rgba(13, 114, 160, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose> 
	             	margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/physicians/${loggedInPhysician.id}" class="btn btn-success">NUMBER OF PHYSICIAN VISIT: <c:out value="${loggedInPhysician.patientCases.size()}" /> PATIENTS IN CARE!</a></h1>
				 </c:otherwise>
			     </c:choose>
	    	<div class="form-group"style="display:flex; justify-content:space-between;align-items:center;
				<c:choose>
		              <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				           color: rgb(412, 580, 515);background:rgba(17, 64, 130, 0.9); 
		              </c:when>
		              <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				          color: rgb(412, 580, 515);background:rgba(17, 0.64, 130, 0.9); 
		              </c:when>
		              <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				          color: rgb(412, 580, 51);background:rgba(11, 34, 73, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255);color:pink;background:rgba(133, 64, 60, 0.9); 
		            </c:otherwise>
	             </c:choose>
	             	border-radius:5%;padding:5px;">
				 <a href="/mellowHealth/patientsPortal/patients/${patientCase.patient.id}" style="text-decoration:none;text-align:center; width:100%;">
					 <h1 style="font-family:fantasy;background:rgba(18, 12, 11, 0.7);border-radius:5%;padding:5px;">Total Patients In Your Care: ${loggedInPhysician.patientCases.size()} Patient Cases in Dr. ${loggedInPhysician.firstName}'s Care</h1>
				 </a>
		   </div>
    	<table class="table table-dark text-center" style="border-radius: 5%;">
	    <thead>
	         <tr>
			     <th scope="col">Chief Complaint</th>
			     <th scope="col">Objective Findings</th>
			     <th scope="col">Differential Diagnosis</th>
			     <th scope="col">Follow Up</th>
			     <th scope="col">Patient Demographics</th>
	         </tr>
	    </thead>
		<tbody>  
		<div style="text-decoration:none;color:aqua;display:flex;justify-content:space-between;align-items:center;padding:10px;margin:5px;border-radius:5%;
				<c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
		   	           color: rgb(412, 5.80, 51.5); background: rgba(0.17, 0.64, 1.30, 0.9); 
			        </c:when>
			        <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				          color: rgb(92, 380, 15.15); background: rgba(17, 0.64, 1.30, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
		     	          color: rgb(412, 580, 51);  background: rgba(11, 34, 73, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
		             </c:otherwise>
	             </c:choose>
		         border-radius:5%;padding:5px;">
	         <tr>
			<c:forEach items="${allPatientCases}" var="patientCase">
		     <td><p style="text-align:center;
				<c:choose>
			    <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				      color: rgb(4.12, 115.80, 351.5);  background: rgba(0.17, 0.64, 1.30, 0.9); 
		         </c:when>
		         <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				      color: rgb(92, 380, 15.15); background: rgba(17, 0.64, 1.30, 0.9); 
		         </c:when>
		         <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
	        	      color: rgb(412, 580, 51);  background: rgba(11, 34, 73, 0.9); 
		         </c:when>
		         <c:otherwise>
		              color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
		         </c:otherwise>
		         </c:choose>
	             ">
	             <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.patient.id}" style="text-decoration:none;color: rgb(412, 280, 5.15);text-align:center;">
	   		      	<c:out value="${patientCase.chiefComplaint}" />
	   		     </a>
	   		     </p>
	   		  </td>
	   		  <td><p style="text-align:center;">
	   		  	<a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.patient.id}" style="text-decoration:none; 
		    	<c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(41, 580, 515); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(42, 580, 515); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255); color:pink;
		             </c:otherwise>
		          </c:choose>
	              text-align:center;"><c:out value="${patientCase.objectiveFindings}"/>
                  </a>
              	  </p>
              </td>

              <td><p style="text-align:center;">
	              <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; color:khaki;text-align:center;">
				    <c:out value="${patientCase.differentialDiagnosis}"/>
				  </a>
				 </p>
			  </td>
	   		  <td><p style="text-align:center;">Follow Up: 
	   		  	<a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; 
		    	<c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(41, 580, 515); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(42, 580, 515); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255); color:pink;
		             </c:otherwise>
		          </c:choose>
	              	text-align:center;"><c:out value="${patientCase.followUpConsultation}"/>
                  </a>
              	</p>
              </td>

			  <td>
			  	<div class="d-flex justify-content-around" style="border-radius:5%;display:flex;align-items:center; 	
			      <c:choose>
		              <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
		              </c:when>
		              <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(0.13, 1.14, 1.60, 0.9); 
		              </c:when>
		              <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
		              </c:when>
		              <c:otherwise>
		                 color: rgb(21, 180, 255); color:pink; background: rgba(0.531, 0.64, 16, 0.9); 
		              </c:otherwise>
				  </c:choose>
				  ">
				  <p style="
				  <c:choose>
					  <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
			    		 color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
			          </c:when>
			          <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
			     	     color: rgb(412, 580, 515); background: rgba(0.13, 0.114, 16, 0.9); 
			          </c:when>
			          <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
			          </c:when>
			          <c:otherwise>
			              color: rgb(21, 180, 255); color:pink;
			          </c:otherwise>
			          </c:choose>
			          border-radius:5%;padding:5px;font-weight:bold;">Physician In Care: Dr. ${patientCase.physician.firstName}
						 <a href="/mellowHealth/patientsPortal/physicians/${patientCase.physician.id}" style="text-decoration:none; 
						 	 <c:choose>
								<c:when test="${patientCase.patient.race.contains('AM')}">
					            	color: rgb(412, 580, 515);
				                </c:when>
				                <c:otherwise>
				                    color: rgb(211, 180, 255);
				                </c:otherwise>
			                </c:choose>text-align:center;"><c:out value="Patient: ${patientCase.patient.patientFirstName}"/>
			             </a>
		    		 <p style="
			    		<c:choose>
				            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
						         color: rgb(412, 580, 515);background: rgba(13, 0.64, 60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
						         color: rgb(412, 580, 515); background: rgba(13, 1.14, 16, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
						     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
				             </c:when>
				             <c:otherwise>
				                  color: rgb(21, 180, 255); color:pink;
				             </c:otherwise>
			             </c:choose>
			             border-radius:5%;padding:5px;font-weight:bold;">${patientCase.patient.patientFirstName}- ${patientCase.patient.dateOfBirth}
			             <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none;
			    			<c:choose>
			                    <c:when test="${patientCase.patient.race.contains('AM')}">
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
				             text-align:center; font-weight:bold;"><c:out value="${patientCase.patient.race}- ${patientCase.patient.gender}"/>
				          </a>
				     </p>
				 </div>
			  </td>
    		</tr>
    		</c:forEach>
    	</div>	
    	</tbody>
    	</table>
		<div class="form-group"style="
	    	<c:choose>
	            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
			         color: rgb(412, 580, 515);background: rgba(13, 0.64, 60, 0.9); 
	            </c:when>
	            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
			         color: rgb(412, 580, 515); background: rgba(0.130, 0.114, 0.160, 0.9); 
	            </c:when>
	            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:when>
	             <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); background: rgba(0.531, 0.64, 16, 0.9); 
	             </c:otherwise>
	             </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
				 <h1 style=" margin: 0px 15px 0 0; width: 100%">
				 <a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-primary" style="
			    	<c:choose>
			            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
					         color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(30, 0.114, 160, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;
			             </c:otherwise>
			             </c:choose>width: 100%; display:block; padding: 10px">Schedule A New Visit!</a>
			     </h1>
				 <h1 style=" margin: 0px 15px 0 0; width: 100%"><a href="/mellowHealth/patientsPortal/patients" class="btn btn-warning" style="
			    		<c:choose>
			            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
					         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(130, 1.14, 160, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink; background: rgba(0.531, 0.64, 16, 0.9); 
			             </c:otherwise>
			             </c:choose>
			             width: 100%; display:block; padding: 10px">Patients Portal Access!</a>
			      </h1>
				  <form action="/mellowHealth/patientsPortal/patients/${patientCase.patient.id}" method="get">
				     <input type="submit" value="${patientCase.patient.patientCases.size()}: Physician Visits!" class="btn btn-success"style="
			    		<c:choose>
			            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
					         color: rgb(412, 580, 515);background: rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
					         color: rgb(412, 580, 515); background: rgba(553, 0.114, 16, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
					     	 color: rgb(412, 580, 515); background: rgba(0.531,64, 16, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255); color:pink;
			             </c:otherwise>
			             </c:choose>margin: 10px 0; width:100%; padding: 10px"/>
				  </form>
		</div>
		<div class="form-group"style="
		    	<c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(0.13, 0.64, 1.60, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(86, 0.114, 0.160, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 16, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(0.531, 0.64, 16, 0.9); 
		             </c:otherwise>
		        </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
		 	<h1 style=" margin: 10px; width: 100%"><a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-warning" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px;font-weight:bold;">SCHEDULE NEW PHYSICIAN VISIT!</a></h1>		
			<h1 style="width: 100%;margin:10px; "><a style=" width: 100%; display:block; padding: 10px"  href="/mellowHealth/physicians/${loggedInPhysician.id}" class="btn btn-primary"><c:out value="You have ${loggedInPhysician.patientCases.size()} Patients In Care${loggedInPhysician.firstName} ${loggedInPhysician.lastName}"/>!</a></h1>	
		</div>
		<div class="form-group"style="
		    <c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(13, 0.64, 0.60, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(10, 0.114, 0.160, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 0.316, 0.9); 
		             </c:when>
		             <c:otherwise>
		                 color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(18.31, 2.64, 1.116, 0.9); 
		             </c:otherwise>
		     </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
		
			<h1 style=" margin: 10px; width: 100%"><a href="/mellowHealth/physicians/logout" class="btn btn-danger" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
			<h1 style="width: 100%;margin:10px"><a style=" margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/physicians" class="btn btn-success">GO BACK!</a></h1>
		</div>	
		<div class="form-group"style="
		    <c:choose>
		            <c:when test="${patientCase.patient.gender == 'Male' || patientCase.patient.race == 'Black'}">
				         color: rgb(412, 580, 515);background: rgba(13, 0.64, 0.60, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'Yes' || patientCase.patient.patientCases.size() % 2 == 1}">
				         color: rgb(412, 580, 515); background: rgba(10, 0.114, 0.160, 0.9); 
		            </c:when>
		            <c:when test="${patientCase.patient.hasTravelledOutsideTheUnitedStatesForMoreThan30Days == 'No' || patient.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(0.531, 0.64, 0.316, 0.9); 
		             </c:when>
		             <c:otherwise>
		                  color: rgb(21, 180, 255);background: rgba(78, 10, 80, 0.9); color:pink; background: rgba(18.31, 2.64, 1.116, 0.9); 
		             </c:otherwise>
		    </c:choose>display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0">
	     <h1 style="width:100%"><a style="background: rgba(68, 8, 120, 0.9); margin:10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/physicians/${loggedInPhysician.id }" class="btn btn-success">Dr. ${loggedInPhysician.firstName } Portal Access!</a></h1>
	</div>
</body>
</html>