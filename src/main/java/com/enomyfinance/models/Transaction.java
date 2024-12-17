package com.enomyfinance.models;

import java.sql.Timestamp;

public class Transaction {

    private String initialCurrency;
    private String targetCurrency;
    private double amount;
    private double conversionRate;
    private double transactionFee;
    private Timestamp createdAt;
    private int clientId;

    // Getters and Setters
    

    public String getInitialCurrency() { return initialCurrency; }
    public void setInitialCurrency(String initialCurrency) { this.initialCurrency = initialCurrency; }

    public String getTargetCurrency() { return targetCurrency; }
    public void setTargetCurrency(String targetCurrency) { this.targetCurrency = targetCurrency; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public double getConversionRate() { return conversionRate; }
    public void setConversionRate(double conversionRate) { this.conversionRate = conversionRate; }

    public double getTransactionFee() { return transactionFee; }
    public void setTransactionFee(double transactionFee) { this.transactionFee = transactionFee; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public int getClientId() { return clientId; }
    public void setClientId(int clientId) { this.clientId = clientId; }
}
