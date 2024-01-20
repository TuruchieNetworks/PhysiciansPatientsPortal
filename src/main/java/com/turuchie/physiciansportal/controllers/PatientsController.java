package com.turuchie.physiciansportal.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.turuchie.physiciansportal.models.LoginPatient;
import com.turuchie.physiciansportal.models.Patient;
import com.turuchie.physiciansportal.services.PatientService;
import com.turuchie.physiciansportal.services.PhysicianService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/mellowHealth/patientsPortal")
public class PatientsController {

		@Autowired
		private PatientService patientServ;
		
		@Autowired
		private PhysicianService physicianServ;
	
		public PatientsController() {
			// TODO Auto-generated constructor stub
		}
	
		@GetMapping("/patients/{id}")
		public String showOnePatient(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long patientId = (Long) session.getAttribute("patient_id");
	    if (patientId == null){
	    	return "redirect:/mellowHealth/patientsPortal/login";
	    } 
	    
		Patient loggedInPatient = patientServ.getOne(patientId);
		Patient onePatient = patientServ.getOne(id);
		if (onePatient == null) {
	        return "redirect:/mellowHealth/patientsPortal/login";
	    }
		
		model.addAttribute("loggedInPatient", loggedInPatient);
		model.addAttribute("onePatient", onePatient);
		return "/Patients/viewOnePatient.jsp";
		}


		@GetMapping("/patients")
		public String showAllPatients(Model model, HttpSession session) {
		Long patientId = (Long) session.getAttribute("patient_id");
	    if (patientId == null){
	    	return "redirect:/mellowHealth/patientsPortal/login";
	    } 
	    
		Patient loggedInPatient = patientServ.getOne(patientId);
		model.addAttribute("loggedInPatient", loggedInPatient);
		model.addAttribute("allPatients", patientServ.findAll());
		model.addAttribute("allPhysicians", physicianServ.findAll());
		return "Patients/viewAllPatients.jsp";
		}

		@GetMapping("/login")
		public String defaultLoginRegistration(@ModelAttribute("patient") Patient patient, @ModelAttribute("loginPatient") LoginPatient loginPatient) {
			return "/Patients/LoginPatient.jsp";
		}	
		
		@GetMapping("/register")
		public String regPatient(@ModelAttribute("patient") Patient patient) {
			
			return "/Patients/registerPatient.jsp";
		}
		
		@PostMapping("/process/register")
		public String processRegister(@Valid @ModelAttribute("patient") Patient patient,
			BindingResult result, Model model, HttpSession session) {
			// reject if email is taken
		if(patientServ.getOne(patient.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Patient Already Exits!");
		}
			// Check if email is already registered
		Patient existingPatient = patientServ.getOne(patient.getEmail());
		if (existingPatient != null) {
		    result.rejectValue("email", "Unique", "Patient with this email already exists!");
		}
		    

		//reject if passwords dont match
		if(!patient.getPassword().equals(patient.getConfirmPassword())) {
			result.rejectValue("password", "Match", "Passwords Must Match!");
		}

		//redirect if errors
		if(result.hasErrors() || result.hasFieldErrors("dateOfBirth")) {
			model.addAttribute("loginPatient", new LoginPatient());
			return "Patients/registerPatient.jsp";
		}

		Patient newPatient = patientServ.registerPatient(patient);
		session.setAttribute("patient_id", newPatient.getId());
		
		return "redirect:/mellowHealth/patientsPortal/patients";
	}
	
		@PostMapping("/process/login")
		public String processLoginPatient(@Valid @ModelAttribute("loginPatient") LoginPatient loginPatient,
			BindingResult result, Model model, HttpSession session) {
			Patient loggingPatient = patientServ.login(loginPatient, result);
			if (loggingPatient == null || result.hasErrors()) {
			    model.addAttribute("patient", new Patient());
			    return "Patients/LoginPatient.jsp";
			}
	
			session.setAttribute("patient_id", loggingPatient.getId());
			return "redirect:/mellowHealth/patientsPortal/patients";
		}
	
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/mellowHealth/patientsPortal/login";
		}
}