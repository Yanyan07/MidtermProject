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
	public Inventory findInventoryByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inventory findInventoryById(int id) {
		Inventory inventory = em.find(Inventory.class, id);
		return inventory;
		// TODO Auto-generated method stub
		
	}

}
