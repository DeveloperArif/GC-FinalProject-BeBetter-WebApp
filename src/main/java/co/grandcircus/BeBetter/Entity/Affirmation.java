package co.grandcircus.BeBetter.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "affirmation")
public class Affirmation {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "affirmation_id")
	private Long id;
	private String affirmation;
	private String date;
	@ManyToOne
	private User user;
	
	public Affirmation() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAffirmation() {
		return affirmation;
	}

	public void setAffirmation(String affirmation) {
		this.affirmation = affirmation;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Affirmation [id=" + id + ", affirmation=" + affirmation + ", date=" + date + "]";
	} 
	
	
	

	
	
}
