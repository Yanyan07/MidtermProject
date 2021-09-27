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
		@DisplayName("Test appointment entity mappings")
		void test() {
			assertNotNull(cart);
			assertEquals(1, cart.getId());
			assertEquals(2021, cart.getCreateDate().getYear());
			assertEquals(9, cart.getCreateDate().getMonthValue());
			assertEquals(24, cart.getCreateDate().getDayOfMonth());
			assertEquals(18, cart.getCreateDate().getHour());
			assertEquals(18, cart.getCreateDate().getMinute());
			assertEquals(33, cart.getCreateDate().getSecond());
			assertEquals(false, cart.isCompleted());
			
		}
		
		@Test
		@DisplayName("Test user ManyToOne cart mappings")
		void test_user_ManyToOne_cart_mappings() {
			assertNotNull(cart);
			assertNotNull(cart.getUser());
			assertEquals(1, cart.getUser().getId());

		}

	}

