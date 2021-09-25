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
import javax.persistence.Table;

@Entity
@Table(name="pantry_comment")
public class PantryComment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	@Column(name="create_date")
	private LocalDateTime createDate;
	@Column(name="in_reply_to")
	private Integer inReplyTo;
	
	@ManyToOne
	@JoinColumn(name="pantry_id")
	private Pantry pantry;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	public PantryComment() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	public Pantry getPantry() {
		return pantry;
	}
	public void setPantry(Pantry pantry) {
		this.pantry = pantry;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
