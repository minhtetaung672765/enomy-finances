package com.enomyfinance.controllers;

import com.enomyfinance.models.CurrencyTransaction;
//import com.enomyfinance.services.CurrencyTransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class CurrencyController {

    @Autowired
    private CurrencyTransactionService transactionService;


    @PostMapping("/confirmTransaction")
    public String confirmTransaction(
            @RequestParam("initialCurrency") String initialCurrency,
            @RequestParam("targetCurrency") String targetCurrency,
            @RequestParam("amount") String _amount,
            @RequestParam("conversionRate") String conversion_Rate,
            @RequestParam("transactionFee") String transaction_Fee) {

        if(_amount.isEmpty()){
        	_amount = "1";
        }
        double amount = Double.parseDouble(_amount);
        double conversionRate = Double.parseDouble(conversion_Rate);
        double transactionFee = Double.parseDouble(transaction_Fee);

        // Save the transaction using JDBC
        CurrencyTransaction transaction = new CurrencyTransaction();
        transaction.setInitialCurrency(initialCurrency);
        transaction.setTargetCurrency(targetCurrency);
        transaction.setAmount(amount);
        transaction.setConversionRate(conversionRate);
        transaction.setTransactionFee(transactionFee);
        transaction.setClientId(1); // Default client id
        boolean success = transactionService.saveTransaction(transaction);

//        Map<String, Object> response = new HashMap<>();
//        response.put("success", success);
        
        return success ? "success" : "failure";
    }
}
