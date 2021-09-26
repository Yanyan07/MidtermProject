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
import org.junit.jupiter.api.Test;

import com.skilldistillery.helpinghand.entities.ShoppingCartItem;

class ShoppingCartItemTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ShoppingCartItem shoppingCartItem;

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
		shoppingCartItem = em.find(ShoppingCartItem.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		shoppingCartItem = null;
	}

	@Test
	void test() {
		assertNotNull(shoppingCartItem);
		assertEquals(1, shoppingCartItem.getInventoryItemId());
		assertEquals(1, shoppingCartItem.getCartId());
	}

}
