package com.skilldistillery.helpinghand.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.helpinghand.entities.Address;

	@Service
	@Transactional
	public class AddressDAOImpl implements AddressDAO{
		
		@PersistenceContext
		private EntityManager em;

		@Override
		public Address findAddressByStreetAddress(String streetAddress){
			
			String jpql = "SELECT a FROM Address a WHERE a.streetAddress= :address";
			Address address = null;
			try {
				address = em.createQuery(jpql, Address.class)
						.setParameter("address", streetAddress)
						.getSingleResult();
			} catch (Exception e) {
				System.err.println("No address found with the address" + streetAddress);
			}
			return address;
			
		}

		@Override
		public Address findAddressByZipcode(String zipCode) {
		 String zipaddress = "SELECT a FROM Address a where a.zipCode= :zipcode";
		 Address address = null;
		 List<Address> addresses = em.createQuery(zipaddress, Address.class)
				 .setParameter("zipcode", zipCode)
				 .getResultList();
		 if(addresses!=null && addresses.size()>0) {
			 address = addresses.get(0);
		 }
		 return address;
		}
		
		@Override
		public Address findAddressByCity(String city) {
			String citysearch = "SELECT a FROM Address a where a.city= :city";
			Address address = null;
			List<Address> addresses= em.createQuery(citysearch, Address.class)
					.setParameter("city", city)
					.getResultList();
			if(addresses!=null && addresses.size()>0) {
				address = addresses.get(0);
			}
			return address;
		}
		
		@Override
		public Address CreateAddress(Address address){
			em.getTransaction().begin();
			System.out.println("Before persist, address: " + address);
			em.persist(address);
			em.flush();
			em.getTransaction().commit();
			em.close();
			return address;
		}
		
		@Override
		public Address UpdateAddress(int id, Address address){
			Address dbAddress = em.find(Address.class, id);
			
			dbAddress.setStreetAddress(address.getStreetAddress());
			dbAddress.setCity(address.getCity());
			dbAddress.setState(address.getState());
			dbAddress.setZipCode(address.getZipCode());
			
			return dbAddress;
		}
		
		@Override
		public boolean deleteAddress(int id) {
			boolean result = false;
			Address address = em.find(Address.class, id);
			em.remove(address);
			
			address = em.find(Address.class, id);
			result = !em.contains(address);
			return result;
		}
		
	}

