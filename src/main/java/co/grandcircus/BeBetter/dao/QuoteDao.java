package co.grandcircus.BeBetter.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import co.grandcircus.BeBetter.Entity.Quote;
import co.grandcircus.BeBetter.Entity.User;

@Repository
@Transactional
public class QuoteDao {
	@PersistenceContext
	EntityManager em;
	
	public List<Quote> findAll() {
		return em.createQuery("FROM Quote", Quote.class).getResultList();
	}
	
	public void create(Quote quote) {
		em.persist(quote);
	}
	//delete
	public void delete(Long id) {
		Quote quote = em.getReference(Quote.class, id);
		em.remove(quote);
	}
	public List<Quote> findByUser(User user){
		//String sql = "SELECT * FROM items WHERE name = ?";
		return em.createQuery("FROM Quote WHERE user_user_id = :u", 
				Quote.class).setParameter("u", user).getResultList();
	}

}
