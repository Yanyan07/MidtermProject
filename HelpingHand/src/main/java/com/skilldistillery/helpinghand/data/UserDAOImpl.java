package com.skilldistillery.helpinghand.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.skilldistillery.helpinghand.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(String username) {
		
		String jpql = "SELECT u FROM User u WHERE u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("uname", username)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("No user found with username " + username);
		}
		return user;
	}

	@Override
	public User findUserByUsernameAndPassword(String username, String password) {
		String spql = "select u from User u where u.username = :username and u.password = :password";
		User user = null;
		List<User> users = em.createQuery(spql, User.class)
					  .setParameter("username", username)
					  .setParameter("password", password)
					  .getResultList();
		if(users!=null && users.size()>0) {
			user = users.get(0);
		}
		return user;
	}

}
