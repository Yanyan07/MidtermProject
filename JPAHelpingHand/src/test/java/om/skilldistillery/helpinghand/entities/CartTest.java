package om.skilldistillery.helpinghand.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.helpinghand.entities.Cart;

public class CartTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cart cart;
	
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
		cart = em.find(Cart.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cart = null;
	}

	@Test
	@DisplayName("test appointment entity mappings")
	void test() {
		assertNotNull(cart);
		assertEquals(1, cart.getUserId());
		assertEquals(2021-09-24 17:18:33, cart.getCreateDate());
		assertEquals(0, cart.isCompleted());
		
	}

}
