package com.skilldistillery.helpinghand.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.skilldistillery.helpinghand.entities.Appointment;
import com.skilldistillery.helpinghand.entities.Cart;
import com.skilldistillery.helpinghand.entities.Inventory;
import com.skilldistillery.helpinghand.entities.InventoryItem;
import com.skilldistillery.helpinghand.entities.Pantry;
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
		String spql = "select i from Inventory i where i.pantry.id = :id";
		List<Inventory> inventories = em.createQuery(spql, Inventory.class)
						.setParameter("id", pantryId)
					    .getResultList();
		return inventories;
	}

	@Override
	public Cart createCart(int userId) {
		User user = em.find(User.class, userId);
		Cart cart = new Cart();
		cart.setUser(user);
	    Appointment appointment = new Appointment();
	    appointment.setPantry(em.find(Pantry.class, 1));
	    appointment.setUser(user);
	    cart.setAppointment(appointment);
	    appointment.setCart(cart);
		user.addCart(cart);
		em.persist(appointment);
		em.persist(cart);
		return cart;
	}
	
	@Override
	public boolean addItemToCart(int inventoryId, Cart cart) {
		List<InventoryItem> items = null;
		String itemsSql = "select item from InventoryItem item where item.inventory.id = :inventoryId";
		
		items = em.createQuery(itemsSql, InventoryItem.class)
				  .setParameter("inventoryId", inventoryId)
				  .getResultList();
		if(items==null || items.size()==0) {
			return false;
		}
		InventoryItem item = items.get(0);
//		Inventory i = em.find(Inventory.class, inventoryId);
//		item.setInventory(i);
//		i.addInventoryItem(item);
		
		if(item != null) { //add item to cart
			ShoppingCartItem cartItem = new ShoppingCartItem();
			cartItem.setInventoryItem(item);
			cartItem.setCart(cart);
//			em.remove(item);
			em.persist(cartItem);
			return true;
		}
		return false;
	}
	
	@Override
	public Cart getCart(int cartId) {
		return em.find(Cart.class, cartId);
	}
	
	@Override
	public List<Inventory> getItemsInCart(int cartId){
		List<Inventory> items = null;
		String spql = "select i from Inventory i join InventoryItem ii on i.id=ii.inventory.id "
				+ "join ShoppingCartItem s on ii.id=s.inventoryItem.id "
				+ "where s.cart.id= :cartId";
		items = em.createQuery(spql, Inventory.class)
				  .setParameter("cartId", cartId)
				  .getResultList();
		return items;
	}
	
	@Override
	public boolean deleteItem(int inventoryId, int pantryId) {
		List<ShoppingCartItem> items = null;
		String spql = "select s from ShoppingCartItem s "
				+ "join InventoryItem ii on ii.id=s.inventoryItem.id "
				+ "join Inventory i on i.id=ii.inventory.id "
				+ "where ii.inventory.id= :inventoryId and i.pantry.id=:pantryId";
		items = em.createQuery(spql, ShoppingCartItem.class)
				  .setParameter("inventoryId", inventoryId)
				  .setParameter("pantryId", pantryId)
				  .getResultList();
		
		ShoppingCartItem item = null;
		if(items!=null && items.size()>0) {
			item = items.get(0);
		}
//		String sql = "select ii from InventoryItem ii join ShoppingCartItem s "
//				+ "on s.inventoryItem.id=ii.id where s.id = : sItemId";
//		InventoryItem ii = em.createQuery(sql, InventoryItem.class)
//							 .setParameter("sItemId", item.getId())
//							 .getSingleResult();
		em.remove(item);
//		em.persist(ii);
		
		return false;
	}

	@Override
	public List<Pantry> findPantries() {
		String spql = "select p from Pantry p";
		return em.createQuery(spql, Pantry.class).getResultList();
	}
	
	@Override
	public List<Inventory> getOrderHistory(User user){
		String spql = "select i from Inventory i join InventoryItem ii on i.id=ii.inventory.id "
				+ "join ShoppingCartItem s on ii.id=s.inventoryItem.id "
				+ "join Cart c on s.cart.id=c.id "
				+ "join User u on c.user.id=u.id "
				+ "where u.id = :uId";
		List<Inventory> lists = em.createQuery(spql, Inventory.class)
				  .setParameter("uId", user.getId())
				  .getResultList();
		return lists;
	}

}
