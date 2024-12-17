package com.enomyfinance.models;

public class ConversionResult {
    private double convertedAmount;
    private double transactionFee;

    public ConversionResult(double convertedAmount, double transactionFee) {
        this.convertedAmount = convertedAmount;
        this.transactionFee = transactionFee;
    }

    // Getters
    public double getConvertedAmount() { return convertedAmount; }
    public double getTransactionFee() { return transactionFee; }
}
