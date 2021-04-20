package com.iii.trip.shoppingcart.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.shoppingcart.service.serviceImpl.ShoppingOrderService;

@Controller
public class ManagerShoppingOrder {

	@Autowired
	private ShoppingOrderService managetOrder;

	@GetMapping("/ManagerOrder")
	public String shoppingOrderManeger(Model m) {

		List<ShoppingOrder> findAllOrder = managetOrder.findAll();

		Integer[] count = new Integer[findAllOrder.size()];
		Integer cou = 0;

		for (int i = 0; i < findAllOrder.size(); i++) {

			for (int j = 0; j < findAllOrder.get(i).getShoppingcar_id().getRoom_id().size(); j++) {
				if (findAllOrder.get(i).getShoppingcar_id().getRoom_id().get(j).getCheckout() == 1
						&& findAllOrder.get(i).getShoppingcar_id().getRoom_id().get(j).getRoomout() == 0) {
					cou++;
				}

			}

			count[i] = cou;

			cou = 0;
			System.out.println(count[i]);

		}

		m.addAttribute("order", findAllOrder);
		m.addAttribute("count", count);
		return "/shoppingCart/ManagerShoppingOrder";

	}

	@PostMapping("/products/Manager")
	public @ResponseBody String shoppingProductAllManeger(@RequestParam("id") Integer id, HttpServletRequest request) {

		ShoppingOrder findByOrderId = managetOrder.findByProductId(id);
		List<ProductShopping> products = findByOrderId.getShoppingcar_id().getRoom_id();
		HttpSession session = request.getSession();
		session.setAttribute("product", products);
		session.setAttribute("productsize", products.size());
		return "goroproducts";

	}

	@GetMapping("/Managerproducts")
	public String goToShoppingProducts() {

		return "shoppingCart/manegerproducts";

	}

	@GetMapping("/Managerproductsnotout")
	public String goToShoppingProductsNotOut() {

		return "shoppingCart/managerhotelnotout";

	}

	@PostMapping("/productouts/Manager")
	public @ResponseBody String shoppingProductOutManeger(@RequestParam("id") Integer id, HttpServletRequest request) {

		ShoppingOrder findByOrderId = managetOrder.findByProductId(id);
		List<ProductShopping> products = findByOrderId.getShoppingcar_id().getRoom_id();
		List<ProductShopping> productOutList = new ArrayList<ProductShopping>();
		System.out.println(products.size() == 0);
		for (int i = 0; i < products.size(); i++) {

			if (products.get(i).getCheckout() == 1 && products.get(i).getRoomout() == 0) {
				productOutList.add(products.get(i));
			}

		}

		HttpSession session = request.getSession();
		session.removeAttribute("productout");
		session.removeAttribute("productoutsize");
		session.removeAttribute("oId");
		session.setAttribute("productout", productOutList);
		session.setAttribute("oId", id);
		session.setAttribute("productoutsize", productOutList.size());
		return "goroproducts";

	}

	@PostMapping("/Manager/productcheckout")
	public @ResponseBody String ManegerShoppingProductOut(@RequestParam("id") Integer id, HttpServletRequest request,
			@RequestParam("type") String checkout) {
		System.out.println("checjout");
		managetOrder.checkOut(id, checkout);

		return "ok";

	}

	@GetMapping("/Manager/productoutsAfter")
	public String shoppingProductOutAfter(@SessionAttribute("oId") Integer id, HttpServletRequest request) {

		ShoppingOrder findByOrderId = managetOrder.findByProductId(id);
		List<ProductShopping> products = findByOrderId.getShoppingcar_id().getRoom_id();
		List<ProductShopping> productOutList = new ArrayList<ProductShopping>();
		System.out.println(products.size() == 0);
		for (int i = 0; i < products.size(); i++) {

			if (products.get(i).getCheckout() == 1 && products.get(i).getRoomout() == 0) {
				productOutList.add(products.get(i));
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("productout", productOutList);
		session.setAttribute("oId", id);
		session.setAttribute("productoutsize", productOutList.size());
		return "shoppingCart/manegerproducts";

	}

	@PostMapping("/Manager/ManagerAllproducts")
	public @ResponseBody Map<String, Object> managerShoppingProductAll(@RequestParam("id") Integer id,
			HttpServletRequest request) {

		ShoppingOrder findByOrderId = managetOrder.findByProductId(id);
		List<ProductShopping> products = findByOrderId.getShoppingcar_id().getRoom_id();

		HttpSession session = request.getSession();

		session.removeAttribute("productAll");
		session.removeAttribute("oId");
		session.removeAttribute("productAllsize");
		System.out.println(products.get(0).getId());
		session.setAttribute("productAll", products);
		session.setAttribute("productAllsize", products.size());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", "http://localhost:8080/ManagerAllproducts");
		return map;

	}

	@GetMapping("/ManagerAllproducts")
	public String managerAllProductHotel() {
		return "shoppingCart/managerproductAll";
	}

	@PostMapping("/Manager/notrppmout")
	public @ResponseBody String shoppingProductOutnotrppmout(@RequestParam("id") Integer id,
			HttpServletRequest request) {

		ShoppingOrder findByOrderId = managetOrder.findByProductId(id);
		List<ProductShopping> products = findByOrderId.getShoppingcar_id().getRoom_id();
		List<ProductShopping> productOutList = new ArrayList<ProductShopping>();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaa");
		for (int i = 0; i < products.size(); i++) {

			if (products.get(i).getCheckout() == 1 && products.get(i).getRoomout() == 1) {
				productOutList.add(products.get(i));
			}
		}

		HttpSession session = request.getSession();

		session.removeAttribute("productAll");
		session.removeAttribute("oId");
		session.removeAttribute("productAllsize");
		session.setAttribute("productAll", productOutList);
		session.setAttribute("oId", id);
		session.setAttribute("productAllsize", productOutList.size());
		return "shoppingCart/manegerproducts";

	}

	@PostMapping("/Manager/Statistical")
	public @ResponseBody Map<String, Object> shoppingcartStatistical() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ShoppingOrder> findOrderAll = managetOrder.findAll();

		List<TravelRollsProduct> productOutList = managetOrder.findshoppingCartAll();
		Integer sunPrice = 0;
		Integer room = 0;
		Integer train = 0;
		Integer travel = 0;

		Integer dateroom01 = 0;
		Integer datetrain01 = 0;
		Integer datetravel01 = 0;

		Integer dateroom15 = 0;
		Integer datetrain15 = 0;
		Integer datetravel15 = 0;

		Integer dateroom23 = 0;
		Integer datetrain23 = 0;
		Integer datetravel23 = 0;
		for (int i = 0; i < productOutList.size(); i++) {
			for (int j = 0; j < productOutList.get(i).getRoom_id().size(); j++) {
				sunPrice += productOutList.get(i).getRoom_id().get(j).getPrices();

			}
			for (int k = 0; k < productOutList.get(i).getTrain().size(); k++) {
				sunPrice += productOutList.get(i).getTrain().get(k).getPrice();

			}

			for (int x = 0; x < productOutList.get(i).getTravel().size(); x++) {
				sunPrice += productOutList.get(i).getTravel().get(x).getTravelGroup().getPrice();

			}

		}

		for (int i = 0; i < findOrderAll.size(); i++) {

			room += findOrderAll.get(i).getShoppingcar_id().getRoom_id().size();
			train += findOrderAll.get(i).getShoppingcar_id().getTrain().size();
			travel += findOrderAll.get(i).getShoppingcar_id().getTravel().size();

			
			for (int j = 0; j < findOrderAll.get(i).getShoppingcar_id().getRoom_id().size(); j++) {
				Integer date = Integer.valueOf(findOrderAll.get(i).getDate().substring(8, 10));
				System.out.println(date);
				if (date > 1 && date < 15) {
					dateroom01 += findOrderAll.get(i).getShoppingcar_id().getRoom_id().get(j).getQuantity();
					
					
				}
				if (date <= 15 ) {
					dateroom15 += findOrderAll.get(i).getShoppingcar_id().getRoom_id().get(j).getQuantity();
					
					
				}
				if (date <= 23) {
					dateroom23 += findOrderAll.get(i).getShoppingcar_id().getRoom_id().get(j).getQuantity();
					
					
				}
			}
			
			
			
			for (int j = 0; j < findOrderAll.get(i).getShoppingcar_id().getTrain().size(); j++) {
				Integer date = Integer.valueOf(findOrderAll.get(i).getDate().substring(8, 10));
				
				if (date > 1 && date < 15) {
					datetrain01 += findOrderAll.get(i).getShoppingcar_id().getTrain().get(j).getQutity();
					
					
				}
				if (date <= 15) {
					datetrain15 += findOrderAll.get(i).getShoppingcar_id().getTrain().get(j).getQutity();
					
					
				}
				if (date == 23) {
					datetrain23 += findOrderAll.get(i).getShoppingcar_id().getTrain().get(j).getQutity();
					
					
				}
			}
			
			
			
			
			
			
			for (int j = 0; j < findOrderAll.get(i).getShoppingcar_id().getTravel().size(); j++) {
				Integer date = Integer.valueOf(findOrderAll.get(i).getDate().substring(8, 10));
				
			if (date > 1 && date < 15) {

				System.out.println(date);
				datetravel01 += findOrderAll.get(i).getShoppingcar_id().getTravel().get(j).getQuantity();
			}

			if (date <= 15) {

				
				datetravel15 += findOrderAll.get(i).getShoppingcar_id().getTravel().get(j).getQuantity();
			}
			if (date <= 23) {

				
				datetravel23 += findOrderAll.get(i).getShoppingcar_id().getTravel().get(j).getQuantity();
				
			}

		}
	}
	
		
		
		System.out.println(datetravel01);
		
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd ");
		
		
		
		Date date = new Date();
		String strDate = sdFormat.format(date);

		map.put("order", findOrderAll);
		map.put("car", productOutList);
		map.put("price", sunPrice);
		map.put("date", strDate);

		map.put("room", room);
		map.put("train", train);
		map.put("travel", travel);

		map.put("dateroom01", dateroom01);
		map.put("datetrain01", datetrain01);
		map.put("datetravel01", datetravel01);

		map.put("dateroom15", dateroom15);
		map.put("datetrain15", datetrain15);
		map.put("datetravel15", datetravel15);

		map.put("dateroom23", dateroom23);
		map.put("datetrain23", datetrain23);
		map.put("datetravel23", datetravel23);

		return map;

	}

	@GetMapping("/Manager/statisticalGuide")
	public String shoppingcartStatisticalGuide() {

		return "shoppingCart/statistical";

	}

//    @PostMapping("/Manager/notrppmoutafter")
//    public String shoppingProductNetOutAfter(@SessionAttribute("oId") Integer id,HttpServletRequest request){
// 		
//     	ShoppingOrder findByOrderId =  managetOrder.findByProductId(id);
//     	List<ProductShopping> products =findByOrderId.getShoppingcar_id().getRoom_id();
//     	List<ProductShopping> productOutList =new  ArrayList<ProductShopping>();
//     	System.out.println(products.size()==0);
//     	for (int i=0;i< products.size();i++ ) {
//     		
//     		if(products.get(i).getCheckout()==1&&products.get(i).getRoomout()==1) {
//     			productOutList.add(products.get(i));  			
//     		}	
//		}
//     	
//     	
//     	
//     	HttpSession session  =request.getSession();
//     	session.setAttribute("notrppmout", productOutList);
//     	session.setAttribute("oId", id);
//     	session.setAttribute("notrppmoutsize", productOutList.size());
// 		return"shoppingCart/manegerproducts" ;
// 	
// 	}

}
