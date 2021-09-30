package com.skilldistillery.helpinghand.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.InventoryItem;
import com.skilldistillery.helpinghand.entities.Pantry;
import com.skilldistillery.helpinghand.entities.User;

@Controller
public class ProviderController {

	@Autowired
	private UserDAO userDao;

//	@RequestMapping(path = "clear.do")
//	public String addToCart(HttpSession session, Model model, int inventoryId) {
//		User user = (User) session.getAttribute("user");
//		Cart cart = (Cart) session.getAttribute("cart");
//		if (cart == null) {
//			cart = userDao.createCart(user.getId());
//			session.setAttribute("cart", cart);
//		}
////		Cart cart = userDao.getCart(4);
////		session.setAttribute("cart", cart);
//		boolean isAdded = userDao.addItemToCart(inventoryId, cart);
//		model.addAttribute("isAdded", isAdded);
//		return "addCart";
//	}
	
	@RequestMapping(path = "short.do")
	public String getShortList(HttpSession session, Model model) {
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		List<InventoryItem> shortList = userDao.getUnavailableInventory(pantry.getId());
		model.addAttribute("shortList", shortList);
		return "shortList";
	}
	
	@RequestMapping(path = "refill.do")
	public String refillStuff(HttpSession session, Model model) {
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		List<InventoryItem> shortList = userDao.getUnavailableInventory(pantry.getId());
		for (InventoryItem item : shortList) {
			userDao.deleteShoppingCartItem(item.getId());
			item.setAvailable(true);
		}
		return "redirect:available.do";
	}
	
	@RequestMapping(path = "available.do")
	public String getAvailableList(HttpSession session, Model model) {
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		System.out.println(pantry.getId());
		List<InventoryItem> availableList = userDao.getAvailableInventory(pantry.getId());
		if(availableList != null) {
			model.addAttribute("availableList", availableList);
		}
		return "availableList";
	}
	
	
	@RequestMapping(path = "back.do")
	public String getBackToProvider() {
		return "providerLogin";
	}
	
	
}
