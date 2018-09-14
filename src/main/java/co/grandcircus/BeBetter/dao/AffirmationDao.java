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
	public Affirmation findLast(User user) {
		// TODO Auto-generated method stub
		List<Affirmation> affirmationList= em.createQuery("FROM Affirmation WHERE user_user_id = :u ORDER BY id DESC", 
				Affirmation.class).setParameter("u", user.getId()).getResultList();
		return affirmationList.get(0);
	}

}
