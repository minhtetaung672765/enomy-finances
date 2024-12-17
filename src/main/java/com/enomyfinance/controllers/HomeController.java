package com.enomyfinance.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
    @RequestMapping("/")
    public ModelAndView home() {
    	return new ModelAndView("home");
    }
    
    // Client Login redirect
    @RequestMapping("/clientRegister")
    public ModelAndView clientRegister() {
    	return new ModelAndView("clientRegister");
    }
    @RequestMapping("/clientLogin")
    public ModelAndView clientLogin() {
    	return new ModelAndView("clientLogin");
    }

    // Staff Login redirect
    @RequestMapping("/staffLogin")
    public String staffLogin() {
        return "staffLogin";  
    }
    
    @RequestMapping("/currencyExchange")
    public ModelAndView currencyModule() {
    	return new ModelAndView("currencyModule");
    }
    
    @RequestMapping("/savingAndInvestment")
    public ModelAndView investmentModule() {
    	return new ModelAndView("investmentModule");
    }
}
