package com.skilldistillery.helpinghand.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.User;

@Controller
public class RecipientController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path ="addToCart.do")
	public String addToCart(HttpSession session, Model model, int inventoryId) {
		User user = (User) session.getAttribute("user");
		Cart cart = userDao.createCart(user.getId());
//		Cart cart = userDao.getCart(2);
		boolean isAdded = userDao.addItemToCart(inventoryId, cart);
		model.addAttribute("isAdded", isAdded);
		
		return "addCart";
	}
	
}
