package com.skilldistillery.helpinghand.data;

import java.time.LocalDateTime;
import java.util.List;

import com.skilldistillery.helpinghand.entities.Appointment;

public interface AppointmentDAO {

	List<Appointment> findAppointmentByUserId(int userId);
	List<Appointment> findAppointmentByPantryId(int pantryId);
	List<Appointment> findAppointmentByAppointmentDate(LocalDateTime appointmentDate);
	List<Appointment> findAppointmentsWithRatingsOrComments(int appointmentId);
	Appointment CreateAppointment(Appointment appointment);
//	Appointment UpdateAppointment(int id, Appointment appointment);
	boolean deleteAppointment(int id);

}
