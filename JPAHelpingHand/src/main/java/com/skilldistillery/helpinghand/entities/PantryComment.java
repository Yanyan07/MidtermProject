package com.skilldistillery.helpinghand.entities;

import java.time.LocalDateTime;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PantryComment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="pantry_id")
	private int pantryId;
	@Column(name="user_id")
	private int userId;
	private String comment;
	@Column(name="create_date")
	private LocalDateTime createDate;
	@Column(name="in_reply_to")
	private Integer inReplyTo;
	
	public PantryComment() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getPantryId() {
		return pantryId;
	}
	public void setPantryId(int pantryId) {
		this.pantryId = pantryId;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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

	public Integer getInReplyTo() {
		return inReplyTo;
	}
	public void setInReplyTo(Integer inReplyTo) {
		this.inReplyTo = inReplyTo;
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
		PantryComment other = (PantryComment) obj;
		return id == other.id;
	}
	
}
