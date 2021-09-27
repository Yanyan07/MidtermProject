package com.skilldistillery.helpinghand.data;

import com.skilldistillery.helpinghand.entities.InventoryItem;

public interface InventoryItemDAO {
	
	InventoryItem findInventoryItemById(int id);
	
	InventoryItem addInventoryItem(int id, InventoryItem inventoryItem);
	
	boolean deleteInventoryItem(int id);

}
