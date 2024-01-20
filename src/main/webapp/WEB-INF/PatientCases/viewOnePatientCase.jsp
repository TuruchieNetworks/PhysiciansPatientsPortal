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
<title>Mellow Health Patient Case Portal!</title>
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
				<c:when test="${patientCase.physician.id == loggedInPhysician.id}">
					<h1 style="text-align:center;border-bottom: 2px solid chocolate;color: brown; font-family:fantasy;border-radius:5%;background:rgba(10.2, 3.3, 3.6, 0.9);margin-top:5px;"><a style="width: 100%; display:block; padding:10px;color:aqua;text-decoration:none;"  href="/mellowHealth/physicians/${loggedInPhysician.id}">Welcome To Your Physician Portal <c:out value="Dr. ${loggedInPhysician.firstName}"/>!</a></h1>
				</c:when>
				<c:otherwise>
    				<h1 style="text-align:center;border-bottom: 2px solid chocolate;color: brown; font-family:fantasy;border-radius:5%;background: rgba(7.8, 0.10, 10.101, 0.9)"><a style="width: 100%; display:block; padding: 8px;color:aquamarine;text-decoration:none;" href="/mellowHealth/physicians">Welcome To <c:out value="Dr. ${patientCase.physician.firstName}" />'s Patients Cases Portal <c:out value="Dr. ${loggedInPhysician.firstName}"/>!</a></h1>
				</c:otherwise>
			</c:choose>
		<table class="table table-dark" style="text-align:center;border-radius:5%;">
		  	<thead>
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">Treatment Plan</th>
			      <th scope="col">Physician</th>
			      <th scope="col">Follow Up Details</th>
			      <th scope="col">Actions Tab</th>
			    </tr>
		  	</thead>
			<tbody>
			    <tr style="text-decoration:none; color:aqua;text-align:center;">
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
		            </c:choose>"><c:out value="${patientCase.objectiveFindings}: ${patientCase.treatmentPlan}"/></a>
		            </td>

			        <td><a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none; color:silk;">
			        		<c:out value="Dr. ${patientCase.physician.firstName}" />
			        	</a>
			        </td>

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
	               		><c:out value="${patientCase.chiefComplaint}: ${patientCase.followUpConsultation}"/></a>
            		</td>

				    <c:choose>
					<c:when test="${patientCase.physician.id == loggedInPhysician.id}">
					    <td class="d-flex justify-content-around" style="height:100%;
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
						    <h1 style="display:flex;flex-wrap:wrap;align-items:center;">
								<form action="/mellowHealth/hospitalDashboard/patientCases/edit/${patientCase.id}" method="get" style="margin:0 10px;width:100%;">
								    <input type="hidden" name="_method" value="edit">
								    <input class ="btn btn-warning" type="submit" value="Edit Case" style=" margin:10px 0; width: 100%; display:block; padding: 10px;width:100%;" >
								</form>
								<form action="/mellowHealth/hospitalDashboard/patientCases/delete/${patientCase.id}" method="post" style="margin:0 10px;width:100%;">
								    <input type="hidden" name="_method" value="delete">
									<input class ="btn btn-danger" type="submit" value="Delete Case" style=" margin:10px 0; width: 100%; display:block; padding: 10px;width:100%">
								</form>
							</h1>
						</td>
			 		</c:when>
					<c:otherwise>
						  <td class="table-dark" style="height:100%; 	
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
			             <a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" style="text-decoration:none; color:pink;">
			            	 <c:out value="${patientCase.patientName}"/>: 
			            	 <p style="text-decoration:none;
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
				     	        <c:out value="${patientCase.chiefComplaint}" /> - <c:out value="${patientCase.followUpConsultation}"/>
			     	        </p>
			             	</a>
			            </td>
							</c:otherwise>
	            		</c:choose>
			    </tr>
				</tbody>
				</table>
	        	<c:if test="${patientCase.physician.id == loggedInPhysician.id}">   
					<a href="/mellowHealth/hospitalDashboard/patientCases/${patientCase.id}" class="btn btn-primary" style="text-decoration:none; color:azure;text-align:center;width: 100%;">
					<h1 style="
			        <c:choose>
			            <c:when test="${patientCase.chiefComplaint == 'Saturday' || patientCase.chiefComplaint == 'Sunday'}">
					         color: rgb(412, 580, 515);background: rgba(111.3, 13.64, 12.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Monday' || patientCase.chiefComplaint == 'Tuesday'}">
					         color: rgb(412, 5.80, 51.5); background: rgba(1.3, 11.4, 16.60, 0.9); 
			            </c:when>
			            <c:when test="${patientCase.chiefComplaint == 'Thursday' || patientCase.chiefComplaint == 'Friday'}">
					     	 color: rgb(412, 580, 515); background: rgba(13.3, 1.64, 60, 0.9); background: rgba(11.3, 3.64, 12.60, 0.9); 
			             </c:when>
			             <c:otherwise>
			                  color: rgb(201, 180, 255);background:rgba(4.3, 1.64, 41.60, 0.9); 
			          </c:otherwise>
			          </c:choose>
			             width: 100%; border-radius:5%;padding:15px;text-align:center;color:azure;font-size:28px
			             ">Treatment Plan for ${patientCase.patientName}'s Visit!</h1>
				     </a>
	        	</c:if>   
		    	<div class="form-group d-flex" style="background: rgba(48, 18, 32, 0.9); border-radius:5%;padding:10px;margin:5px 0;text-align:center;">
		        	<p class="btn btn-outline-warning " style="text-align:center;
		         		<c:choose>
			                <c:when test="${patientCase.chiefComplaint.contains('AM')}">
					            border-radius:5%; padding:5px 0;
			                </c:when>
			                <c:otherwise>
			                    border-radius:5%; padding:5px 0;
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
						     	 color: rgb(412, 580, 515);background: rgba(7.8, 0.10, 10.101, 0.9)
				             </c:when>
				             <c:otherwise>
				              	 background: rgba(93, 164, 10.60, 0.9);background: rgba(133, 0.64, 60, 0.9);
				             </c:otherwise>
		             	</c:choose>text-align:center;margin:5px 15px 15px 15px;">Patient:
			            <a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none; 
		        	    <c:choose>
		                    <c:when test="${patientCase.chiefComplaint.contains('AM')}">
				                color: rgb(130, 580, 325); 
		                    </c:when>
		                    <c:when test="${patientCase.chiefComplaint.contains('PM')}">
				                color: rgb(130, 581.0, 30.25);font-weight:bold; 
		                    </c:when>
		                    <c:otherwise>
		                        color: rgb(211, 18.0, 2.55)
		                    </c:otherwise>
		                  </c:choose>
		               			text-align:center;"><c:out value="${patientCase.patientName}"/>
	                	</a>
		               </p>
		        	   <p class="btn btn-outline-danger " style="text-align:center;margin:5px 15px 15px 15px;">Chief Complaint: 
		        		    <a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none; 
			          			color:pink;text-align:center;">
			          			<c:out value="${patientCase.chiefComplaint}"/>
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
		             	text-align:center;width:100%;display:flex;flex-direction:column;">
		             <a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none;
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
	               		text-align:center;">Follow up Schedule: <c:out value="${patientCase.followUpConsultation}"/></a>
	               		</p>
				        <p class="btn btn-outline-purple" style="">
				            <a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none; 
				                <c:choose>
				                    <c:when test="${patientCase.chiefComplaint.contains('AM')}">
						                color: rgb(141, 580, 515);
				                    </c:when>
				                    <c:otherwise>
				                        color: rgb(211, 180, 255);
				                    </c:otherwise>
				                </c:choose>
				            text-align:center;display:flex;flex-direction:column;"><c:out value="${patientCase.followUpConsultation}"/>: ${patientCase.treatmentPlan}: 
				            </a>
				        </p>
						    <a href="/mellowHealth/physicians/${patientCase.physician.id}" style="text-decoration:none;
						        <c:choose>
						            <c:when test="${patientCase.patient.patientInsuranceID lt 20}">
						                color: rgb(71, 180, 245);
						            </c:when>
						            <c:otherwise>
						                color: rgb(211, 180, 255);
						            </c:otherwise>
						        </c:choose>
						        ">
							     <p class="btn btn-outline-warning" style="text-align:center;display:flex; justify-content:space-between;flex-wrap:wrap;">
							       Deductible: <c:out value="${patientCase.patient.patientInsuranceID}"/>	<c:out value="Patient Email: ${patientCase.patient.email}"/>
							     </p>
						</a>
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
					<c:choose>
						<c:when test="${onePhysician.patientCases.size() < 1}">
						 	<h1 style="width: 100%"><a class="btn btn-danger" style="
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
				         		margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase">There are no admitted Patients in Dr. ${patientCase.physician.firstName}'s Care Yet!</a>
				         	</h1>
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
				              margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/physicians/${loggedInPhysician.id }" class="btn btn-danger">You Have Only One Patient In Your Care Dr. ${patientCase.physician.firstName}- Patients Details:<c:out value="${patientCase.patientName}"/> chief complaint <c:out value="${patientCase.chiefComplaint}"/> <c:out value="${patientCase.patient.race}"/> <c:out value="${patientCase.patient.gender}"/>: <c:out value="${patientCase.physician.patientCases.size()}"/> Admissions!</a></h1>
						</c:when>
						<c:otherwise>
			 				<h1 style="width: 100%">
				 				<a style="
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
					             	  margin:10px 0;width:100%;display:block;padding:10px;font-weight:bold;font-size:18px;" href="/mellowHealth/physicians/${patientCase.physician.id }" class="btn btn-success">Total Patients in Dr. ${patientCase.physician.firstName}: <c:out value="${patientCase.physician.patientCases.size()}"/>
					             	 <c:out value="${patientCase.patientName}"/> chief complaint <c:out value="${patientCase.chiefComplaint}"/> <c:out value="${patientCase.patient.race}"/> <c:out value="${patientCase.patient.gender}"/>: <c:out value="${patientCase.createdAt}"/> Admissions!
					             </a>
				         	 </h1>
						 </c:otherwise>
					  </c:choose>
				</div>
				<div class="form-group" style="display:flex;justify-content:space-between;flew-wrap:wrap;align-items:center;background: rgba(78, 10, 0.10, 0.9);text-align:center; border-radius:5%;padding:12px;margin:10px 0">
					<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-warning" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">Add New Case!</a></h1>
					<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/physicians" class="btn btn-primary" style=" margin: 0 15px 0 0; width: 100%; display:block; padding: 10px">VIEW PROFILE!</a></h1>
					<h1 style=" margin: 10px 15px 0 0; width: 100%"><a href="/mellowHealth/physicians/logout" class="btn btn-danger" style="width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
					<form action="/mellowHealth/physicians" method="get" style="display:flex;justify-content:space-between;flew-wrap:wrap;">
						<h1 style="display:flex;justify-content:space-between;flew-wrap:wrap;"><input type="submit" value="PHYSICIAN CLUB ACCESS!" class="btn btn-outline-primary" style="display:flex;justify-content:space-between;flew-wrap:wrap;margin:15px 10px 0px 0px;width:100%;padding:10px;background:rgba(0.531, 0.64, 16, 0.9);"/></h1>
					</form>
				</div>	
				<div class="form-group"style="display:flex; justify-content:space-between;background:rgba(7.8, 0.10, 10.101, 0.9); border-radius:5%;padding:10px;margin:10px 0">
				 	<h1 style="width: 100%"><a style="margin:10px 0;width:100%;display:block;padding:10px" href="/mellowHealth/hospitalDashboard/patientCases" class="btn btn-primary">VIEW MORE PATIENT CASES!</a></h1>
				 	<h1 style="width:100%;margin:10px;"><a href="/mellowHealth/hospitalDashboard/patientCases/newPatientCase" class="btn btn-warning" style="width:100%; display:block; padding: 10px">CREATE A NEW CASE!</a></h1>	
					<h1 style=" width:100%;margin:10px 0;"><a href="/mellowHealth/physicians/logout" class="btn btn-danger"style="width: 100%; display:block; padding: 10px">LOGOUT HERE!</a></h1>
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