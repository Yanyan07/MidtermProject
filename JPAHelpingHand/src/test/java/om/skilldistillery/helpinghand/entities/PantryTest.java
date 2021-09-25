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

import com.skilldistillery.helpinghand.entities.Pantry;

class PantryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Pantry pantry;

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
		pantry = em.find(Pantry.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pantry = null;
	}

	@Test
	void test() {
		assertNotNull(pantry);
		assertEquals("Mid-Iowa Community Action (MICA) Food Pantry", pantry.getName());
		assertEquals("515-956-3333", pantry.getPhone());
	}
	
	@Test
	@DisplayName("test pantry to address mapping")
	void test_pantry_address() {
		assertNotNull(pantry);
		assertEquals(1, pantry.getAddress().getId());
	}
	
	@Test
	@DisplayName("test pantry to pantryComments mapping")
	void test_pantry_pantryComments() {
		assertNotNull(pantry);
		assertTrue(pantry.getPantryComments().size() > 0);
	}
	
	@Test
	@DisplayName("test pantry to inventories mappint")
	void test_pantry_inventories() {
		assertNotNull(pantry);
		assertTrue(pantry.getInventories().size() > 0);
	}

}
