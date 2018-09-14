package co.grandcircus.BeBetter.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.BeBetter.Entity.User;

@Repository
@Transactional
public class UserDao {

	@PersistenceContext
	private EntityManager em;
	
	public List<User> findAll()	{
		//String sql = "SELECT * FROM items";
		return em.createQuery("FROM User", User.class).getResultList();
	}
	
	public void create(User user) {
		em.persist(user);
	}
	
	public User findByEmail(String email){
		//String sql = "SELECT * FROM items WHERE name = ?";
		try {
			// return the user if found
			return em.createQuery("FROM User WHERE email = :email", 
					User.class).setParameter("email", email).getSingleResult();
		} catch (NoResultException e) {
			// or if not found, return null
			return null;
		}
	}
	
	public void update(User user){
		em.merge(user);
	}
	public void delete(Long id){
		// Deleting with Hibernate entity manager requires fetching a reference first.
		User user = em.getReference(User.class, id);
		em.remove(user);
	}
	
	
	
}
