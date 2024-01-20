package com.turuchie.physiciansportal.services;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turuchie.physiciansportal.models.PatientCase;
import com.turuchie.physiciansportal.repositories.PatientCaseRepository;
import com.turuchie.physiciansportal.repositories.PhysicianRepository;

@Service
public class PatientCaseService {
	@Autowired
	private PatientCaseRepository patientCaseRepo;
		
	public PatientCaseService(PatientCaseRepository patientCaseRepo, PhysicianRepository physicianRepo) {
		this.patientCaseRepo = patientCaseRepo;
	}
	
	public PatientCase getOne(Long id) {
		Optional<PatientCase> patientCase = patientCaseRepo.findById(id);
		return patientCase.isPresent() ? patientCase.get() : null;
	}

	public PatientCase getOnePatientCaseName(String patientName) {
		Optional<PatientCase> patientCase = patientCaseRepo.findByPatientName(patientName);
		return patientCase.isPresent() ? patientCase.get() : null;
	}

	public List<PatientCase> getAll() {
		return (List<PatientCase>) patientCaseRepo.findAll();
	}

	public PatientCase create(PatientCase patientCase) {
		return patientCaseRepo.save(patientCase);
	}

	public PatientCase update(PatientCase patientCase) {
		return patientCaseRepo.save(patientCase);
	}

	public void delete(Long id) {
		patientCaseRepo.deleteById(id);
	}

//	*************************create physician with patientCase logic****************************
	public PatientCase getPatientCaseByName(String patientName) {
	    Optional<PatientCase> patientCase = patientCaseRepo.findByPatientName(patientName);
	    return patientCase.orElse(null);
	}

	public PatientCase createPatientCaseIfNotInDatabase(String patientCaseName) {
	    PatientCase existingPatientCase = getPatientCaseByName(patientCaseName);
	    if (existingPatientCase == null) {
	        PatientCase newPatientCase = new PatientCase();
	        newPatientCase.setPatientName(patientCaseName);
	        return patientCaseRepo.save(newPatientCase);
	    }
	    return existingPatientCase;
	}

//
//	public Physician createPhysicianWithPatientCase(Physician physician) {
//		String[] patientCasesFromForm = physician.getFormPatientCases().split(",");
//		ArrayList<PatientCase> patientCasesToBeAdded = new ArrayList<PatientCase>();
//		for(String patientCase: patientCasesFromForm)
//		{
//			patientCasesToBeAdded.add(this.createPatientCaseIfNotInDatabase(patientCase));
//		}
//		physician.setPatientCases(patientCasesToBeAdded);
//		return physicianRepo.save(physician);
//	}
}