package co.grandcircus.BeBetter.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.BeBetter.Entity.Affirmation;
import co.grandcircus.BeBetter.Entity.User;
@Repository
@Transactional
public class AffirmationDao {

	@PersistenceContext
	EntityManager em;
	
	public List<Affirmation> findAll() {
		return em.createQuery("FROM Affirmation", Affirmation.class).getResultList();
	}
	//create 
	public void create(Affirmation affirmation) {
		em.persist(affirmation);
	}
	//delete
	public void delete(Long id) {
		Affirmation affirmation = em.getReference(Affirmation.class, id);
		em.remove(affirmation);
	}
	//displays all affirmations by user
	public List<Affirmation> findByUser(User user) {	
		return em.createQuery("FROM Affirmation WHERE user_user_id = :u", 
				Affirmation.class).setParameter("u", user.getId()).getResultList();
	}
	public String findLast(User user) {
		
		List<Affirmation> newAff = em.createQuery("FROM Affirmation WHERE user_user_id = :u ORDER BY affirmation_id DESC", 
					Affirmation.class).setParameter("u", user.getId()).getResultList();
		// the "?" question mark is the ternary operator as an if statement
		// this will ask, if it's empty then return empty string and if not then show last affirmation
		return (newAff.isEmpty() ? "": newAff.get(0).getAffirmation());
		
	
	}

}
