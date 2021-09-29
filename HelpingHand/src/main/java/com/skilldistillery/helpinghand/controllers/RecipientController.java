package com.skilldistillery.helpinghand.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.Inventory;
import com.skilldistillery.helpinghand.entities.Pantry;
import com.skilldistillery.helpinghand.entities.User;

@Controller
public class RecipientController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "addToCart.do")
	public String addToCart(HttpSession session, Model model, int inventoryId) {
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = userDao.createCart(user.getId());
			session.setAttribute("cart", cart);
		}
		boolean isAdded = userDao.addItemToCart(inventoryId, cart);
		model.addAttribute("isAdded", isAdded);

		return "addCart";
	}

	@RequestMapping(path = "showOrder.do")
	public String showOrder(HttpSession session, Model model, Integer cartId) {
		Cart cart = (Cart) session.getAttribute("cart");
		cartId = cart.getId();
		List<Inventory> items = userDao.getItemsInCart(cartId);
		Map<Inventory, Integer> map = new HashMap<>();

		for (Inventory i : items) {
			if (!map.keySet().contains(i)) {
				map.put(i, 1);
			} else {
				map.put(i, map.get(i) + 1);
			}
		}
		model.addAttribute("orderMap", map);
		return "order";
	}

	@RequestMapping(path = "delete.do")
	public String deleteItem(HttpSession session, int inventoryId) {
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		userDao.deleteItem(inventoryId, pantry.getId());
		return "redirect:showOrder.do";
	}

	@RequestMapping(path = "pantry.do")
	public String getNearestPantry(HttpSession session, Integer zipcode) {
		List<Pantry> pantries = userDao.findPantries();
		Pantry pantry = null;
		int min = Integer.MAX_VALUE;
		for (Pantry p : pantries) {
			int temp = Integer.valueOf(p.getAddress().getZipCode());
			int diff = Math.abs(zipcode - temp);
			if (diff < min) {
				min = diff;
				pantry = p;
			}
		}
		if (session.getAttribute("pantry") == null) {
			session.setAttribute("pantry", pantry);
		}
		return "pantry";
	}

	@RequestMapping(path = {"placeOrder.do", "backPantry.do"})
	public String placeOrder() {
		return "pantry";
	}

	@RequestMapping(path = "orderHistory.do")
	public String getOrderHistory(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		List<Inventory> orderHistory = userDao.getOrderHistory(user);
		Map<Inventory, Integer> map = new HashMap<>();

		for (Inventory i : orderHistory) {
			if (!map.keySet().contains(i)) {
				map.put(i, 1);
			} else {
				map.put(i, map.get(i) + 1);
			}
		}
		model.addAttribute("orderHistory", map);
		return "history";
	}

}
