package com.skilldistillery.helpinghand.data;

import java.util.List;

import com.skilldistillery.helpinghand.entities.Address;

public interface AddressDAO {

	Address findAddressByStreetAddress(String streetAddress);
	List<Address> findAddressByZipcode(String zipCode);
	List<Address> findAddressByCity(String city);
	Address CreateAddress(Address address);
	Address UpdateAddress(int id, Address address);
	public boolean deleteAddress(int id);
	
}
