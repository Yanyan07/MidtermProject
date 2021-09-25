package com.skilldistillery.helpinghand.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ShoppingCartItem {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "inventory_item")
	private int inventoryItem;
	
	private int cartId;

	public ShoppingCartItem() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInventoryItem() {
		return inventoryItem;
	}

	public void setInventoryItem(int inventoryItem) {
		this.inventoryItem = inventoryItem;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cartId, id, inventoryItem);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingCartItem other = (ShoppingCartItem) obj;
		return cartId == other.cartId && id == other.id && inventoryItem == other.inventoryItem;
	}

	@Override
	public String toString() {
		return "ShoppingCartItem [id=" + id + ", inventoryItem=" + inventoryItem + ", cartId=" + cartId + "]";
	}
	

}
