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
	
	@Override
	public List<InventoryItem> getAvailableInventory(int pantryId){
		String spql = "select i from InventoryItem i "
				+ "where i.inventory.pantry.id = :id and i.available= true "
				+"order by i.inventory.name";
		List<InventoryItem> inventories = em.createQuery(spql, InventoryItem.class)
				.setParameter("id", pantryId)
				.getResultList();
		return inventories;
	}
	
	@Override
	public List<InventoryItem> getUnavailableInventory(int pantryId){
		String spql = "select i from InventoryItem i "
				+ "where i.inventory.pantry.id = :id and i.available= false "
				+"order by i.inventory.name";
		List<InventoryItem> inventories = em.createQuery(spql, InventoryItem.class)
				.setParameter("id", pantryId)
				.getResultList();
		return inventories;
	}

	@Override
	public Cart createCart(int userId) {
		User user = em.find(User.class, userId);
		Cart cart = new Cart();
		cart.setUser(user);
		user.addCart(cart);
		em.persist(cart);
		em.flush();
		return cart;
	}
	
	@Override
	public boolean addItemToCart(int inventoryId, Cart cart) {
		InventoryItem item = em.find(InventoryItem.class, inventoryId);
		
		if(item != null) { //add item to cart
			ShoppingCartItem cartItem = new ShoppingCartItem();
			cartItem.setInventoryItem(item);
			cartItem.setCart(cart);
			item.setAvailable(false);
			em.persist(cartItem);
			em.persist(item);
			em.flush();
			return true;
		}
		return false;
	}
	
	@Override
	public Cart getCart(int cartId) {
		return em.find(Cart.class, cartId);
	}
	
	@Override
	public List<ShoppingCartItem> getCartItemsInCart(int cartId){
		List<ShoppingCartItem> items = null;
		String spql = "select i from ShoppingCartItem i "
				+ "where i.cart.id= :cartId";
		items = em.createQuery(spql, ShoppingCartItem.class)
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
		String sql = "select ii from InventoryItem ii join ShoppingCartItem s "
				+ "on s.inventoryItem.id=ii.id where s.id = : sItemId";
		InventoryItem ii = em.createQuery(sql, InventoryItem.class)
							 .setParameter("sItemId", item.getId())
							 .getSingleResult();
		em.remove(item);
		ii.setAvailable(true);
		
		return false;
	}
	
	@Override
	public boolean deleteShoppingCartItem(int inventoryItemId) {
		String spql = "select s from ShoppingCartItem s where s.inventoryItem.id=:id";
		ShoppingCartItem item = null;
		try {
			item = em.createQuery(spql, ShoppingCartItem.class)
									  .setParameter("id", inventoryItemId)
									  .getSingleResult();
		} catch (Exception e) {
			System.err.println("No ShoppingCartItem object is found!S");
		}
		if(item != null) {
			em.remove(item);
			return true;
		}
		return false;
	}
	
	@Override
	public boolean deleteCartItem(int cartItemId, User user) {
		ShoppingCartItem item = em.find(ShoppingCartItem.class, cartItemId);
		if(item != null) {
			item.getInventoryItem().setAvailable(true);
			em.remove(item);
			return true;
		}
		return false;
	}

	@Override
	public List<Pantry> findPantries() {
		String spql = "select p from Pantry p";
		return em.createQuery(spql, Pantry.class).getResultList();
	}
	
	@Override
	public Pantry findPantryById(int pantryId) {
		String spql = "select p from Pantry p where p.id = : pantryId ";
		List<Pantry> pantries = em.createQuery(spql, Pantry.class)
				.setParameter("pantryId", pantryId)
				.getResultList();
		Pantry pantry = null;
		if(pantries != null) {
			pantry = pantries.get(0);
		}
		return pantry;
	}
	
	@Override
	public List<InventoryItem> getOrderHistory(User user){
		String spql = "select ii from InventoryItem ii "
				+ "join ShoppingCartItem s on s.inventoryItem.id=ii.id "
				+ "join Cart c on c.id=s.cart.id "
				+ "where c.user.id = :uId";
		List<InventoryItem> lists = em.createQuery(spql, InventoryItem.class)
				.setParameter("uId", user.getId())
				.getResultList();
		return lists;
	}
	
	@Override
	public boolean register(User user) {
		User u = findUserByUsernameAndPassword(user.getUsername(), user.getPassword());
		if(user!=null && u==null) {
			em.persist(user);
			em.flush();
			return true;
		}
		return false;
	}

}
