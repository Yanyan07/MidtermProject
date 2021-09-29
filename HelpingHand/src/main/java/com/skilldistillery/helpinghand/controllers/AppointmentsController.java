package com.skilldistillery.helpinghand.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.helpinghand.data.AppointmentDAO;
import com.skilldistillery.helpinghand.entities.Appointment;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.Pantry;
import com.skilldistillery.helpinghand.entities.User;

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
//		List<Appointment> appointments;
		return "appointment";

	}

	@RequestMapping(path = "newappointment.do", method = RequestMethod.POST)
	public String createUserAppointment(Appointment appointment, HttpSession session,Model model) {
//		System.out.println(appointment);
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		if (user != null) {
			appointment.setUser(user);
			appointment.setCart(cart);
			appointment.setPantry(pantry);
//			FIX ME NEED CART & PANTRY
		Appointment create = dao.CreateAppointment(appointment);
		model.addAttribute("appointment", create);
		
//		return "order";
		return "createAppointment";
		}
		else {
			return "home";
		}
	}
	
//	@RequestMapping(path = "newappointment.do", method = RequestMethod.POST)
//	public String createUserAppointment(Appointment appointment, HttpSession session,Model model) {
////		System.out.println(appointment);
//		User user = (User) session.getAttribute("user");
//		Cart cart = (Cart) session.getAttribute("cart");
//		Pantry pantry = (Pantry) session.getAttribute("pantry");
//		if (user != null) {
//			appointment.setUser(user);
//			appointment.setCart(cart);
//			appointment.setPantry(pantry);
////			FIX ME NEED CART & PANTRY
//			Appointment create = dao.CreateAppointment(appointment);
//			model.addAttribute("appointment", create);
//			return "appointment";
//		}
//		else {
//			return "home";
//		}
//	}

	@RequestMapping(path = "newappointment.do", method = RequestMethod.GET)
	public String appointment() {

		return "appointment";
	}

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
			}
		});
		// 2020-11-04T09:44
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}
}
