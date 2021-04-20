package com.iii.trip.trainandhotel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iii.trip.trainandhotel.repository.Train;
import com.iii.trip.trainandhotel.repository.TrainRepository;
import com.iii.trip.trainandhotel.repository.TrainStationRepository;

@Controller
@RequestMapping(value="/train")
public class TrainController {
	private static final String TEMPLATE_PREFIX = "/trainandhotel/train";
	
	@Autowired
	private TrainRepository trainRepo;
	@Autowired
	private TrainStationRepository tsRepo;
	
	@GetMapping("/ticket")
    public String ticket(HttpServletRequest request){
    	request.setAttribute("all",tsRepo.findAll());
    	return TEMPLATE_PREFIX +"/ticket";
    }
	
	@PostMapping("/ticket2")
	public String ticket2(HttpServletRequest request,@RequestParam("start") String start){
		List<Train> trainList = trainRepo.findByStart(start);
    	request.setAttribute("start",trainList);
    	return TEMPLATE_PREFIX +"/ticket2";
    }
	
	@PostMapping("/ticket3")
	public String ticket3(HttpServletRequest request,@RequestParam("start") String start,@RequestParam("dest") String dest){
		List<Train> trainList = trainRepo.findByStartAndDest(start,dest);
    	request.setAttribute("ticket",trainList);
    	return TEMPLATE_PREFIX +"/ticket3";
    }


}
