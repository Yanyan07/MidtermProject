package com.skilldistillery.helpinghand.data;

import com.skilldistillery.helpinghand.entities.ShoppingCartItem;

public interface ShoppingCartItemDAO {
	
	ShoppingCartItem findShoppingCartItemById(int id);
	
	ShoppingCartItem addShoppingCartItem(int id, ShoppingCartItem shoppingCartItem);
	
	boolean deleteShoppingCarItem(int id);


}
