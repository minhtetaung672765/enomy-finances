package com.enomyfinance.models;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.Map;

public class CurrencyConversionService {
	
	private Map<String, Map<String, Double>> exchangeRates;

    // Constructor to load exchange rates from the JSON file
    public CurrencyConversionService() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
        	// Load the exchange rates from the JSON file inside resources
            exchangeRates = objectMapper.readValue(
                getClass().getClassLoader().getResourceAsStream("exchangeRates.json"),
                Map.class
            );
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
    public ConversionResult convert(String fromCurrency, String toCurrency, double amount) {
        // Dummy implementation for conversion
        double conversionRate = getConversionRate(fromCurrency, toCurrency);
        double convertedAmount = amount * conversionRate;

        double transactionFee;

        // Calculate the transaction fee based on the amount
        if (amount <= 500) {
            transactionFee = amount * 0.035; // 3.5% fee for amounts up to 500
        } else if (amount <= 1500) {
            transactionFee = amount * 0.027; // 2.7% fee for amounts over 500 and up to 1500
        } else if (amount <= 2500) {
            transactionFee = amount * 0.02;  // 2.0% fee for amounts over 1500 and up to 2500
        } else {
            transactionFee = amount * 0.015; // 1.5% fee for amounts over 2500
        }

     // Format the amount to 3 decimal places using String.format
        String formattedConvertedAmount = String.format("%.2f", convertedAmount);
        String formattedTransactionFee = String.format("%.2f", transactionFee);
        
        return new ConversionResult(
                Double.parseDouble(formattedConvertedAmount),
                Double.parseDouble(formattedTransactionFee)
            );
    }

    private double getConversionRate(String fromCurrency, String toCurrency) {
    	// Check if the rate exists in the map
        if (exchangeRates.containsKey(fromCurrency) && exchangeRates.get(fromCurrency).containsKey(toCurrency)) {
            return exchangeRates.get(fromCurrency).get(toCurrency);
        } else {
            // Default rate if currencies not found (this can be customized)
            return 1.0;
        }
    }
}
