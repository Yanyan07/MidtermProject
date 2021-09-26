package com.skilldistillery.helpinghand.data;

import com.skilldistillery.helpinghand.entities.Address;

public interface AddressDAO {

	Address findAddressByStreetAddress(String streetAddress);
	
	Address findAddressByCity(String city);
	
	Address findAddressByZipcode(String zipCode);

	Address CreateAddress(Address address);
}
