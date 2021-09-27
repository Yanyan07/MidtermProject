package com.skilldistillery.helpinghand.data;

import java.util.List;

import com.skilldistillery.helpinghand.entities.Cart;

public interface CartDAO {

	List<Cart> findCartByUserId(int userId);

	Cart createCart(Cart cart);

	Cart UpdateCart(int id, Cart cart);

	boolean deleteCart(int id);

	List<Cart> findCompletedCarts(int id, Boolean completed);

	List<Cart> findIncompleteCarts(int id, Boolean completed);
}
