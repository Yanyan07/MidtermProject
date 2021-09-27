package com.skilldistillery.helpinghand.data;

import java.util.List;

import com.skilldistillery.helpinghand.entities.Cart;

public interface CartDAO {

	List<Cart> findCartByUserId(int userId);

	List<Cart> findCompletedCarts(Boolean completed);

	List<Cart> findIncompleteCarts(Boolean completed);

	Cart createCart(Cart cart);

	Cart UpdateCart(int id, Cart cart);

	boolean deleteCart(int id);
}
