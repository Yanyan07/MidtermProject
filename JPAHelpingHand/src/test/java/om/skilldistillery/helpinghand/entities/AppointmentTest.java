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

import com.skilldistillery.helpinghand.entities.Appointment;

public class AppointmentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Appointment appointment;
	
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
		appointment = em.find(Appointment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		appointment = null;
	}

	@Test
	@DisplayName("test appointment entity mappings")
	void test() {
		assertNotNull(appointment);
		assertEquals(2021-09-25 17:18:33, appointment.getAppointmentDate());
		assertEquals(1, appointment.getUserId());
		assertEquals(1, appointment.getPantryId());
		assertEquals(1, appointment.getCartId());
		assertEquals(4, appointment.getRating());
		assertEquals("this is a comment from the appointment", appointment.getComment());
		assertEquals(2021-09-24 17:18:33, appointment.getCreateDate());
		
	}

}
