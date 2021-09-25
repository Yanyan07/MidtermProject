package com.skilldistillery.helpinghand.entities;

import java.time.LocalDateTime;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Appointment {

//	Field Mappings

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "appointment_date")
	private LocalDateTime appointmentDate;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "pantry_id")
	private int pantryId;

	@Column(name = "cart_id")
	private int cartId;

	private int rating;

	private String comment;

	@Column(name = "create_date")
	private LocalDateTime createDate;

//	Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(LocalDateTime appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPantryId() {
		return pantryId;
	}

	public void setPantryId(int pantryId) {
		this.pantryId = pantryId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

//	No Arg Constructor
	public Appointment() {
		super();
	}

//	Constructor with all Fields

	public Appointment(int id, LocalDateTime appointmentDate, int userId, int pantryId, int cartId, int rating,
			String comment, LocalDateTime createDate) {
		super();
		this.id = id;
		this.appointmentDate = appointmentDate;
		this.userId = userId;
		this.pantryId = pantryId;
		this.cartId = cartId;
		this.rating = rating;
		this.comment = comment;
		this.createDate = createDate;
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
		Appointment other = (Appointment) obj;
		return id == other.id;
	}

}
