package com.iii.trip.shoppingcart.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.iii.trip.attractions.model.TravelGroupBean;
import com.iii.trip.member.model.MemberBean;
import com.iii.trip.shoppingcart.model.TrainTicket;
import com.iii.trip.shoppingcart.model.Travel;
import com.iii.trip.shoppingcart.model.TravelRollsProduct;
import com.iii.trip.shoppingcart.service.ShoppingCartService;
import com.iii.trip.shoppingcart.service.TicketService;
import com.iii.trip.trainandhotel.repository.Train;

@Controller
public class TicketController {
	@Autowired
	TicketService ticketService;
	@Autowired
	ShoppingCartService shoppingCartService;

	// 購買火車
	@PostMapping("/trainTicket")
	public @ResponseBody Map<String, Object> trainTicket(@RequestParam("price") Integer qutity,
			@RequestParam("star") String star, @RequestParam("end") String end
			,HttpServletRequest request) {
		
		HttpSession session =request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean member =(MemberBean) session.getAttribute("loginuser");
		if(member==null) {
			map.put("member", "notmember");
			return map;
			
			
		}
		
		
		
		
		List<TravelRollsProduct> shoppingcar = shoppingCartService.queryProduct(member);
		Train seachTeain = ticketService.findByTrainPrice(star, end, qutity);

		int count = 0;
		Integer pringInteger = 0;
		if (shoppingcar.size() == 0) {
			pringInteger+=seachTeain.getPrice().intValue()*qutity;
			TrainTicket trainTicket = new TrainTicket(seachTeain);
			trainTicket.setQutity(qutity);
			trainTicket.setPrice(pringInteger);
			TravelRollsProduct newShoppingcar = new TravelRollsProduct();
			
			newShoppingcar.setMemberNumber(member);
			newShoppingcar.getTrain().add(trainTicket);
			newShoppingcar.setSituation("0");
			
			shoppingCartService.insertProduct(newShoppingcar);
		} else {
			// 計算是不是同一種票
			for (int i = 0; i < shoppingcar.get(0).getTrain().size(); i++) {

				if (shoppingcar.get(0).getTrain().get(i).getTrain().getId().equals(seachTeain.getId())) {

					int qu = shoppingcar.get(0).getTrain().get(i).getQutity();
					qu += qutity;
					count++;
					shoppingcar.get(0).getTrain().get(i).setQutity(qu);
					// 重新計算購買金額
					pringInteger = shoppingcar.get(0).getTrain().get(i).getTrain().getPrice().intValue();
					pringInteger *= shoppingcar.get(0).getTrain().get(i).getQutity();
					shoppingcar.get(0).getTrain().get(i).setPrice(pringInteger);
				}

			}
			// 如果不同票的話
			if (count == 0) {
				TrainTicket trainTicket = new TrainTicket(seachTeain);
				trainTicket.setQutity(qutity);
				trainTicket.setPrice(seachTeain.getPrice().intValue());

				shoppingcar.get(0).getTrain().add(trainTicket);
			}

			shoppingCartService.insertProduct(shoppingcar.get(0));

		}

		map.put("insert", "已加入購物車");

		return map;
	}

	// 購買套裝行程
	@PostMapping("/tricket.controller")
	public @ResponseBody Map<String, String> buytricket(@RequestParam("id") Integer id,HttpServletRequest request,
			@RequestParam("date") String date,@RequestParam("did")Integer did) {
		
		
		System.out.println("---------------------------------------------"+did);
		HttpSession session =request.getSession();
		Map<String, String> map = new HashMap<String, String>();
		MemberBean member =(MemberBean) session.getAttribute("loginuser");
		if(member==null) {
			map.put("member", "notmember");
			return map;
			
			
		}
		Integer price = 0;
		List<TravelRollsProduct> shoppingcar = shoppingCartService.queryProduct(member);
		TravelGroupBean ticket = ticketService.findById(id);

		Travel travel = new Travel(ticket);
		travel.setDate(date);
		boolean flag = false;
		
		if (shoppingcar.size() == 0) {
			TravelRollsProduct newShoppingcar = new TravelRollsProduct();
			newShoppingcar.setMemberNumber(member);
			travel.setDate(date);
			travel.setPrice(ticket.getPrice());
			newShoppingcar.getTravel().add(travel);
			
			newShoppingcar.setSituation("0");

			shoppingCartService.insertProduct(newShoppingcar);
		} else {
			for (int i = 0; i < shoppingcar.get(0).getTravel().size(); i++) {
				
				if(date.equals(shoppingcar.get(0).getTravel().get(i).getDate())) {
		
				// 計算票是否重複
				if (shoppingcar.get(0).getTravel().get(i).getTravelGroup().getId() == ticket.getId()) {

					Integer quantity = shoppingcar.get(0).getTravel().get(i).getQuantity();
					quantity++;

					shoppingcar.get(0).getTravel().get(i).setQuantity(quantity);
					flag = true;
					// 算出金錢
					
						price += shoppingcar.get(0).getTravel().get(i).getTravelGroup().getPrice()
								* shoppingcar.get(0).getTravel().get(i).getQuantity();
						shoppingcar.get(0).getTravel().get(i).setPrice(price);											
						System.out.println("aaaaaaaa:"+price);
				}
			  }
			}
			// 如果沒有重複計算
			if (!flag) {
                 System.out.println("aaaa");
				travel.setQuantity(1);
				travel.setPrice(ticket.getPrice());
				shoppingcar.get(0).getTravel().add(travel);
			}

			// 存進資料庫
			shoppingCartService.insertProduct(shoppingcar.get(0));
		}
        
		map.put("insert", "已加入購物車");
		ticketService.groupDateRemainig(did);
		return map;

	}

	// 套裝行程移除
	@PostMapping("/travel/remove")
	public @ResponseBody String removeTravel(@RequestParam("id") Integer id, HttpServletRequest request) {

		ticketService.findByTeavelReomve(id);
		HttpSession session = request.getSession();
		session.removeAttribute("pd");
		session.setAttribute("pd", "travel");

		return "ok";

	}

	@PostMapping("/ticketprice")
	public @ResponseBody Map<String, Object> ticketPrice(@RequestParam("price") Integer price,
			@RequestParam("star") String star, @RequestParam("end") String end, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();

		Train findByTrainPrice = ticketService.findByTrainPriceSeach(star, end);
		System.out.println(findByTrainPrice.getId());
		Integer intValue = findByTrainPrice.getPrice().intValue();
		intValue *= price;
		model.addAttribute("prices", intValue);
		map.put("train", findByTrainPrice);
		map.put("price", intValue);
		return map;

	}

	// 移除火車套票
	@PostMapping("/train/remove")
	public @ResponseBody String removeTrain(@RequestParam("id") Integer id, HttpServletRequest request) {

		ticketService.findByTrainIdRomove(id);

		HttpSession session = request.getSession();
		session.removeAttribute("pd");
		session.setAttribute("pd", "train");

		return "ok";

	}

}
