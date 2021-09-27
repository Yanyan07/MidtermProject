package com.skilldistillery.helpinghand.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.Appointment;

@Service
@Transactional
public class AppointmentDAOImpl implements AppointmentDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Appointment> findAppointmentByUserId(int userId) {

		String jpql = "SELECT a From Appointment a WHERE a.userId = :user";

		List<Appointment> appointments = em.createQuery(jpql, Appointment.class)
				.setParameter("user", userId)
				.getResultList();
		if (appointments != null && appointments.size() > 0) {
			return appointments;
		}
		return null;
	}
	@Override
	public List<Appointment> findAppointmentByPantryId(int pantryId) {

		String jpql = "SELECT a From Appointment a WHERE a.pantryId = :pantry";

		List<Appointment> appointments = em.createQuery(jpql, Appointment.class)
				.setParameter("pantry", pantryId)
				.getResultList();

		if (appointments != null && appointments.size() > 0) {
			return appointments;
		}
		return null;
	}

	@Override
	public List<Appointment> findAppointmentByAppointmentDate(LocalDateTime appointmentDate){
		String jpql = "SELECT a FROM Appointment a WHERE date(a.appointmentDate) = :date";
		List<Appointment> appointments = em.createQuery(jpql, Appointment.class)
				.setParameter("date", appointmentDate)
				.getResultList();
		if (appointments != null && appointments.size() >0) {
			return appointments;
		}
		return null;
	}
	@Override
	public List<Appointment>findAppointmentsWithRatingsOrComments(int appointmentId){
		String jpql = "SELECT a From Appointment a WHERE a.rating || a.comment != null = :feedback";
		List<Appointment> appointments = em.createQuery(jpql, Appointment.class)
				.setParameter("feedback", appointmentId)
				.getResultList();
		if (appointments != null && appointments.size() >0) {
			return appointments;
		}
		return null;
	}
	@Override
	public Appointment CreateAppointment(Appointment appointment) {
		em.getTransaction().begin();
		System.out.println("Before persist, apppointment: " + appointment);
		em.persist(appointment);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return appointment;
	}
//	@Override
//	public Appointment UpdateAppointment(int id, Appointment appointment) {
//		Appointment dbAppointment = em.find(Appointment.class, id);
//		
////	update Day	dbAppointment.set(appointment.se;
//		dbAppointment.setAppointmentDate(appointment.getYear));
////		update Hour
////		update Min
//		return dbAppointment;	
//	}
	@Override
	public boolean deleteAppointment(int id) {
		boolean result = false;
		Appointment appointment = em.find(Appointment.class, id);
		em.remove(appointment);
		
		appointment = em.find(Appointment.class, id);
		result = !em.contains(appointment);
		return result;	
	}
}
