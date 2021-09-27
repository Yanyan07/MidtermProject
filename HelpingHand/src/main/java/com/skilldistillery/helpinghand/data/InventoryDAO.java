package com.skilldistillery.helpinghand.data;

import com.skilldistillery.helpinghand.entities.Inventory;

public interface InventoryDAO {
	
	Inventory findInventoryByName(String name);
	
	Inventory findInventoryById(int id);

}
