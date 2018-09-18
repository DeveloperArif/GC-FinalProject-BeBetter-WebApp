package co.grandcircus.BeBetter.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.BeBetter.Entity.Affirmation;
import co.grandcircus.BeBetter.Entity.Score;
import co.grandcircus.BeBetter.Entity.User;

@Repository
@Transactional
public class ScoreDao {
	
	@PersistenceContext
	EntityManager em;
	
	public List<Score> findAll() {
		return em.createQuery("FROM Score", Score.class).getResultList();
	}
	
	public void create(Score score) {
		em.persist(score);
	}
	//delete
	public void delete(Long id) {
		Score score = em.getReference(Score.class, id);
		em.remove(score);
	}
	public List<Score> findByUser(User user){
		//String sql = "SELECT * FROM items WHERE name = ?";
		return em.createQuery("FROM Score WHERE user_user_id = :u", 
				Score.class).setParameter("u", user).getResultList();
	}
	
public String findDayAvg(User user) {
		
		Date date = new Date();
	    String strDateFormat = "yyyy-MM-dd";
	    DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	    String formattedDate= dateFormat.format(date);
	    
		List<Score> avgScore = em.createQuery("SELECT AVG(score) FROM Score WHERE user_user_id = :u AND date = :d", 
					Score.class).setParameter("u", user.getId()).setParameter("d", formattedDate).getResultList();
		// the "?" question mark is the ternary operator as an if statement
		// this will ask, if it's empty then return empty string and if not then show last affirmation
		return (avgScore.isEmpty() ? "" : avgScore.toString());
}

public List<String> listByDate(User user) {

	return em.createQuery("SELECT DISTINCT(date) FROM Score WHERE user_user_id = :u", 
			String.class).setParameter("u", user.getId()).getResultList();
	
}
}
