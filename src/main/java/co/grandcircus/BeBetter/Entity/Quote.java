package co.grandcircus.BeBetter.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Quote {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private String quoteText;
	private String quoteAuthor;
	@ManyToOne
	private User user;
	public Quote() {
		super();
	}
	
	public Quote(String quoteText, String quoteAuthor) {
		super();
		this.quoteText = quoteText;
		this.quoteAuthor = quoteAuthor;
	}
	
	public String getQuoteText() {
		return quoteText;
	}
	
	public void setQuoteText(String quoteText) {
		this.quoteText = quoteText;
	}
	
	public String getQuoteAuthor() {
		return quoteAuthor;
	}
	
	public void setQuoteAuthor(String quoteAuthor) {
		this.quoteAuthor = quoteAuthor;
	}

	@Override
	public String toString() {
		return "Quote [quoteText=" + quoteText + ", quoteAuthor=" + quoteAuthor + ", user=" + user + "]";
	}
	
	
}
	
	
