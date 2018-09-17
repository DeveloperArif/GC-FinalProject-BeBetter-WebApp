package co.grandcircus.BeBetter.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "journal")
public class Journal {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "journal_id")
	private Long id;
	private String journalEntry;
	private String date;
	@ManyToOne
	private User user;
	
	public Journal(Long id, String journalEntry, String date, User user) {
		super();
		this.id = id;
		this.journalEntry = journalEntry;
		this.date = date;
		this.user = user;
	}

	public Journal() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getJournalEntry() {
		return journalEntry;
	}

	public void setJournalEntry(String journalEntry) {
		this.journalEntry = journalEntry;
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
		return "Journal [id=" + id + ", journalEntry=" + journalEntry + ", date=" + date + ", user=" + user + "]";
	}
	
}
