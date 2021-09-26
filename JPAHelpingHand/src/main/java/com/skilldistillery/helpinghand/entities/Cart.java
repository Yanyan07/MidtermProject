package com.skilldistillery.helpinghand.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cart {

//	Field Mappings

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

//	No Arg Constructor

	public Cart() {
		super();
	}

// Constructor with all Fields

	public Cart(int id, User user, LocalDateTime createDate, boolean completed) {
	super();
	this.id = id;
	this.user = user;
	this.createDate = createDate;
	this.completed = completed;
}

// To String

	@Override
	public String toString() {
		return "Cart [id=" + id + ", user=" + user + ", createDate=" + createDate + ", completed=" + completed + "]";
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
