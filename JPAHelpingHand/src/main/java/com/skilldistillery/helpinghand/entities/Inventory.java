package com.skilldistillery.helpinghand.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Inventory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@Column(name = "image_url")
	private String imageURL;

	private Integer limit;

	private String description;
	
	@ManyToOne
	@JoinColumn(name = "pantry_id")
	private Pantry pantry;
	
	@OneToMany(mappedBy = "inventory")
	private List<InventoryItem> inventoryItems;
	
	public Inventory() {
		super();
	}
	
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

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Pantry getPantry() {
		return pantry;
	}

	public void setPantry(Pantry pantry) {
		this.pantry = pantry;
	}

	public List<InventoryItem> getInventoryItems() {
		return inventoryItems;
	}

	public void setInventoryItems(List<InventoryItem> inventoryItems) {
		this.inventoryItems = inventoryItems;
	}

	public void addInventoryItem(InventoryItem item) {
		if(inventoryItems == null) {
			inventoryItems = new ArrayList<>();
		}
		if(!inventoryItems.contains(item)) {
			inventoryItems.add(item);
			item.setInventory(this);
		}
	}
	public void deleteInventoryItem(InventoryItem item) {
		if(inventoryItems!=null && inventoryItems.contains(item)) {
			inventoryItems.remove(item);
			item.setInventory(null);
		}
	}
	
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
		Inventory other = (Inventory) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Inventory [id=" + id + ", name=" + name + "]";
	}

	
	

<<<<<<< HEAD
}
=======
}
>>>>>>> ecf6afa5fb5b4bcf80b82afbcdeae1eef0be0b6e
