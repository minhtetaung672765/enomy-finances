package com.enomyfinance.controllers;

import com.enomyfinance.models.Investment;
import com.enomyfinance.models.Transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
public class StaffDashboardController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/staffDashboard")
    public String staffDashboard(HttpServletRequest request) {
        // Query the investment table
        String sql = "SELECT * FROM investment";
        List<Investment> investmentList = jdbcTemplate.query(sql, (rs, rowNum) -> {
            Investment investment = new Investment();
            investment.setClientId(rs.getInt("client_client_id"));
            investment.setInvestmentType(rs.getString("investment_type"));
            investment.setInitialLumpSum(rs.getDouble("initial_investment"));
            investment.setMonthlyAmount(rs.getDouble("monthly_investment"));
            investment.setReturn1Year(rs.getDouble("return_1_year"));
            investment.setReturn5Years(rs.getDouble("return_5_years"));
            investment.setReturn10Years(rs.getDouble("return_10_years"));
            investment.setTotalProfit(rs.getDouble("total_profit"));
            investment.setTotalFee(rs.getDouble("total_fee"));
            investment.setTotalTax(rs.getDouble("total_tax"));
            return investment;
        });

        
     // Set the investment list as a request attribute
        request.setAttribute("investments", investmentList);
        
     // Query the transacion table
        String sql_ = "SELECT * FROM currency_transaction";
        List<Transaction> transactionList = jdbcTemplate.query(sql_, (rs, rowNum) -> {
            Transaction transaction = new Transaction();
            transaction.setClientId(rs.getInt("client_client_id"));
            transaction.setInitialCurrency(rs.getString("initial_currency"));
            transaction.setTargetCurrency(rs.getString("target_currency"));
            transaction.setAmount(rs.getDouble("amount"));
            transaction.setConversionRate(rs.getDouble("conversion_rate"));
            transaction.setTransactionFee(rs.getDouble("transaction_fee"));
            return transaction;
        });

     // Set the transaction list as a request attribute
        request.setAttribute("transactions", transactionList);
        
        return "staffDashboard";
    }
}
