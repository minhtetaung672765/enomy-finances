
package com.enomyfinance.controllers;

import com.enomyfinance.models.CurrencyConversionService;
import com.enomyfinance.models.ConversionResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/currencyConversion")
public class CurrencyConversionController extends HttpServlet {
    private CurrencyConversionService conversionService = new CurrencyConversionService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ConversionRequest conversionRequest = objectMapper.readValue(request.getReader(), ConversionRequest.class);
        
        ConversionResult result = conversionService.convert(conversionRequest.getFromCurrency(), conversionRequest.getToCurrency(), conversionRequest.getAmount());

        response.setContentType("application/json");
        response.getWriter().write(objectMapper.writeValueAsString(result));
    }

    private static class ConversionRequest {
        private String fromCurrency;
        private String toCurrency;
        private double amount;

        // Getters and setters
        public String getFromCurrency() { return fromCurrency; }
        public void setFromCurrency(String fromCurrency) { this.fromCurrency = fromCurrency; }
        public String getToCurrency() { return toCurrency; }
        public void setToCurrency(String toCurrency) { this.toCurrency = toCurrency; }
        public double getAmount() { return amount; }
        public void setAmount(double amount) { this.amount = amount; }
    }
}
