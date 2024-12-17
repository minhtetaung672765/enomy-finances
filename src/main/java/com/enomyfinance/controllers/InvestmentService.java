package com.enomyfinance.controllers;

import com.enomyfinance.models.InvestmentQuote;
import org.springframework.stereotype.Service;

@Service
public class InvestmentService {

    public InvestmentQuote calculateInvestment(String investmentType, double initialLumpSum, double monthlyAmount) {
        double return1Year, return5Years, return10Years;
        double totalProfit, totalFee, totalTax;

        // Define variables for the returns and fees
        double yearlyReturnMin = 0, yearlyReturnMax = 0;
        double monthlyFee = 0, tax = 0; 

        // Set return rates, fees, and tax based on investment type
        switch (investmentType) {
            case "Basic Savings Plan":
                yearlyReturnMin = 1.2 / 100;
                yearlyReturnMax = 2.4 / 100;
                monthlyFee = 0.25 / 100;
                tax = 0; // Basic Savings Plan has 0% tax
                break;
            case "Savings Plan Plus":
                yearlyReturnMin = 3.0 / 100;
                yearlyReturnMax = 5.5 / 100;
                monthlyFee = 0.3 / 100;
//                tax = 10.0 / 100; // 10% on profits above £12,000
               
                break;
            case "Managed Stock Investments":
                yearlyReturnMin = 4.0 / 100;
                yearlyReturnMax = 23.0 / 100;
                monthlyFee = 1.3 / 100;
//                tax = 10.0 / 100; // 10% on profits above £12,000 and 20% above £40,000
                break;
        }
        

        // Calculate returns for different timeframes
        return1Year = calculateReturn(initialLumpSum, monthlyAmount, yearlyReturnMax, 1);
        return5Years = calculateReturn(initialLumpSum, monthlyAmount, yearlyReturnMax, 5);
        return10Years = calculateReturn(initialLumpSum, monthlyAmount, yearlyReturnMax, 10);

        // Calculate total profit, fees, and tax
        totalProfit = return10Years - (initialLumpSum + monthlyAmount * 12 * 10);
        totalFee = calculateTotalFees(monthlyAmount, monthlyFee, 10);
        
        if (totalProfit > 12000.0 && totalProfit < 40000.0) {
        	tax = 10.0 / 100; 
        }else if (totalProfit > 40000.0) {
        	tax = 20.0 / 100; 
        }
        
        totalTax = calculateTotalTaxes(totalProfit, tax);
        
        
        // formatting
        String formattedReturn1Year = String.format("%.2f", return1Year);
        String formattedReturn5Years = String.format("%.2f", return5Years);
        String formattedReturn10Years = String.format("%.2f", return10Years);
        String formattedTotalProfit = String.format("%.2f", totalProfit);
        String formattedTotalFee = String.format("%.2f", totalFee);
        String formattedTotalTax = String.format("%.2f", totalTax);

        return new InvestmentQuote(
        		investmentType,
        		initialLumpSum,
        		monthlyAmount,
        		Double.parseDouble(formattedReturn1Year),
        		Double.parseDouble(formattedReturn5Years),
        		Double.parseDouble(formattedReturn10Years),
        		Double.parseDouble(formattedTotalProfit),
        		Double.parseDouble(formattedTotalFee),
        		Double.parseDouble(formattedTotalTax)
        		);
    }

    private double calculateReturn(double initialLumpSum, double monthlyAmount, double yearlyReturnRate, int years) {
        // Basic compound interest calculation
        double totalAmount = initialLumpSum;
        for (int i = 0; i < years; i++) {
            totalAmount += (monthlyAmount * 12); // Add monthly investment
            totalAmount *= (1 + yearlyReturnRate); // Apply yearly return
        }
        return totalAmount;
    }

    private double calculateTotalFees(double monthlyAmount, double monthlyFeeRate, int years) {
        return monthlyAmount * 12 * years * monthlyFeeRate;
    }

    private double calculateTotalTaxes(double totalProfit, double taxRate) {
        return totalProfit * taxRate;
    }
}
