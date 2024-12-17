package com.enomyfinance.controllers;

import com.enomyfinance.models.InvestmentQuote;
//import com.enomyfinance.services.InvestmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class InvestmentController {

    @Autowired
    private InvestmentService investmentService;

    @PostMapping("/calculateInvestmentQuote")
    public String calculateInvestmentQuote(
            @RequestParam("investmentType") String investmentType,
            @RequestParam("initialLumpSum") double initialLumpSum,
            @RequestParam("monthlyAmount") double monthlyAmount,
            Model model) {

        // Calculate the investment quote based on user input
        InvestmentQuote quote = investmentService.calculateInvestment(investmentType, initialLumpSum, monthlyAmount);

        // Add the quote to the model so it can be displayed in the JSP
        model.addAttribute("investmentQuote", quote);
//        model.addAttribute("investmentQuote", investmentType);
//        model.addAttribute("investmentQuote", initialLumpSum);
//        model.addAttribute("investmentQuote", monthlyAmount);

        // Return the JSP view name where the investment quote will be displayed
        return "investmentResult"; // This corresponds to 'investmentResult.jsp'
    }
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostMapping("/confirmInvestment")
    @ResponseBody
    public String confirmInvestment(
            @RequestParam("investmentType") String investmentType,
            @RequestParam("initialLumpSum") double initialLumpSum,
            @RequestParam("monthlyAmount") double monthlyAmount,
            @RequestParam("return1Year") double return1Year,
            @RequestParam("return5Years") double return5Years,
            @RequestParam("return10Years") double return10Years,
            @RequestParam("totalProfit") double totalProfit,
            @RequestParam("totalFee") double totalFee,
            @RequestParam("totalTax") double totalTax) {

        // SQL query to insert the investment data into the database
        String sql = "INSERT INTO investment (investment_type, initial_investment, monthly_investment, return_1_year, return_5_years, return_10_years, total_profit, total_fee, total_tax, client_client_id, created_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        // Execute the query with the passed parameters
        jdbcTemplate.update(sql, investmentType, initialLumpSum, monthlyAmount, return1Year, return5Years, return10Years, totalProfit, totalFee, totalTax, 1);

        // Return success message
        return "Transaction confirmed successfully!";
    }
}


