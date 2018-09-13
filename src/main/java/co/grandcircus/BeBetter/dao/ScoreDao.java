package co.grandcircus.BeBetter.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

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
	
}
