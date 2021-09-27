package com.skilldistillery.helpinghand.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shopping_cart_item")
public class ShoppingCartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "inventory_item_id")
	private InventoryItem inventoryItem;

	@ManyToOne
	@JoinColumn(name = "cart_id")
	private Cart cart;

	public ShoppingCartItem() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public InventoryItem getInvetoryItem() {
		return inventoryItem;
	}

	public void setInvetoryItem(InventoryItem invetoryItem) {
		this.inventoryItem = invetoryItem;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
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
		ShoppingCartItem other = (ShoppingCartItem) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ShoppingCartItem [id=" + id + ", inventoryItem=" + inventoryItem + ", cart=" + cart + "]";
	}

}
