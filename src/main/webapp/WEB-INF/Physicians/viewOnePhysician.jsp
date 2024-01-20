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
               <c:when test="${onePhysician.patientCases.size() % 2 < 1}">
	                color: khaki;background:aqua;background:rgba(80.2, 400.4, 316.6, 0.9);
               </c:when>
               <c:when test="${onePhysician.patientCases.size() % 2 == 1}">
	                color:pink; background:rgba(113.802, 124.4, 316.6, 0.9);
               </c:when>
               <c:otherwise>
                    color: rgb(211, 180, 255);background:rgba(380.2, 380.4, 36.6, 0.9);
               </c:otherwise>
 			</c:choose>
					font-family:cursive;">
			<c:choose>
				<c:when test="${onePhysician.id == loggedInPhysician.id}">
					<h1 style="text-align:center;border-bottom: 2px solid chocolate;color: brown; font-family:fantasy;border-radius:5%;background:rgba(10.2, 3.3, 3.6, 0.9);margin-top:5px;"><a style="width: 100%; display:block; padding:10px;color:aqua;text-decoration:none;"  href="/mellowHealth/physicians">Welcome To Your Physician Portal <c:out value="Dr. ${loggedInPhysician.firstName}"/>!</a></h1>
				</c:when>
				<c:otherwise>
    				<h1 style="text-align:center;border-bottom: 2px solid chocolate;color: brown; font-family:fantasy;border-radius:5%;background: rgba(7.8, 0.10, 10.101, 0.9)"><a style="width: 100%; display:block; padding: 8px;color:aquamarine;text-decoration:none;" href="/mellowHealth/physicians">Welcome To <c:out value="Dr. ${onePhysician.firstName}" />'s Portal <c:out value="Dr. ${loggedInPhysician.firstName}"/>!</a></h1>
				</c:otherwise>
			</c:choose>
		<table class="table table-dark" style="text-align:center;border-radius:5%;">
		  	<thead>
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">Patient</th>
			      <th scope="col">Physician</th>
			      <th scope="col">Schedule</th>
			      <th scope="col">Actions Tab</th>
			    </tr>
		  	</thead>
			<tbody>
			<c:forEach items="${onePhysician.patientCases}" var="patientCase">
			    <tr style="text-decoration:none; color:aquatext-align:center;">
			        <td><c:out value="${patientCase.id}" /></td>
			        <td style=""><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; 
			         	<c:choose>
		                    <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
				                color: rgb(211, 180, 355);
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
				                color:aqua;
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Wednesday' || patientCase.chiefComplaint == 'Thursday'}">
				                color:rgb(311, 180, 235);
		                    </c:when>
		                    <c:otherwise>
		                        color:aqua; color:rgb(201, 380, 235);
		                    </c:otherwise>
		               	</c:choose>"><c:out value="${patientCase.patient.patientFirstName} ${patientCase.patient.patientLastName}"/></a>
		            </td>
			        <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; color:silk"><c:out value="${onePhysician.firstName}" /></a></td>
		            		
		            <td><a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; 
						<c:choose>
		                    <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
				                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
				                color: rgb(412, 580, 515);  background: rgba(17, 64, 130, 0.9); 
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
				                color: rgb(412, 580, 515);  background: rgba(17, 104, 130, 0.9); 
		                    </c:when>
	                    <c:otherwise>
	                        color: rgb(21, 180, 255); color:pink;background: rgba(133, 64, 60, 0.9); 
	                    </c:otherwise>
	               		</c:choose>
	               			padding:15px; border-radius:5%; width:100%; height:100%;"
	               		<c:choose>
		                    <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
				            	class= "btn btn-warning"
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
				            	class= "btn btn-primary"
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
				            	class= "btn btn-danger"
		                    </c:when>
	                    <c:otherwise>
	                    	class= "btn btn-primary"  
	                    </c:otherwise>
	               		</c:choose>	
	               		><c:out value="${patientCase.chiefComplaint}s - ${patientCase.followUpConsultation}"/>
						<c:if test="${patientCase.physician.id == loggedInPhysician.id}">
							<form action="/mellowHealth/hospitalDashboard/edit/${patientCase.id}" method="get" style="margin:10px 0; ">
							    <input type="hidden" name="_method" value="edit">
							    <input class ="btn btn-warning" type="submit" value="Edit Case" style=" margin:10px 0; width: 100%; display:block; padding: 10px" >
							</form>
							<form action="/mellowHealth/hospitalDashboard/delete/${patientCase.id}" method="post">
							    <input type="hidden" name="_method" value="delete">
								<input class ="btn btn-danger" type="submit" value="Delete Case" style=" margin:10px 0; width: 100%; display:block; padding: 10px">
							</form></a>
						</c:if>
            		</td>

				    <c:choose>
					<c:when test="">
				    	<td class="d-flex justify-content-around btn-outline-primary" style="height:100%;">
						</td>
		 				</c:when>
						<c:otherwise>
						  <td class="table-dark" style=" 	
		        		<c:choose>
			            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
					         color: rgb(412, 580, 515);background:rgba(13, 64, 60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
					         color: rgb(412, 580, 515);background:rgba(13, 114, 160, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
					     	 color: rgb(412, 580, 515);background: rgba(133, 64, 60, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(21, 180, 255);color:pink;background:rgba(133, 64, 60, 0.9);
			             </c:otherwise>
			             </c:choose>">
			             <a class="btn-outline-primary" href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="	
		        		<c:choose>
				            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
						         color: rgb(412, 580, 515);background:rgba(13, 64, 60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
						         color: rgb(412, 580, 515);background:rgba(13, 114, 160, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
						     	 color: rgb(412, 580, 515);background: rgba(133, 64, 60, 0.9); 
				             </c:when>
				             <c:otherwise>
				                  color: rgb(21, 180, 255);color:pink;background:rgba(133, 64, 60, 0.9);
				             </c:otherwise>
			             </c:choose>align-items:center;text-decoration:none; color:pink;">
			            	 <c:out value="${patientCase.patientName}"/>: <c:out value="${patientCase.patient.patientCases.size()} Visits"/>: <p style="text-decoration:none;
			        		<c:choose>
				         	   <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
							         color: rgb(412, 580, 515);background:rgba(13, 64, 60, 0.9); 
				        	    </c:when>
				        	    <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
							         color: rgb(412, 580, 515);background:rgba(13, 114, 160, 0.9); 
				      	      </c:when>
			      	      	  <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
						     		 color: rgb(412, 580, 515);background: rgba(133, 64, 60, 0.9); 
			     	          </c:when>
			    	          <c:otherwise>
			    	              	color: rgb(21, 180, 255);color:pink;background:rgba(133, 64, 60, 0.9);
			    	          </c:otherwise>
			     	          </c:choose>
			     	        		border-radius:5%;">
			     	        <c:out value="${patientCase.chiefComplaint}" /> - <c:out value="${patientCase.followUpConsultation}"/></p>
			             	</a>
			            </td>
							</c:otherwise>
	            		</c:choose>
			    </tr>
				</c:forEach>
				</tbody>
				</table>
				<c:forEach items="${onePhysician.patientCases}" var="patientCase"> 
	        	<c:if test="${patientCase.physician.id == onePhysician.id}">   
					<div style="width: 100%; border-radius:5%;;text-align:center;color:azure;font-size:28px;background:rgba(11.3, 3.64, 12.60, 0.9);
			             ">
			            <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  class="btn btn-primary" style="text-decoration:none;text-align:center;    
				        <c:choose>
				            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
						         color: rgb(412, 580, 515);background: rgba(0.113, 0.64, 12.60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
						         color: rgb(412, 5.80, 51.5); background: rgba(1.3, 11.4, 16.60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
						     	 color: rgb(412, 580, 515); background: rgba(13.3, 1.64, 60, 0.9); background: rgba(11.3, 3.64, 12.60, 0.9);
				             </c:when>
				             <c:otherwise>
				                  color: rgb(501, 180, 225.5);background:rgba(0.3, 1.64, 41.60, 0.9); 
				          	</c:otherwise>
				          </c:choose>padding:10px;text-align:center;font-size:28px;width: 100%; border-radius:5%;">
							<p>Treatment Details for ${patientCase.patientName}'s ${patientCase.createdAt} Visit!</p>
				     	</a>
				   </div>
	        	</c:if>   
		    	<div class="form-group d-flex justify-content-space-between" style="background: rgba(48, 18, 32, 0.9); border-radius:5%;padding:10px;margin:5px 0;text-align:center;">
	               	<p style="text-align:center;width: 100%;
		         		<c:choose>
			                <c:when test="${patientCase.chiefComplaint.contains('AM')}">
					            border-radius:5%; padding:10px;
			                </c:when>
			                <c:otherwise>
			                    border-radius:5%; padding:10px;
			                </c:otherwise>
			                </c:choose>display:flex; justify-content:center;
			        		<c:choose>
				            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
						         color: rgb(412, 580, 515);background: rgba(0.13, 0.64, 60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
						         color: rgb(412, 5.80, 5.15); background: rgba(13, 14, 16.201, 0.9);background: rgba(13, 114, 160, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
						     	 color: rgb(412, 580, 515);background: rgba(117.8, 0.10, 10.101, 0.9)
				             </c:when>
				             <c:otherwise>
				              	 background: rgba(93, 164, 10.60, 0.9);background: rgba(333, 320.64, 320, 0.9);
				             </c:otherwise>
		             	  </c:choose>
		             	  ">
				         <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  style="text-decoration:none; 
				        	 <c:choose>
				                 <c:when test="${patientCase.chiefComplaint.contains('AM')}">
						        	font-weight:bold;color: rgb(130, 580, 325); 
			                    </c:when>
			                    <c:when test="${patientCase.chiefComplaint.contains('PM')}">
					            	 font-weight:bold;color: rgb(130, 581.0, 30.25);font-weight:bold; 
			                    </c:when>
		                        <c:otherwise>
			                        font-weight:bold;color: rgb(211, 118.0, 2.55)
			                    </c:otherwise>
			                  </c:choose>
			               			text-align:center;"><c:out value="${patientCase.patientName}"/>: <c:out value="${patientCase.chiefComplaint}"/> <c:out value="${patientCase.patient.race}"/>- <c:out value="${patientCase.patient.gender}"/>
		               </a>	
	               	  </p>
		        	   <p style="text-align:center;width: 100%;">
		        		    <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  style="text-decoration:none; 
			          			color:pink;text-align:center;">
			          			Treatment Plan: <c:out value="${patientCase.treatmentPlan}"/>
			          		</a>
			          	</p>
	        		<p style="border-radius:5%;display:flex; justify-content:center;text-align:center
		        		<c:choose>
				            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
						         color: rgb(412, 580, 515);background: rgba(0.13, 6.4, 60, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
						         color: rgb(412, 5.80, 5.15); background: rgba(13, 114, 160, 0.9); 
				            </c:when>
				            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
						         color: rgb(412, 580, 515);background: rgba(12.13, 0.64, 0.60, 0.9); 
				             </c:when>
				             <c:otherwise>
				                  color: rgb(21, 180, 255); color:pink;background: rgba(133, 0.64, 60, 0.9);
				             </c:otherwise>
			             </c:choose>
		             	text-align:center;width: 100%;display:flex;flex-direction:column;">
		             <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  style="text-decoration:none;
	        		 	<c:choose>
		                    <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
				                color: khaki;
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
				                color:rgb(41, 580, 511);
		                    </c:when>
		                    <c:otherwise>
		                        color: rgb(111, 180, 55); color:azure; background;rgba(133, 0.64, 60, 0.9);
		                    </c:otherwise>
	               		</c:choose>
	               		text-align:center;">Chief complaint: <c:out value="${patientCase.chiefComplaint}"/>- <c:out value="${patientCase.objectiveFindings}"/></a>
	               		</p>
				        <p style="text-align:center;width: 100%;display:flex;flex-direction:column;">
				            <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  style="text-decoration:none; 
				                <c:choose>
				                    <c:when test="${patientCase.chiefComplaint.contains('AM')}">
						                color: rgb(141, 580, 515);
				                    </c:when>
				                    <c:otherwise>
				                        color: rgb(211, 180, 255);
				                    </c:otherwise>
				                </c:choose>
				            text-align:center;display:flex;flex-direction:column;">Follow Up: <c:out value="${patientCase.followUpConsultation}"/>
				            </a>
				        </p>
						<p style="text-align:center;width:100%;">
						    <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}"  style="text-decoration:none;
						        <c:choose>
						            <c:when test="${patientCase.patient.patientInsuranceID lt 20}">
						                color: rgb(71, 180, 245);
						            </c:when>
						            <c:otherwise>
						                color: rgb(211, 180, 255);
						            </c:otherwise>
						        </c:choose>
						       ">Deductible: <c:out value="${patientCase.patient.patientInsuranceID}"/>
							     <p>
							       	<c:out value="Email: ${patientCase.patient.email}"/>
							     </p>
						    </a>
						</p>
			
				    </div>
					</c:forEach>
					<div class="form-group"style="
		    		<c:choose>
		            <c:when test="${onePhysician.patientCases.size() <= 2 }">
				     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 0.36, 0.9);
		            </c:when>
		            <c:when test="${onePhysician.patientCases.size() % 2 == 1}">
				     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 3.6, 0.9); 
		            </c:when>
		            <c:when test="${onePhysician.patientCases.size() % 2 == 0}">
				     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 3.6, 0.9); 
		            </c:when>
		            <c:otherwise>
		                  color: rgb(21, 180, 255);background: rgba(7, 100, 8, 0.9);
		             </c:otherwise>
		             </c:choose>
		             display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0;">
					<c:choose>
					<c:when test="${onePhysician.patientCases.size() < 1}">
					 <h1 style="width: 100%"><a style="
					<c:choose>
			            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
					         color: rgb(321, 180, 122.55);background:rgba(13, 1.64, 1.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
					         color: rgb(321, 180, 122.55);background: rgba(1.3, 11.4, 16.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
					     	 color: rgb(321, 180, 122.55);background: rgba(13.3, 1.64, 60, 0.9);background:rgba(13.3, 1.64, 60, 0.9);
			             </c:when>
			             <c:otherwise>
			                 color: rgb(321, 180, 122.55);background: rgba(11.8, 28, 0.80, 0.9); background: rgba(22.113, 1.64, 111.60, 0.9); 
			             </c:otherwise>
			             </c:choose> 
			            	 margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/patientCases/newPatientCase" class="btn btn-danger">There are no admitted Patients in Dr. ${onePhysician.firstName}'s Care Yet!</a></h1>
						</c:when>
						<c:when test="${onePhysician.patientCases.size() == 1}">
					 <h1 style="width: 100%"><a style="
					 <c:choose>
			            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
					         color: rgb(321, 180, 122.55);background:rgba(13, 1.64, 1.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
					         color: rgb(321, 180, 122.55);background: rgba(1.3, 11.4, 16.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
					     	 color: rgb(321, 180, 122.55);background: rgba(13.3, 1.64, 60, 0.9);background:rgba(13.3, 1.64, 60, 0.9);
			             </c:when>
			             <c:otherwise>
			                 color: rgb(321, 180, 122.55);background: rgba(11.8, 28, 0.80, 0.9); background: rgba(22.113, 1.64, 111.60, 0.9); 
			             </c:otherwise>
			             </c:choose> 
			            	 margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/physicians/${onePhysician.id }" class="btn btn-danger">There is only <c:out value="${onePhysician.patientCases.size()}"/> patient in your care Dr. ${onePhysician.firstName}- 
							<c:forEach items="${onePhysician.patientCases}" var="patientCase">${patientCase.patientName} chief complaint ${patientCase.chiefComplaint} ${patientCase.patient.race} ${patientCase.patient.gender}</c:forEach>!</a></h1>
						</c:when>
						<c:otherwise>
		 					<h1 style="width: 100%"><a style="
		        		<c:choose>
			            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
					         color: rgb(412, 580, 515);background: rgba(13, 1.64, 1.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
					         color: rgb(412, 5.80, 51.5); background: rgba(1.3, 11.4, 16.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
					     	 color: rgb(412, 580, 515); background: rgba(13.3, 1.64, 60, 0.9);background:rgba(13.3, 1.64, 60, 0.9);
			             </c:when>
			             <c:otherwise>
			                  color: rgb(421, 180, 122.55);background: rgba(11.8, 28, 0.80, 0.9); background: rgba(2.113, 10.64, 1.60, 0.9); 
			             </c:otherwise>
			             </c:choose> 
			             	  margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/physicians/${onePhysician.id}"  class="btn btn-success">Total Patients In Your Care Dr. ${onePhysician.firstName}'s: <c:out value="${onePhysician.patientCases.size()}"/><p style=""> Admission Details: <c:out value="${onePhysician.patientCases.size()}"/>  
							<c:forEach items="${onePhysician.patientCases}" var="patientCase">Patients: ${patientCase.patientName} chief complaint ${patientCase.chiefComplaint} ${patientCase.patient.race} ${patientCase.patient.gender}</c:forEach>!</p></a></h1>
						 </c:otherwise>
						 
					     </c:choose>
					     </div>
	<div class="form-group" style="display:flex;justify-content:space-between;flew-wrap:wrap;align-items:center;background: rgba(78, 10, 0.10, 0.9);text-align:center; border-radius:5%;padding:12px;margin:10px 0">
		<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-warning" style="margin: 0 15px 0 0;width:100%;display:block;padding:10px;font-weight:bold;">ADD A NEW VISIT!</a></h1>
		<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/physicians" class="btn btn-primary" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">VIEW PROFILE!</a></h1>
		<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/physicians/logout" class="btn btn-danger" style="width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
		<form action="/mellowHealth/physicians" method="get" style="display:flex;justify-content:space-between;flew-wrap:wrap;">
			<h1 style="display:flex;justify-content:space-between;flew-wrap:wrap;"><input type="submit" value="PHYSICIAN CLUB ACCESS!" class="btn btn-success" style="display:flex;justify-content:space-between;flew-wrap:wrap;margin:15px 10px 0px 0px;width:100%;padding:10px;background:rgba(0.531, 0.64, 16, 0.9);"/></h1>
		</form>
	</div>	
	<div class="form-group"style="display:flex; justify-content:space-between;background:rgba(7.8, 0.10, 10.101, 0.9); border-radius:5%;padding:10px;margin:10px 0">
	 	<h1 style="width: 100%"><a style=" margin:10px 0; width: 100%; display:block; padding: 10px" href="/mellowHealth/hospitalDashboard/patientCases" class="btn btn-primary">VIEW MORE PATIENT CASES!</a></h1>
	 	<h1 style="width:100%;margin:10px;"><a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-warning" style="width:100%;display:block;padding:10px;font-weight:bold;">CREATE A NEW CASE!</a></h1>	
		<h1 style=" width:100%;margin:10px 0;"><a href="/mellowHealth/physicians/logout" class="btn btn-danger"style="width:100%;display:block;padding:10px">LOGOUT HERE!</a></h1>
	</div>
	<div class="form-group"style="
	    		<c:choose>
	            <c:when test="${onePhysician.patientCases.size() <= 2 }">
			     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 0.36, 0.9);
	            </c:when>
	            <c:when test="${onePhysician.patientCases.size() % 2 == 1}">
			     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 3.6, 0.9); 
	            </c:when>
	            <c:when test="${onePhysician.patientCases.size() % 2 == 0}">
			     	 color: rgb(412, 580, 515); background: rgba(10.531, 10.64, 3.6, 0.9); 
	            </c:when>
	            <c:otherwise>
	                  color: rgb(21, 180, 255);background: rgba(7, 100, 8, 0.9);
	             </c:otherwise>
	             </c:choose>
	             display:flex; justify-content:space-between;align-items:center; border-radius:5%;padding:10px;margin:10px 0;">
	
				 <h1 style="width:100%"><a style=" margin:10px 5px 10px 0; width: 100%; display:block; padding: 10px"  href="/mellowHealth/physicians" class="btn btn-success">GO BACK!</a></h1>	
			     <h1 style="width:100%"><a style="background: rgba(68, 8, 120, 0.9); margin:10px 5px; width: 99%; display:block; padding: 10px"  href="/mellowHealth/physicians/${loggedInPhysician.id }" class="btn btn-success">Dr. ${loggedInPhysician.firstName} Physician Portal Access!</a></h1>
	</div>
</body>
</html>