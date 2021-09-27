package com.skilldistillery.helpinghand.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.Cart;

@Service
@Transactional
public class CartDAOImpl implements CartDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Cart> findCartByUserId(int userId){
		
		String jpql = "SELECT c From Cart c WHERE c.userId = :user";
		
	List<Cart> carts = em.createQuery(jpql, Cart.class)
			.setParameter("user", userId)
			.getResultList();
	if (carts != null && carts.size() >0) {
		return carts;
	}
	return null;
	}
	
	@Override
	public List<Cart> findCompletedCarts(Boolean completed){
			String jpql = "SELECT c From Cart c WHERE c.completed =:fulfilled";
			List<Cart> carts = em.createQuery(jpql, Cart.class)
			.setParameter("fulfilled", completed)
			.getResultList();
		if (carts != null && carts.size()>0) {
			return carts;
		}
		return null;
	}
	@Override
	public List<Cart> findIncompleteCarts(Boolean completed){
		String jpql = "SELECT c From Cart c WHERE (c.completed!=1)=:unfulfilled";
		List<Cart> carts = em.createQuery(jpql; Cart.class)
				.setParameter("unfulfilled", completed)
				.getResultList();
		if (carts != null && carts.size()>0) {
			return carts;
		}
		return null;
	}
	@Override
	public Cart createCart(Cart cart) {
		em.getTransaction().begin();
		System.out.println("Before persist, cart: " + cart);
		em.persist(cart);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return cart;
	}
	
	@Override
	public Cart UpdateCart(int id, Cart cart) {
		Cart dbCart = em.find(Cart.class, id);
				
		dbCart.setUser(cart.getUser());
		dbCart.setCompleted(cart.isCompleted());;
		return cart;
		
	}
	
	@Override
	@Override
	public boolean deleteCart(int id) {
		boolean result = false;
		Cart cart = em.find(Cart.class, id);
		em.remove(cart);
		
		cart = em.find(Cart.class, id);
		result = !em.contains(cart);
		return result;
	}

}
