package om.skilldistillery.helpinghand.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.helpinghand.entities.User;

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAHelpingHand");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test() {
		assertNotNull(user);
		assertEquals("sportsbetter", user.getUsername());
		assertEquals("butthead", user.getPassword());
		assertEquals(true, user.getEnabled());
	}
	
	@Test
	@DisplayName("test user to carts mapping")
	void test_user_cart() {
		assertNotNull(user);
		assertTrue(user.getCarts().size() > 0);
	}
	
	@Test
	@DisplayName("test user to appointments mapping")
	void test_user_appointment() {
		assertNotNull(user);
		assertTrue(user.getAppointments().size() > 0);
	}
	
	@Test
	@DisplayName("test user to pantryComments mapping")
	void test_user_pantryComment() {
		assertNotNull(user);
		assertTrue(user.getPantryComments().size() > 0);
	}

}
