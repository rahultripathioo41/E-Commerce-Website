package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;

import entity.Order;

public class OrderDao {
	public void saveOrder(Order order)
    {
    	Transaction transaction = null;
        Session session = null;

        try {
            // Step 1: Create Configuration
            Configuration configuration = new Configuration();
            configuration.configure("config/hibernate.cfg.xml");

            // Step 2: Build SessionFactory
            SessionFactory sessionFactory = configuration.buildSessionFactory();

            // Step 3: Open Session
            session = sessionFactory.openSession();

            // Step 4: Begin Transaction
            transaction = session.beginTransaction();
            
            session.save(order);
            
            transaction.commit();            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
	
	public List<Order> getOrders(int customerId) {
	    Transaction transaction = null;
	    Session session = null;
	    List<Order> orderList = null;

	    try {
	        // Step 1: Create Configuration
	        Configuration configuration = new Configuration();
	        configuration.configure("config/hibernate.cfg.xml");

	        // Step 2: Build SessionFactory
	        SessionFactory sessionFactory = configuration.buildSessionFactory();

	        // Step 3: Open Session
	        session = sessionFactory.openSession();

	        // Step 4: Begin Transaction
	        transaction = session.beginTransaction();

	        // Correct SQL Query
	        String sql = "SELECT * FROM allorders WHERE customerId = :customerId";

	        // Use Native Query
	        NativeQuery<Order> query = session.createNativeQuery(sql, Order.class);
	        query.setParameter("customerId", customerId);

	        // Fetch Results
	        orderList = query.getResultList();

	        // Commit Transaction
	        transaction.commit();
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return orderList;
	}

}
