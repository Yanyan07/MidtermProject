package com.skilldistillery.helpinghand.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "inventory_item")
public class InventoryItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private Boolean available;

	private LocalDate expiration;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@ManyToOne
	@JoinColumn(name = "inventory_id")
	private Inventory inventory;

	@OneToOne(mappedBy = "inventoryItem")
	private ShoppingCartItem shoppingCartItem;
	

	public InventoryItem() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public ShoppingCartItem getShoppingCartItem() {
		return shoppingCartItem;
	}

	public void setShoppingCartItem(ShoppingCartItem shoppingCartItem) {
		this.shoppingCartItem = shoppingCartItem;
	}

	public Boolean isAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public LocalDate getExpiration() {
		return expiration;
	}

	public void setExpiration(LocalDate expiration) {
		this.expiration = expiration;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
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
		InventoryItem other = (InventoryItem) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", available=" + available + ", expiration=" + expiration + ", createDate="
				+ createDate + "]";
	}

}