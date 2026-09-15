package com.sunrise.dental.model;

public class Treatment {

    private int treatmentId;
    private String treatmentName;
    private String description;
    private double treatmentFee;
    private String status;

    // Default constructor
    public Treatment() {
    }

    // Parameterized constructor
    public Treatment(int treatmentId, String treatmentName, String description,
                     double treatmentFee, String status) {
        this.treatmentId = treatmentId;
        this.treatmentName = treatmentName;
        this.description = description;
        this.treatmentFee = treatmentFee;
        this.status = status;
    }

    public int getTreatmentId() {
        return treatmentId;
    }

    public void setTreatmentId(int treatmentId) {
        this.treatmentId = treatmentId;
    }

    public String getTreatmentName() {
        return treatmentName;
    }

    public void setTreatmentName(String treatmentName) {
        this.treatmentName = treatmentName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getTreatmentFee() {
        return treatmentFee;
    }

    public void setTreatmentFee(double treatmentFee) {
        this.treatmentFee = treatmentFee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}