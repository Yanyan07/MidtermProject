package com.skilldistillery.helpinghand.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="signin.do")
	public String signIn() {
		
		return "login";
	}
	
	@RequestMapping(path = "login.do")
	public String login(HttpSession session, String username, String password) {
		User user = userDao.findUserByUsernameAndPassword(username, password);
		if (user != null) {
			session.setAttribute("user", user);
			if ("1".equals(user.getRole())) {
				return "recipientLogin";
			} else if ("2".equals(user.getRole())) {
				return "providerLogin";
			} else {
				return "home";
			}
		} else {
			return "home";
		}
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("cart");
		session.removeAttribute("pantry");
		return "logout";
	}

}
