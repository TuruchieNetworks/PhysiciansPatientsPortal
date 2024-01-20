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

import com.turuchie.physiciansportal.models.LoginPhysician;
import com.turuchie.physiciansportal.models.Physician;
import com.turuchie.physiciansportal.services.PatientCaseService;
import com.turuchie.physiciansportal.services.PatientService;
import com.turuchie.physiciansportal.services.PhysicianService;
import com.turuchie.physiciansportal.utils.UtilInputConverter;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/mellowHealth")
public class PhysicianController {
	@Autowired
	private PhysicianService physicianServ;

	@Autowired
	private PatientCaseService patientCaseServ;

	@Autowired
	public PhysicianController(PatientCaseService patientCaseServ,
		PatientService PatientServ,
		PhysicianService physicianServ) {
        this.patientCaseServ = patientCaseServ;
        this.physicianServ = physicianServ;
	}
	
	public PhysicianController() {}

	// Helper method to validate physician and get physician id
    private Long validatePhysicianAndGetId(HttpSession session) {
	   Long physicianId = (Long) session.getAttribute("physician_id");
	   return physicianId;
	}

	// Helper method to set physician attributes in the model
	private Physician setPhysicianAttributes(Model model, Long physicianId) {
	    Physician loggedInPhysician = physicianServ.getOne(physicianId);
	    model.addAttribute("loggedInPhysician", loggedInPhysician);
	    return loggedInPhysician;
	}

	@GetMapping("/physicians/{id}")
	public String showOnePhysician(@PathVariable("id") Long id, Model model, HttpSession session) {
	Long physicianId = validatePhysicianAndGetId(session);
	    if (physicianId == null){
	    	return "redirect:/mellowHealth/physicians/login";
	    }
	    Physician loggedInPhysician = setPhysicianAttributes(model, physicianId);
		Physician onePhysician = physicianServ.getOne(id);
		if (onePhysician == null) {
	        return "redirect:/mellowHealth/physicians/login";
	    }
		model.addAttribute("loggedInPhysician", loggedInPhysician);
		model.addAttribute("onePhysician", onePhysician);
		model.addAttribute("allPatientCases", patientCaseServ.getAll());
		return "/Physicians/viewOnePhysician.jsp";
		}

		@GetMapping("/physicians")
		public String showAllPhysicians(Model model, HttpSession session) {
		Long physicianId = (Long) session.getAttribute("physician_id");
	    if (physicianId == null){
	    	return "redirect:/mellowHealth/physicians/login";
	    }
		Physician loggedInPhysician = physicianServ.getOne(physicianId);
		model.addAttribute("loggedInPhysician", loggedInPhysician);
		model.addAttribute("allPhysicians", physicianServ.findAll());
		model.addAttribute("allPatientCases", patientCaseServ.getAll());
		return "Physicians/viewAllPhysicians.jsp";
	}

	@GetMapping("/physicians/login")
	public String defaultLoginRegistration(@ModelAttribute("physician") Physician physician, @ModelAttribute("loginPhysician") LoginPhysician loginPhysician) {
		return "/Physicians/PhysiciansLoginRegistration.jsp";
	}	
	
	@GetMapping("/physicians/login/register")
	public String loginRegPhysician(@ModelAttribute("physician") Physician physician, @ModelAttribute("loginPhysician") LoginPhysician loginPhysician) {
		return "/Physicians/PhysiciansLoginRegistration.jsp";
	}
		
	@PostMapping("/process/physicians/register")
	public String processRegister(@Valid @ModelAttribute("physician") Physician physician, BindingResult result, Model model, HttpSession session) {
		// reject if email is taken
		if(physicianServ.getOne(physician.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Physician Already Exits!");
		}
		// Check if email is already registered
		Physician existingPhysician = physicianServ.getOne(physician.getEmail());
		if (existingPhysician != null) {
		    result.rejectValue("email", "Unique", "Physician with this email already exists!");
		}
	
		//reject if passwords dont match
		if(!physician.getPassword().equals(physician.getConfirm())) {
			result.rejectValue("password", "Match", "Passwords Must Match!");
		}
	
		//redirect if errors
		if(result.hasErrors()) {
			model.addAttribute("loginPhysician", new LoginPhysician());
			return "Physicians/PhysiciansLoginRegistration.jsp";
		}
		Physician newPhysician = physicianServ.registerPhysician(physician);
		session.setAttribute("physician_id", newPhysician.getId());
		return "redirect:/mellowHealth/physicians";
	}

	@PostMapping("/process/physicians/login")
	public String processLoginPhysician(@Valid @ModelAttribute("loginPhysician") LoginPhysician loginPhysician, 
		BindingResult result, Model model, HttpSession session) {
		Physician loggingPhysician = physicianServ.login(loginPhysician, result);
		if (loggingPhysician == null || result.hasErrors()) {
		    model.addAttribute("physician", new Physician());
		    return "/Physicians/PhysiciansLoginRegistration.jsp";
		}
		session.setAttribute("physician_id", loggingPhysician.getId());
		return "redirect:/mellowHealth/physicians";
	}
	
	@GetMapping("/physicians/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/mellowHealth/physicians/login";
	}

}