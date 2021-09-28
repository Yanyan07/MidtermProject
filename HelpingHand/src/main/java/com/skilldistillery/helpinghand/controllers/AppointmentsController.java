package com.skilldistillery.helpinghand.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.helpinghand.data.AppointmentDAO;
import com.skilldistillery.helpinghand.entities.Appointment;

@Controller
public class AppointmentsController {

	@Autowired
	private AppointmentDAO dao;

//	@RequestMapping(path = "appointment.do", method = RequestMethod.GET)
//	public String showAppointment(Model model, @RequestParam int pantryId) {
//		System.out.println(pantryId);
//		AppointmentDAO appointment = dao.findAppointmentByPantryId(pantryId);
//		System.out.println(appointment);
//		model.addAttribute("appointment", appointment);
//		return "appointment";
//
//	}

	@RequestMapping(path = "appointments.do", method = RequestMethod.GET)
	public String showUserAppointment(Model model, @RequestParam int userId) {
		System.out.println(userId);
		List<Appointment> appointments;
		return "appointment";
		
	}

	@RequestMapping(path = "appointments.do", method = RequestMethod.POST)
	public String createUserAppointment(Appointment appointment, Model model) {
		System.out.println(appointment);
		Appointment create = dao.CreateAppointment(appointment);
		model.addAttribute("appointment", create);
		return "appointment";
		
	}
	
	@RequestMapping(path = "newappointment.do", method = RequestMethod.GET)
	public String appointment(String userId){
	
	
	return "appointment";
	}

}
