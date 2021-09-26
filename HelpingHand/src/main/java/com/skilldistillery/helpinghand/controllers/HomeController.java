package com.skilldistillery.helpinghand.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.helpinghand.data.UserDAO;
import com.skilldistillery.helpinghand.entities.Inventory;
import com.skilldistillery.helpinghand.entities.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("DEBUG", userDao.findUserById("sportsbetter"));
		User user = userDao.findUserByUsernameAndPassword("sportsbetter", "butthead");
		model.addAttribute("user", user);
		
//		List<Inventory> list = userDao.getInventory(1);
//		model.addAttribute("list", list);
		
		return "home";
	}
	
	@RequestMapping(path ="list.do")
	public String showList(Model model) {
		System.out.println("test show list");
		System.out.println("test show list");
		System.out.println("test show list");
		List<Inventory> inventories = userDao.getInventory(1);
		if(inventories.size() > 0) {
			model.addAttribute("inventories", inventories);
		}
		return "list";
	}

}
