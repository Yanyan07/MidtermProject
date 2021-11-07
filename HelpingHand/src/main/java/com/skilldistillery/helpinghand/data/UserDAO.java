package com.skilldistillery.helpinghand.data;

import java.util.List;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.Inventory;
import com.skilldistillery.helpinghand.entities.InventoryItem;
import com.skilldistillery.helpinghand.entities.Pantry;
import com.skilldistillery.helpinghand.entities.ShoppingCartItem;
import com.skilldistillery.helpinghand.entities.User;

public interface UserDAO {

User findUserByUsernameAndPassword(String username, String password);
	
	Cart createCart(int userId);
	
	boolean addItemToCart(int inventoryid, Cart cart);
	
	Cart getCart(int cartId);
	
	boolean deleteItem(int inventoryId, int pantryId);
	
	List<Pantry> findPantries();
	
	Pantry findPantryById(int pantryId);
	
	List<InventoryItem> getOrderHistory(User user);
	
	List<ShoppingCartItem> getCartItemsInCart(int cartId);

	boolean deleteCartItem(int cartItemId, User user);

	List<InventoryItem> getAvailableInventory(int pantryId);

	List<InventoryItem> getUnavailableInventory(int pantryId);
	
	boolean deleteShoppingCartItem(int inventoryItemId);
	
	boolean register(User user);
}
