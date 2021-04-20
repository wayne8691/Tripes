package com.iii.trip.shoppingcart.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.model.ProductShopping;
import com.iii.trip.shoppingcart.model.ShoppingOrder;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.shoppingcart.service.ShoppingCartService;
import com.iii.trip.shoppingcart.service.serviceImpl.ProductService;
import com.iii.trip.shoppingcart.service.serviceImpl.ShoppingOrderService;
import com.iii.trip.trainandhotel.repository.Room;

@Controller
public class ShoppingCarTravelRolls {
	@Autowired
	private ShoppingCartService hoteltservice;
	@Autowired
	private MemberBean member;

	@Autowired
	private ShoppingOrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	ShoppingCartService shoppingCart;

	@GetMapping("/controller/hotel")
	public List<Room> Rooms(@RequestParam("citys") String city) {

		List<Room> room = hoteltservice.room(city);
		System.out.println("controller=" + room.get(0).getCity().getName());
//		System.out.println("room=" + room);
		return room;
	}

	@GetMapping("/shoppingcarMain.controller")
	public @ResponseBody TravelRollsProduct shoppingcarView(@SessionAttribute("loginuser") MemberBean member,
			Model model, HttpServletRequest request) {

		List<TravelRollsProduct> sBean = hoteltservice.queryProduct(member);

		TravelRollsProduct Ncar = new TravelRollsProduct();
		HttpSession session = request.getSession();

		Integer price = 0;
		

		if (sBean.size() != 0) {
			// 飯店金錢
			for (int i = 0; i < sBean.get(0).getRoom_id().size(); i++) {

				price+=(sBean.get(0).getRoom_id().get(i).getHotel_id().getPrice().intValue()*sBean.get(0).getRoom_id().get(i).getSumday())*sBean.get(0).getRoom_id().get(i).getQuantity();

			}
			// 套裝行程金錢
			for (int i = 0; i < sBean.get(0).getTravel().size(); i++) {
				price += sBean.get(0).getTravel().get(i).getPrice();

			}
			// 火車金錢
			for (int i = 0; i < sBean.get(0).getTrain().size(); i++) {
				price += sBean.get(0).getTrain().get(i).getPrice();

			}

			sBean.get(0).setPrice(price);
			shoppingCart.insertProduct(sBean.get(0));

//			if (sBean.get(0).getRoom_id().size() != 0) {
//				session.setAttribute("pd", "hotel");
//                 System.out.println("a");
//				return sBean.get(0);
//			} else if (sBean.get(0).getTrain().size() != 0) {
//				 System.out.println("b");
//				session.setAttribute("pd", "train");
//				return sBean.get(0);
//			} else if (sBean.get(0).getTravel().size() != 0) {
//				 System.out.println("c");
//				session.setAttribute("pd", "travel");
//				return sBean.get(0);
//			}

			return sBean.get(0);

		}

		return Ncar;

	}

	@PostMapping("/shoppingProducts")
	public @ResponseBody ProductShopping shoppingProduct(@RequestParam("pk") String pk, Model model) {
		System.out.println("pk" + pk);
		Integer id = Integer.valueOf(pk);
		ProductShopping product = hoteltservice.shoppingProduct(id);

		model.addAttribute("query", product);

		return product;

	}

	@PostMapping("/shoppingProductsUpdate.controller")
	public @ResponseBody Map<String, Object> shoppingProductUpdate(@RequestParam("pk") Integer pk,
			@RequestParam("query") Integer query, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		ProductShopping p = new ProductShopping();
		p.setId(pk);
		p.setQuantity(query);
		hoteltservice.shoppingProductUpdate(p);
//		model.addAttribute("query",product);
		System.out.println("aa");
		map.put("url", "http://localhost:8080/shoppingMember.controller");
		return map;

	}

	@PostMapping("removeProduct.controller")
	public @ResponseBody Map<String, Object> removeProducthotel(@RequestParam("pk") Integer pk) {
		Map<String, Object> map = new HashMap<String, Object>();

		hoteltservice.removeHotel(pk);

		map.put("url", "http://localhost:8080/shoppingMember.controller");

		return map;
	}

	@GetMapping("/shoppingOrderSearch.contrller")
	public @ResponseBody List<ShoppingOrder> shoppingOrderSearch(HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberBean member = (MemberBean) session.getAttribute("loginuser");
		System.out.println(member.getUserid());
//		List<ShoppingOrder> serachOrder = hoteltservice.serachOrder(member);
		List<ShoppingOrder> serachOrder = orderService.findByMember(member.getUserid());
		if (serachOrder.size() != 0) {

			return serachOrder;
		}
		List<ShoppingOrder> serachOrders = new ArrayList<ShoppingOrder>();

		return serachOrders;

	}
//	@GetMapping("/test.controller")
//	public @ResponseBody AttractionsBean attrtest() {
//		
//	AttractionsBean att =hoteltservice.att();

//	String aaString =att.getImage();
//	byte[]testByte =aaString.getBytes();
//	System.out.println(testByte);
//	
//	Base64.Encoder be = Base64.getEncoder();
//	String ff =be.encodeToString(testByte);
//	System.out.println(ff);
//	String ss ="data:image/jpg;base64,"+ff;
//	
//	System.out.println(ss);
//	att.setImage(ss);
//		return att;
//	}
//	

	@PostMapping("/shoppingProduct.controller")
	public @ResponseBody Map<String, Object> shoppingProducts(HttpServletRequest request,
			@RequestParam("roomid") String roomid, Model model, @RequestParam("starDate") String starDate,
			@RequestParam("endDate") String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		MemberBean member = (MemberBean) session.getAttribute("loginuser");

		if (member == null) {
			map.put("member", "notmember");
			return map;

		}

		List<TravelRollsProduct> sBean = hoteltservice.queryProduct(member);

		Room room = hoteltservice.queryRoom(roomid);

		TravelRollsProduct car = new TravelRollsProduct();
		Integer money = room.getPrice().intValue();
		
		
		
		
		// 天數相減
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Integer sumDays = 0;
		
			// 飯店金錢
		
				long time;
				try {
					time = sdf.parse(starDate).getTime();
					long time1 = sdf.parse(endDate).getTime();
					sumDays = (int) ((time1 - time) / (24 * 60 * 60 * 1000));

				} catch (ParseException e) {

					e.printStackTrace();
				}
				System.out.println("days=" + sumDays);
				if (sumDays == 0) {
					sumDays = 1;
				}

			

			ProductShopping pBean1 = new ProductShopping(room, starDate, endDate, sumDays, 1, money, 0, 0, "",
					member.getUserid());
			if (sBean.size() == 0) {
//			List<ProductShopping> ProductShoppingSet = new ArrayList<ProductShopping>(Arrays.asList(pBean1));
				car = new TravelRollsProduct(member, "0");
				car.getRoom_id().add(pBean1);
				hoteltservice.insertProduct(car);
				map.put("addproduct", "以新增至購物車");
				System.out.println("我是新的購物車");

			} else {
				System.out.println("ffffffffffffffffffffff");
				boolean flag = false;

				for (int i = 0; i < sBean.get(0).getRoom_id().size(); i++) {

					if (room.getId().equals(sBean.get(0).getRoom_id().get(i).getHotel_id().getId())
							&& pBean1.getStarday().equals(sBean.get(0).getRoom_id().get(i).getStarday())
							&& sBean.get(0).getRoom_id().get(i).getEndday().equals(endDate)) {

						Integer sQ = sBean.get(0).getRoom_id().get(i).getQuantity();
						sQ++;
						sBean.get(0).getRoom_id().get(i).setQuantity(sQ);
						flag = true;
						System.out.println("房間+1");
					}

				}

				if (!flag) {

					sBean.get(0).getRoom_id().add(pBean1);
					System.out.println("我是新的購物車2");
				}
				hoteltservice.insertProduct(sBean.get(0));
				model.addAttribute("car", car);
				map.put("addproduct", "以新增至購物車");
			}
		
		return map;
	}

	// 移除飯店
	@PostMapping("/shoppingProductRemove.controller")
	public @ResponseBody Map<String, Object> shoppingProductRemove(@RequestParam("id") Integer id,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		productService.removeProduct(id);
		HttpSession session = request.getSession();
		session.removeAttribute("pd");
		session.setAttribute("pd", "hotel");

		return map;

	}

//
//	@RequestMapping(path = "/shoppingProductUpdate.controller")
//	public String shoppingProductUrdate(@SessionAttribute("loginuser") MemberBean member,
//			@RequestParam("update") String id, @RequestParam("select") String query,
//			/* @SessionAttribute("Product")TravelRollsProduct sBeans, */ Model model) {
//		System.out.println("prdduct" + id);
//		member.setUserid(member.getUserid());
//		// List<TravelRollsProduct> listProduct =shoppingCartservice.queryProduct(member);
//
//		shoppingCartshoppingCartservice.updateQuery(id, query);
//
//		return shoppingcarView(member, model);
//	}

}