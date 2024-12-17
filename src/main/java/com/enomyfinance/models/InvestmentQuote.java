package com.enomyfinance.models;

public class InvestmentQuote {
	
	private String investmentType;
	private double initialLumpSum;
	private double monthlyAmount;
	
    private double return1Year;
    private double return5Years;
    private double return10Years;
    private double totalProfit;
    private double totalFee;
    private double totalTax;

    public InvestmentQuote(String investmentType, double initialLumpSum, double monthlyAmount, double return1Year, double return5Years, double return10Years, double totalProfit, double totalFee, double totalTax) {
        this.investmentType = investmentType;
        this.initialLumpSum = initialLumpSum;
        this.monthlyAmount = monthlyAmount;
    	this.return1Year = return1Year;
        this.return5Years = return5Years;
        this.return10Years = return10Years;
        this.totalProfit = totalProfit;
        this.totalFee = totalFee;
        this.totalTax = totalTax;
    }

 // Getters and Setters
    
    
    
	public double getReturn1Year() {
		return return1Year;
	}

	public String getInvestmentType() {
		return investmentType;
	}

	public void setInvestmentType(String investmentType) {
		this.investmentType = investmentType;
	}

	public double getInitialLumpSum() {
		return initialLumpSum;
	}

	public void setInitialLumpSum(double initialLumpSum) {
		this.initialLumpSum = initialLumpSum;
	}

	public double getMonthlyAmount() {
		return monthlyAmount;
	}

	public void setMonthlyAmount(double monthlyAmount) {
		this.monthlyAmount = monthlyAmount;
	}

	public void setReturn1Year(double return1Year) {
		this.return1Year = return1Year;
	}

	public double getReturn5Years() {
		return return5Years;
	}

	public void setReturn5Years(double return5Years) {
		this.return5Years = return5Years;
	}

	public double getReturn10Years() {
		return return10Years;
	}

	public void setReturn10Years(double return10Years) {
		this.return10Years = return10Years;
	}

	public double getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(double totalProfit) {
		this.totalProfit = totalProfit;
	}

	public double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(double totalFee) {
		this.totalFee = totalFee;
	}

	public double getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(double totalTax) {
		this.totalTax = totalTax;
	}

    
    
    
}
