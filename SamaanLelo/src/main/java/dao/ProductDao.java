package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entity.Product;

public class ProductDao {
	// insert product
	public void insertProduct(Product product) {
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

			
			session.save(product);

			transaction.commit();
			System.out.println("product inserted");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback(); // Rollback transaction if an error occurs
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close(); // Close the session to release resources
			}
		}
	}

	public Product viewProduct(int productId) {

		Transaction transaction = null;
		Session session = null;
		Product product = null;

		try {

			Configuration configuration = new Configuration();
			configuration.configure("config/hibernate.cfg.xml");

			// Step 2: Build SessionFactory
			SessionFactory sessionFactory = configuration.buildSessionFactory();

			// Step 3: Open Session
			session = sessionFactory.openSession();

			// Step 4: Begin Transaction
			transaction = session.beginTransaction();
			// Use session.get() to fetch the product by its primary key
			product = session.get(Product.class, productId);

			// Check if the product exists
			if (product == null) {
				System.out.println("Product with ID " + productId + " not found.");
			}
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback(); // Rollback transaction if an error occurs
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close(); // Close the session to release resources
			}
		}
		return product;
	}

	// method to return all the products
	public List<Product> allProducts() {
		Transaction transaction = null;
		Session session = null;
		List<Product> products = new ArrayList<Product>();

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

			String hql = "FROM Product";
			Query<Product> query = session.createQuery(hql, Product.class);
			products = query.getResultList();

		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback(); // Rollback transaction if an error occurs
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close(); // Close the session to release resources
			}
		}

		return products;

	}

	public void Buyproduct(int productId, int quantitybuyed) {
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

			String sql = "UPDATE product SET quantity = quantity - :quantitybuyed WHERE productId = :productId";

			// Use createNativeQuery for native SQL
			session.createNativeQuery(sql).setParameter("quantitybuyed", quantitybuyed) // Set quantity parameter
					.setParameter("productId", productId) // Set productId parameter
					.executeUpdate();

			transaction.commit();
			System.out.println("product buyed");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback(); // Rollback transaction if an error occurs
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close(); // Close the session to release resources
			}
		}
	}
	
	public void updateProduct(int productId, int quantity,int price) {
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

			String sql = "UPDATE product SET quantity = quantity+ :quantity,price= :price WHERE productId = :productId";

			// Use createNativeQuery for native SQL
			session.createNativeQuery(sql).setParameter("quantity", quantity) // Set quantity parameter
					.setParameter("productId", productId) // Set productId parameter
					.setParameter("price", price)
					.executeUpdate();

			transaction.commit();
			System.out.println("product updated");
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback(); // Rollback transaction if an error occurs
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close(); // Close the session to release resources
			}
		}
	}
	
	

}
