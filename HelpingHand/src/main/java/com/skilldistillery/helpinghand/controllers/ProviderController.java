package com.skilldistillery.helpinghand.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.InventoryItem;
import com.skilldistillery.helpinghand.entities.Pantry;

@Controller
public class ProviderController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "pantryId.do")
	public String findPantryById(HttpSession session, Integer pantryId) {
		Pantry pantry = userDao.findPantryById(pantryId);
		session.setAttribute("pantry", pantry);
		return "providerList";
	}
	
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
	
	
	@RequestMapping(path = "backProviderList.do")
	public String getBackToProvider() {
		return "providerList";
	}
	
	@RequestMapping(path = "backLogin.do")
	public String getBackToLogin() {
		return "providerLogin";
	}
	
	
}
