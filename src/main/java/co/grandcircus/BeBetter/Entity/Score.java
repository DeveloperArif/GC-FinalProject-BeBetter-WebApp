package co.grandcircus.BeBetter.Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Score implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "score_id")
	private Long id;
	@ManyToOne
	private User user;
	private int score;
	private String date;
	private String text;
	
	public Score() {
		super();
	}
	
	public Score(Long id, User user, int score, String date, String text) {
		this.id = id;
		this.user = user;
		this.score = score;
		this.date = date;
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Score [id=" + id + ", user=" + user + ", score=" + score + ", date=" + date + "]";
	}
	
	
	
	
	

}
