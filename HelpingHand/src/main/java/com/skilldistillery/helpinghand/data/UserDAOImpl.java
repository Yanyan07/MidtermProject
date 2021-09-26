package com.skilldistillery.helpinghand.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.Inventory;
import com.skilldistillery.helpinghand.entities.InventoryItem;
import com.skilldistillery.helpinghand.entities.ShoppingCartItem;
import com.skilldistillery.helpinghand.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(String username) {
		
		String jpql = "SELECT u FROM User u WHERE u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("uname", username)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("No user found with username " + username);
		}
		return user;
	}

	@Override //login with username and password
	public User findUserByUsernameAndPassword(String username, String password) {
		String spql = "select u from User u where u.username=:username and u.password=:password";
		User user = null;
		List<User> users = em.createQuery(spql, User.class)
					  .setParameter("username", username)
					  .setParameter("password", password)
					  .getResultList();
		if(users!=null && users.size()>0) {
			user = users.get(0);
		}
		return user;
	}
	
	@Override //list all food available
	public List<Inventory> getInventory(int pantryId){
//		String spql = "select i from Inventory i where i.pantry_id = :id";
		String spql = "select i from Inventory i";
//		List<Inventory> inventories = em.createQuery(spql, Inventory.class)
//						.setParameter("id", pantryId)
//					    .getResultList();
//		List<Inventory> inventories = em.createQuery(spql, Inventory.class)
//				.getResultList();
		Inventory i = em.find(Inventory.class, pantryId);
		List<Inventory> inventories = new ArrayList<>();
		inventories.add(i);
		return inventories;
	}

	@Override
	public boolean addItemToCart(int inventoryId, int cartId) {
		List<InventoryItem> items = null;
		String itemsSql = "select item from InventoryItem item join Inventory i on item.inventory_id = i.id "
				+ "where i.id = :inventoryId";
		
		items = em.createQuery(itemsSql, InventoryItem.class)
				  .setParameter("inventoryId", inventoryId)
				  .getResultList();
		if(items==null || items.size()==0) {
			return false;
		}
		InventoryItem item = items.get(0);
		if(item != null) { //add item to cart
			Cart cart = em.find(Cart.class, cartId);
			ShoppingCartItem cartItem = new ShoppingCartItem();
			cartItem.setInvetoryItem(item);
			cartItem.setCart(cart);
			return true;
		}
		return false;
	}
	
	
	
	

}
