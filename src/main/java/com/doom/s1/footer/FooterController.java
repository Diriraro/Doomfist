package com.doom.s1.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/footer/**")
public class FooterController {
	
	@GetMapping("legalnotice")
	public void legalnotice()throws Exception {
		
	}
	
	@GetMapping("privacy")
	public void privacy()throws Exception{
		
	}
	@GetMapping("company")
	public void company()throws Exception{
		
	}
	@GetMapping("membergrade")
	public void membergrade()throws Exception{
		
	}

}
