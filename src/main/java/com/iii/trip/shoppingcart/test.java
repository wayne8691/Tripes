package com.iii.trip.shoppingcart;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.trip.attractions.model.AttractionsBean;

@Controller
public class test {




@GetMapping("/tests")
public String tests() {
	
	return "shoppingCart/noProduct";
}


	
}
