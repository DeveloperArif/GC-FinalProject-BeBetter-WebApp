package co.grandcircus.BeBetter.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Score {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "score_id")
	private Long id;
	@ManyToOne
	private User user;
	private Float score;
	private String date;
	
	public Score() {
		super();
	}
	
	public Score(Long id, User user, Float score, String date) {
		super();
		this.id = id;
		this.user = user;
		this.score = score;
		this.date = date;
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

	public Float getScore() {
		return score;
	}

	public void setScore(Float score) {
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
