package com.turuchie.physiciansportal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.turuchie.physiciansportal.models.PhysiciansPatient;
import com.turuchie.physiciansportal.repositories.PhysicianRepository;
import com.turuchie.physiciansportal.repositories.PhysiciansPatientRepository;

@Service
public class PhysiciansPatientService {
	
	@Autowired
	private PhysiciansPatientRepository physiciansPatientRepo;
	
	@SuppressWarnings("unused")
	@Autowired
	private PhysicianRepository physicianRepo;
	
	public PhysiciansPatientService(PhysiciansPatientRepository physiciansPatientRepo, PhysicianRepository physicianRepo) {
		this.physiciansPatientRepo = physiciansPatientRepo;
	}
	
	public PhysiciansPatient getOne(Long id) {
		Optional<PhysiciansPatient> physiciansPatient = physiciansPatientRepo.findById(id);
		return physiciansPatient.isPresent() ? physiciansPatient.get() : null;
	}

	public PhysiciansPatient getOnePhysiciansPatientName(String patientName) {
		Optional<PhysiciansPatient> physiciansPatient = physiciansPatientRepo.findByPatientName(patientName);
		return physiciansPatient.isPresent() ? physiciansPatient.get() : null;
	}

	public List<PhysiciansPatient> getAll() {
		return (List<PhysiciansPatient>) physiciansPatientRepo.findAll();
	}

	public PhysiciansPatient create(PhysiciansPatient physiciansPatient) {
		return physiciansPatientRepo.save(physiciansPatient);
	}

	public PhysiciansPatient update(PhysiciansPatient physiciansPatient) {
		return physiciansPatientRepo.save(physiciansPatient);
	}

	public void delete(Long id) {
		physiciansPatientRepo.deleteById(id);
	}

//	*************************create physician with physiciansPatient logic****************************
	
	public PhysiciansPatient getPhysiciansPatientByName(String patientName) {
	    Optional<PhysiciansPatient> physiciansPatient = physiciansPatientRepo.findByPatientName(patientName);
	    return physiciansPatient.orElse(null);
	}

	public PhysiciansPatient createPhysiciansPatientIfNotInDatabase(String physiciansPatientName) {
	    PhysiciansPatient existingPhysiciansPatient = getPhysiciansPatientByName(physiciansPatientName);
	    if (existingPhysiciansPatient == null) {
	        PhysiciansPatient newPhysiciansPatient = new PhysiciansPatient();
	        newPhysiciansPatient.setPatientName(physiciansPatientName);
	        return physiciansPatientRepo.save(newPhysiciansPatient);
	    }
	    return existingPhysiciansPatient;
	}

//
//	public Physician createPhysicianWithPhysiciansPatient(Physician physician) {
//		String[] physiciansPatientsFromForm = physician.getFormPhysiciansPatients().split(",");
//		ArrayList<PhysiciansPatient> physiciansPatientsToBeAdded = new ArrayList<PhysiciansPatient>();
//		for(String physiciansPatient: physiciansPatientsFromForm)
//		{
//			physiciansPatientsToBeAdded.add(this.createPhysiciansPatientIfNotInDatabase(physiciansPatient));
//		}
//		physician.setPhysiciansPatients(physiciansPatientsToBeAdded);
//		return physicianRepo.save(physician);
//	}
}