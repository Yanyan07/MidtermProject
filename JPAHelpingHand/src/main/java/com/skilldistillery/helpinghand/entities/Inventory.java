package com.skilldistillery.helpinghand.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Inventory {
	
	

	
	public Inventory() {
		super();
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name = "image_url")
	private String imageURL;
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImageURL() {
		return imageURL;
	}


	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getPantryId() {
		return pantryId;
	}


	public void setPantryId(int pantryId) {
		this.pantryId = pantryId;
	}


	private int limit;
	
	private String description;
	
	
	@Column(name = "pantry_id")
	private int pantryId;

	@Override
	public int hashCode() {
		return Objects.hash(description, id, imageURL, limit, name, pantryId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Inventory other = (Inventory) obj;
		return Objects.equals(description, other.description) && id == other.id
				&& Objects.equals(imageURL, other.imageURL) && limit == other.limit && Objects.equals(name, other.name)
				&& pantryId == other.pantryId;
	}


	@Override
	public String toString() {
		return "Inventory [id=" + id + ", name=" + name + ", imageURL=" + imageURL + ", limit=" + limit
				+ ", description=" + description + ", pantryId=" + pantryId + "]";
	}
	
	
}
