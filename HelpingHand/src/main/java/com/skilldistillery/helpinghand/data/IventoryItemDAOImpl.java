package com.skilldistillery.helpinghand.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.InventoryItem;


@Service
@Transactional
public class IventoryItemDAOImpl implements InventoryItemDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public InventoryItem findInventoryItemById(int id) {
		InventoryItem inventoryItem = em.find(InventoryItem.class, id);
		// TODO Auto-generated method stub
		return inventoryItem;
	}



	@Override
	public InventoryItem addInventoryItem(int id, InventoryItem inventoryItem) {
		em.getTransaction().begin();
		em.persist(inventoryItem);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return inventoryItem;
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean deleteInventoryItem(int id) {
		boolean result = false;
		InventoryItem inventoryItem = em.find(InventoryItem.class, id);
		em.remove(inventoryItem);
	    em.contains(inventoryItem);
	    inventoryItem =em.find(InventoryItem.class, id);
	    result = ! em.contains(inventoryItem);
	    return result;
				
		// TODO Auto-generated method stub
		
	}

}
