package com.skilldistillery.helpinghand.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {

//	Field Mappings

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	private boolean completed;

//	Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

//	No Arg Constructor

	public Cart() {
		super();
	}

// Constructor with all Fields

	public Cart(int id, int userId, LocalDateTime createDate, boolean completed) {
		super();
		this.id = id;
		this.userId = userId;
		this.createDate = createDate;
		this.completed = completed;
	}

// To String

	@Override
	public String toString() {
		return "Cart [id=" + id + ", userId=" + userId + ", createDate=" + createDate + ", completed=" + completed
				+ "]";
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
		Cart other = (Cart) obj;
		return id == other.id;
	}

}
