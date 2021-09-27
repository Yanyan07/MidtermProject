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

import com.skilldistillery.helpinghand.entities.Inventory;

class InventoryTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Inventory inventory;
	
	

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
		inventory = em.find(Inventory.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		inventory = null;
	}

	@Test
	void test() {
		assertNotNull(inventory);
		assertEquals("Bag Lunch", inventory.getName());
//		assertEquals(, inventory.getImageURL());
		assertEquals(1, inventory.getLimit());
		assertEquals("This brown bag contains a lunch", inventory.getDescription());
		assertEquals(1, inventory.getPantry().getId());

	}
	
//	@Test
//	@DisplayName("Test ManyToOne Pantry to Inventory")
//	void test_manytoone_pantry_to_inventory() {
////		SELECT pantry.id from inventory Join pantry on pantry.id = inventory;
//	}

		
		
		

}