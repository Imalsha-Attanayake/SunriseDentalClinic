package com.sunrise.dental.model;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppointmentTest {

    @Test
    public void testTotalBillCalculation() {

        Appointment appointment = new Appointment();

        appointment.setTreatmentFee(2500.00);
        appointment.setConsultationFee(1500.00);

        double expectedTotal = 4000.00;

        assertEquals(
                expectedTotal,
                appointment.getTotalBill(),
                0.001
        );
    }

    @Test
    public void testTotalBillWithZeroConsultationFee() {

        Appointment appointment = new Appointment();

        appointment.setTreatmentFee(2500.00);
        appointment.setConsultationFee(0.00);

        double expectedTotal = 2500.00;

        assertEquals(
                expectedTotal,
                appointment.getTotalBill(),
                0.001
        );
    }

    @Test
    public void testTotalBillWithZeroFees() {

        Appointment appointment = new Appointment();

        appointment.setTreatmentFee(0.00);
        appointment.setConsultationFee(0.00);

        double expectedTotal = 0.00;

        assertEquals(
                expectedTotal,
                appointment.getTotalBill(),
                0.001
        );
    }
}