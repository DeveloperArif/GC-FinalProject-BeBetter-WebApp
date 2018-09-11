package co.grandcircus.BeBetter.Entity;

import javax.persistence.ManyToOne;

public class Quote {

	private String content;
	private String title;
	
	@ManyToOne
	private User user;
	
	public Quote() {}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
