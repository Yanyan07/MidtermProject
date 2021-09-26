package com.skilldistillery.helpinghand.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "inventory_item")
public class InventoryItem {
	
	
	
	public InventoryItem() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "inventory_id")
	private int inventoryId;
	
	private Integer available;
	
	private LocalDate expiration;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
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
		return Objects.hash(available, createDate, expiration, id, inventoryId);
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
		return Objects.equals(available, other.available) && Objects.equals(createDate, other.createDate)
				&& Objects.equals(expiration, other.expiration) && id == other.id && inventoryId == other.inventoryId;
	}

	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", inventoryId=" + inventoryId + ", available=" + available + ", expiration="
				+ expiration + ", createDate=" + createDate + "]";
	}
	
	

	
	


}