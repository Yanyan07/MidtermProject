//package om.skilldistillery.helpinghand.entities;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertNotNull;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//
//import org.junit.jupiter.api.AfterAll;
//import org.junit.jupiter.api.AfterEach;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//
//import com.skilldistillery.helpinghand.entities.Appointment;
//
//public class AppointmentTest {
//	
//	private static EntityManagerFactory emf;
//	private EntityManager em;
//	private Appointment appointment;
//	
//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//		emf = Persistence.createEntityManagerFactory("JPAHelpingHand");
//	}
//
//	@AfterAll
//	static void tearDownAfterClass() throws Exception {
//		emf.close();
//	}
//
//	@BeforeEach
//	void setUp() throws Exception {
//		em = emf.createEntityManager();
//		appointment = em.find(Appointment.class, 1);
//	}
//
//	@AfterEach
//	void tearDown() throws Exception {
//		em.close();
//		appointment = null;
//	}
//
//	@Test
//	@DisplayName("test appointment entity mappings")
//	void test() {
//		assertNotNull(appointment);
//		assertEquals(, appointment.getAppointmentDate());
//		assertEquals(, appointment.getUserId());
//		assertEquals(, appointment.getPantryId());
//		assertEquals(, appointment.getCartId());
//		assertEquals(, appointment.getRating());
//		assertEquals(, appointment.getComment());
//		assertEquals(, appointment.getCreateDate());
//		
//	}
//
//}
