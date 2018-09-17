package co.grandcircus.BeBetter.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.BeBetter.Entity.Journal;
import co.grandcircus.BeBetter.Entity.User;

@Repository
@Transactional
public class JournalDao {
	
	@PersistenceContext
	EntityManager em;
	
	public List<Journal> findAll() {
		return em.createQuery("FROM Journal", Journal.class).getResultList();
	}
	//create new task
	public void create(Journal journal) {
		em.persist(journal);
	}
	//delete
	public void delete(Long id) {
		Journal journal = em.getReference(Journal.class, id);
		em.remove(journal);
	}
	public List<Journal> findByUser(User user) {
			//String sql = "SELECT * FROM items WHERE name = ?";
			return em.createQuery("FROM Journal WHERE user_user_id = :u", 
			Journal.class).setParameter("u", user).getResultList();
	}

}
