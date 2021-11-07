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
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping(path ="list.do")
	public String showList(HttpSession session, Model model) {
		Pantry pantry = (Pantry) session.getAttribute("pantry");
		List<InventoryItem> inventories = userDao.getAvailableInventory(pantry.getId());
		if(inventories != null) {
			model.addAttribute("list", inventories);
		}
		return "list";
	}
	
	@RequestMapping(path ="backList.do")
	public String backToList() {
		return "list";
	}

}
