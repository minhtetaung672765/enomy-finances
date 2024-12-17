<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.enomyfinance.models.InvestmentQuote" %> <!-- Import  model class -->
<!DOCTYPE html>
<html>
<head>
    <title>Investment Quote Result</title>
    
    <style>
    
    	.navbar {
            background-color: navy;
            padding: 20px;
            color: #fff;
            text-align: center;
            display: flex;
            justify-content: space-between;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
        }
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 0;
            margin : 0;
        }
        h2 {
            color: #333;
        }
        p {
            margin: 10px 0;
        }
        #btn-submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        #btn-submit:hover {
            background-color: #45a049;
        }
        #successMessage {
            color: green;
            margin-top: 20px;
        }
        #investmentDetails {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
        }
    </style>
    
    <script>
    
	    function investmentSuccess() {
	        var formData = new FormData(document.getElementById("confirmInvestmentForm"));
	
	        fetch('/enomyfinance-webapp/confirmInvestment', {
	            method: 'POST',
	            body: new URLSearchParams(formData)
	        })
	        .then(response => response.text())
	        .then(result => {
	            // Show success message or handle the result
	            document.getElementById('successMessage').innerText = "Investment Successful ✅";
	            document.getElementById('btn-submit').style.display = 'none';  // Hide the submit button after success
	        })
	        .catch(error => console.error('Error:', error));
	
	        // Prevent the form from submitting the normal way
	        return false;
	    }
    
    </script>
    
</head>
<body>

	<div class="navbar">
    	<div style="font-size: 18px; font-weight: bold;">Enomy Finances</div>
    	<div>
        <a href="currencyExchange">Exchange Currency</a>
        <a href="savingAndInvestment">Saving and Investment</a>
        <a >|</a>
        <a href="/enomyfinance-webapp">Logout</a>
        </div>
    </div>

<br>
    <h2 style="text-align: center;">Investment Quote</h2>
    <br>
    <div id="investmentDetails">
    <div>
    <%
        InvestmentQuote investmentQuote = (InvestmentQuote) request.getAttribute("investmentQuote");
    %>

    <p>Return after 1 year: £<%= investmentQuote.getReturn1Year() %></p>
    <p>Return after 5 years: £<%= investmentQuote.getReturn5Years() %></p>
    <p>Return after 10 years: £<%= investmentQuote.getReturn10Years() %></p>
    <p>Total Profit: £<%= investmentQuote.getTotalProfit() %></p>
    <p>Total Fees: £<%= investmentQuote.getTotalFee() %></p>
    <p>Total Taxes: £<%= investmentQuote.getTotalTax() %></p>

    <!-- Hidden form to store and submit data -->
    <form id="confirmInvestmentForm" action="<%= request.getContextPath() %>/confirmInvestment" method="post" onsubmit="return investmentSuccess()">
        <input type="hidden" name="investmentType" value="<%= investmentQuote.getInvestmentType() %>" />
        <input type="hidden" name="initialLumpSum" value="<%= investmentQuote.getInitialLumpSum() %>" />
        <input type="hidden" name="monthlyAmount" value="<%= investmentQuote.getMonthlyAmount() %>" />
        <input type="hidden" name="return1Year" value="<%= investmentQuote.getReturn1Year() %>" />
        <input type="hidden" name="return5Years" value="<%= investmentQuote.getReturn5Years() %>" />
        <input type="hidden" name="return10Years" value="<%= investmentQuote.getReturn10Years() %>" />
        <input type="hidden" name="totalProfit" value="<%= investmentQuote.getTotalProfit() %>" />
        <input type="hidden" name="totalFee" value="<%= investmentQuote.getTotalFee() %>" />
        <input type="hidden" name="totalTax" value="<%= investmentQuote.getTotalTax() %>" />
        
        <!-- Confirm transaction button -->
        <button type="submit" id="btn-submit" >Confirm Transaction</button>
    </form>
    
    <div id="successMessage"></div>
    </div>
    </div>
</body>
</html>
