package com.skilldistillery.helpinghand.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Address {

//	Field labels

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "street_address")
	private String streetAddress;

	private String city;

	private String state;

	@Column(name = "zip_code")
	private String zipCode;
	
	@OneToOne(mappedBy="address")
	private Pantry pantry;
	
//	Setters and Getters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

//	No Arg Contstructor
	public Pantry getPantry() {
		return pantry;
	}
	public void setPantry(Pantry pantry) {
		this.pantry = pantry;
	}
	public Address() {
	}

//	Constructor w/ All Fields

	public Address(int id, String streetAddress, String city, String state, String zipCode) {
		super();
		this.id = id;
		this.streetAddress = streetAddress;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}

// To String

	@Override
	public String toString() {
		return "Address [id=" + id + ", streetAddress=" + streetAddress + ", city=" + city + ", state=" + state
				+ ", zipCode=" + zipCode + "]";
	}

// Hash Code and Equals

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		return id == other.id;
	}

}
