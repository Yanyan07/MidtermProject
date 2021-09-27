package com.skilldistillery.helpinghand.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.Inventory;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findUserById("sportsbetter"));
		
//		List<Inventory> list = userDao.getInventory(1);
//		model.addAttribute("list", list);
		
		return "home";
	}
	
	@RequestMapping(path ="list.do")
	public String showList(Model model) {
		List<Inventory> inventories = userDao.getInventory(1);
		if(inventories.size() > 0) {
			model.addAttribute("list", inventories);
		}
		return "list";
	}

}
