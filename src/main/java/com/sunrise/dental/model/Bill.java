package com.sunrise.dental.model;

import java.time.LocalDateTime;

public class Bill {

    private int billId;
    private int appointmentId;
    private double treatmentFee;
    private double consultationFee;
    private double totalAmount;
    private String paymentStatus;
    private LocalDateTime billDate;

    // Default constructor
    public Bill() {
    }

    // Parameterized constructor
    public Bill(int billId, int appointmentId, double treatmentFee,
                double consultationFee, double totalAmount,
                String paymentStatus, LocalDateTime billDate) {

        this.billId = billId;
        this.appointmentId = appointmentId;
        this.treatmentFee = treatmentFee;
        this.consultationFee = consultationFee;
        this.totalAmount = totalAmount;
        this.paymentStatus = paymentStatus;
        this.billDate = billDate;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public double getTreatmentFee() {
        return treatmentFee;
    }

    public void setTreatmentFee(double treatmentFee) {
        this.treatmentFee = treatmentFee;
    }

    public double getConsultationFee() {
        return consultationFee;
    }

    public void setConsultationFee(double consultationFee) {
        this.consultationFee = consultationFee;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public LocalDateTime getBillDate() {
        return billDate;
    }

    public void setBillDate(LocalDateTime billDate) {
        this.billDate = billDate;
    }
}