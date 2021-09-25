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
		assertEquals("admin", pantry.getName());
		assertEquals("helping", pantry.getPhone());
	}

}
