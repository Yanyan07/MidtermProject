package com.skilldistillery.helpinghand.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.Inventory;


@Service
@Transactional
public class IventoryDAOImpl implements InventoryDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	

	

	@Override
	public Inventory findInventoryById(int id) {
		Inventory inventory = em.find(Inventory.class, id);
		return inventory;
		// TODO Auto-generated method stub
		
	}

	@Override
	public Inventory InventoryByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteIventory(int id) {
		boolean result = false;
		Inventory inventory = em.find(Inventory.class, id);
		em.remove(inventory);
	    em.contains(inventory);
	    inventory =em.find(Inventory.class, id);
	    result = ! em.contains(inventory);
	    return result;
		// TODO Auto-generated method stub
		
	}

	@Override
	public Inventory addInventory(int id, Inventory inventory) {
		em.getTransaction().begin();
		em.persist(inventory);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return inventory;
		// TODO Auto-generated method stub
	
	}

}
