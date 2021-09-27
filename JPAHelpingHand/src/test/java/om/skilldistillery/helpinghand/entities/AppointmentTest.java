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
	@DisplayName("Test appointment entity mappings")
	void test() {
		assertNotNull(appointment);
		assertEquals(2021, appointment.getAppointmentDate().getYear());
		assertEquals(9, appointment.getAppointmentDate().getMonthValue());
		assertEquals(25, appointment.getAppointmentDate().getDayOfMonth());
		assertEquals(4, appointment.getRating());
		assertEquals("this is a comment from the appointment", appointment.getComment());

		
	}
	
	@Test
	@DisplayName("Test ManyToOne User to Appointment")
	void test_manytoone_user_to_appointment() {
//		 SELECT appointment.id from appointment JOIN user on user.id=appointment.user_id;
		assertNotNull(appointment);
		assertNotNull(appointment.getUser());
		assertEquals(1, appointment.getUser().getId());
	}
	
	@Test
	@DisplayName("Test ManyToOne Pantry to Appointment")
	void test_manytoone_pantry_to_appointment() {
//		SELECT pantry.id from appointment JOIN pantry on pantry.id=appointment.pantry_id;
		assertNotNull(appointment);
		assertNotNull(appointment.getPantry());
		assertEquals(1, appointment.getPantry().getId());
	}
	
	@Test
	@DisplayName("Test Cart to Appointment")
	void test_cart_to_appointment(){
//		SELECT cart.id from appointment JOIN cart on cart.id=appointment.cart_id;	
		assertNotNull(appointment);
		assertNotNull(appointment.getCart());
		assertEquals(1, appointment.getCart().getId());
	}

}
