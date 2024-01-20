package com.turuchie.physiciansportal.models;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "physicians_patients")
public class PhysiciansPatient {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    private List<String> chiefComplaint;

    @NotBlank(message = "Patient name cannot be blank!")
    @Size(min = 2, max = 150, message = "Patient name needs to be between 2 and 150 characters!")
    private String startDate;

    @NotBlank(message = "Patient name cannot be blank!")
    @Size(min = 2, max = 150, message = "Patient name needs to be between 2 and 150 characters!")
    private String patientName;
    
    @NotBlank(message = "Physician Treatment Plan must be between 3 and 500 characters!")
    @Size(min = 3, max = 500, message = "Please provide treatment plan for this patient's visit!")
    private String treatmentPlan;

    @NotBlank(message = "Physician Medications must be between 3 and 500 characters!")
    @Size(min = 3, max = 500, message = "Please provide medication for this patient's visit!")
    private String patientMedication;

    @NotBlank(message = "Follow ups must be between 3 and 500 characters!")
    @Size(min = 3, max = 500, message = "Please provide follow-up consultations for this patient's visit!")
    private String followUpConsultation;

    @Column(updatable = false)
    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    @ManyToOne
    @JoinColumn(name = "physician_id")
    private Physician physician;
    
    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    public PhysiciansPatient() {
    } 
    
	public Physician getPhysician() {
		return physician;
	}

	public void setPhysician(Physician physician) {
		this.physician = physician;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getTreatmentPlan() {
        return treatmentPlan;
    }

    public void setTreatmentPlan(String treatmentPlan) {
        this.treatmentPlan = treatmentPlan;
    }

    public String getPatientMedication() {
        return patientMedication;
    }

    public void setPatientMedication(String patientMedication) {
        this.patientMedication = patientMedication;
    }

    public String getFollowUpConsultation() {
        return followUpConsultation;
    }

    public void setFollowUpConsultation(String followUpConsultation) {
        this.followUpConsultation = followUpConsultation;
    }

    public List<String> getChiefComplaint() {
        return chiefComplaint;
    }

    public void setChiefComplaint(List<String> chiefComplaint) {
        this.chiefComplaint = chiefComplaint;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }
}
