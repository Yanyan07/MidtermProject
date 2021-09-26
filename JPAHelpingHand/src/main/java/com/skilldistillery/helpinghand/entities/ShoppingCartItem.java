package com.skilldistillery.helpinghand.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shopping_cart_item")
public class ShoppingCartItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "inventory_item_id")
	private int inventoryItemId;
	
	@Column(name = "cart_id")
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

	public int getInventoryItemId() {
		return inventoryItemId;
	}

	public void setInventoryItemId(int inventoryItemId) {
		this.inventoryItemId = inventoryItemId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cartId, id, inventoryItemId);
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
		return cartId == other.cartId && id == other.id && inventoryItemId == other.inventoryItemId;
	}

	@Override
	public String toString() {
		return "ShoppingCartItem [id=" + id + ", inventoryItemId=" + inventoryItemId + ", cartId=" + cartId + "]";
	}

	

	

}
