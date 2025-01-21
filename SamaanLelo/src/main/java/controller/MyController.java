package controller;

import java.util.Date;
import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CustomerDao;
import dao.OrderDao;
import dao.ProductDao;
import entity.Customer;
import entity.Order;
import entity.Product;
//import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/LoginAndRegister")
public class MyController {

    public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public MyController() {
        System.out.println("MyController initialized");
    }
    
	private OrderDao orderDao;
	
    public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	private CustomerDao customerDao;
    
    private ProductDao productDao; 

    public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@GetMapping("/register")
    public String goToRegisterPage() {
        System.out.println("Handling /register request");
        
        return "register";
    }
    
    @GetMapping("/registerDetails")
    public String goToProfile(@ModelAttribute Customer customer, Model model) {
        System.out.println("Customer Name: " + customer.getName());
        customerDao.insertCustomer(customer);
        Customer c1=customerDao.verifyLogin(customer.getEmail(), customer.getPassword());
        model.addAttribute("customer", c1); // Add the customer object to the model
        List<Product> products=productDao.allProducts();
		model.addAttribute("products",products);
        return "Profile";
    }
    
    @GetMapping("/loginHere")
    public String goToLoginPage() {
        System.out.println("Handling /loginHere request");
        
        return "login";
    }

    @GetMapping("/login")
    public String gotoProfile(@ModelAttribute Customer customer ,Model  m) {
    	System.out.println("Handling /login1 request");
    	customer=customerDao.verifyLogin(customer.getEmail(),customer.getPassword());
    	
    	
    	System.out.println("checking whether customer exist or not");
        if(customer!=null)
        {
        	System.out.println("customer exist but now now  checking you are admin or not");
        	
        	if (customer.getEmail().equals("rahultripathioo41@gmail.com") && customer.getPassword().equals("hola")) 
        	{
        	    return "admin";
        	}

        	else 
        	{
        		System.out.println("you are not  the admin");
        		m.addAttribute("customer",customer);
        		List<Product> products=productDao.allProducts();
        		m.addAttribute("products",products);
        		
        		return "Profile";
        	}
        }
        else {
        	return "error";
        }
        
    }
    @RequestMapping("/submitProduct")
    public String insertProduct(@ModelAttribute Product product)
    {
    	productDao.insertProduct(product);
		return "admin";
    	
    }
    @RequestMapping("/updateProduct")
    public String updateProduct(@RequestParam("productId") int productId,@RequestParam("quantity") int quantity,@RequestParam("price") int price)
    
    {
    	productDao.updateProduct(productId, quantity, price);
		return "admin";
    	
    }
    
    @RequestMapping("/buyProduct")
    public String BuyProduct(@RequestParam("productId") int productId,@RequestParam("productPrice") int productPrice,@RequestParam("productName") String productName,@RequestParam("quantity") int quantity,@RequestParam("customerId") int customerId ,Model m)
    {
    	productDao.Buyproduct(productId, quantity);
    	Order order=new Order();
    	order.setProductId(productId);
    	order.setQuantity(quantity);
    	Date date=new Date();
    	order.setTotalCost(productPrice*quantity);
    	order.setProductName(productName);
		order.setDate(date);
		order.setCustomerId(customerId);
		
		orderDao.saveOrder(order);
		Customer customer=customerDao.getCustomer(customerId);
		m.addAttribute("customer",customer);
		List<Product> products=productDao.allProducts();
		m.addAttribute("products",products);
		return "Profile";
    	
    }
    
    @GetMapping("/viewOrders")
    public String getOrders(@RequestParam("customerId") int customerId, Model model) {
        List<Order> orderList = orderDao.getOrders(customerId); // Fetch from service
        //System.out.println(orderList);
		/*
		 * for (Order order : orderList) { System.out.println(order); }
		 */
        model.addAttribute("orderList", orderList);
        model.addAttribute("customerId",customerId);
        return "order";
    }
}
