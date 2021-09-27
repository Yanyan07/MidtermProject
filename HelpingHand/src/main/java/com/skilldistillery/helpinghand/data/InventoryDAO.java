package com.skilldistillery.helpinghand.data;

import com.skilldistillery.helpinghand.entities.Inventory;

public interface InventoryDAO {
	
	Inventory InventoryByName(String name);
	
	Inventory findInventoryById(int id);
	
	boolean deleteIventory(int id);
	
	Inventory addInventory(int id, Inventory inventory);
	
	

}
