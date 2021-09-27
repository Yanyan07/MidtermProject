package com.skilldistillery.helpinghand.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.ShoppingCartItem;


@Service
@Transactional
public class ShoppingCartItemDAOImpl implements ShoppingCartItemDAO {
	
	@PersistenceContext
	private EntityManager em;



	

	@Override
	public boolean deleteShoppingCarItem(int id) {
		boolean result = false;
		ShoppingCartItem shoppingCartItem = em.find(ShoppingCartItem.class, id);
		em.remove(shoppingCartItem);
	    em.contains(shoppingCartItem);
	    shoppingCartItem =em.find(ShoppingCartItem.class, id);
	    result = ! em.contains(shoppingCartItem);
	    return result;
	}			
		
		
			
	

	@Override
	public ShoppingCartItem findShoppingCartItemById( int id) {
		ShoppingCartItem shoppingCartItem = em.find(ShoppingCartItem.class, id);
		return shoppingCartItem;
		
		
		
	
	}

	@Override
	public ShoppingCartItem addShoppingCartItem(int id, ShoppingCartItem shoppingCartItem) {
		em.getTransaction().begin();
		em.persist(shoppingCartItem);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return shoppingCartItem;
	
	}

}
