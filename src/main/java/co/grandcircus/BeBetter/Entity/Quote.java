package co.grandcircus.BeBetter.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Quote {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String quote;
	private String author;
	
	@ManyToOne
	private User user;

	public Quote() {
	}

	public Quote(Long id, String quote, String author, User user) {
		this.id = id;
		this.quote = quote;
		this.author = author;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getQuote() {
		return quote;
	}

	public void setQuote(String quote) {
		this.quote = quote;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Quote [id=" + id + ", quote=" + quote + ", author=" + author + ", user=" + user + "]";
	}

	

	
	
}
