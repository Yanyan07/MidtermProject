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

import com.skilldistillery.helpinghand.entities.PantryComment;

class PantryCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PantryComment pantryComment;

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
		pantryComment = em.find(PantryComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pantryComment = null;
	}

	@Test
	void test() {
		assertNotNull(pantryComment);
		assertEquals("this is a comment from pantry_comment", pantryComment.getComment());
		assertEquals(9, pantryComment.getCreateDate().getMonthValue());
	}

	@Test
	@DisplayName("test pantryComment to pantry mapping")
	void test_pantryComment_pantry() {
		assertNotNull(pantryComment);
		assertEquals(1, pantryComment.getPantry().getId());
	}
	
	@Test
	@DisplayName("test pantryComment to user mapping")
	void test_pantryComment_user() {
		assertNotNull(pantryComment);
		assertEquals(1, pantryComment.getUser().getId());
	}
}
