<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.enomyfinance.models.Investment" %>
<%@ page import="com.enomyfinance.models.Transaction" %>

<html>
<head>
    <title>Staff Dashboard</title>
    <style>
    
    	/* Navigation Bar Styling */
		.navbar {
		    background-color: navy;
		    padding: 20px;
		    color: #fff;
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
        	margin: 20px 0 10px 0;
            text-align: center;
        }

        table {
            width: 95%;  /* Make the table take the full view width */
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

	<div class="navbar">
    	<div style="font-size: 18px; font-weight: bold;">Enomy Finances</div>
    	<div>
        <a href="/enomyfinance-webapp">Logout</a>
        </div>
    </div>

	<br><br>
    <h2> Client Investment Records</h2>
    <br>

    <table>
        <thead>
            <tr>
            	<th>Client ID</th>
                <th>Investment Type</th>
                <th>Initial Lump Sum</th>
                <th>Monthly Amount</th>
                <th>Return after 1 Year</th>
                <th>Return after 5 Years</th>
                <th>Return after 10 Years</th>
                <th>Total Profit</th>
                <th>Total Fee</th>
                <th>Total Tax</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Fetch the investment list from request attribute
                List<Investment> investments = (List<Investment>) request.getAttribute("investments");
                if (investments != null) {
                    for (Investment investment : investments) {
            %>
            <tr>
            	<td><%= investment.getClientId() %></td>
                <td><%= investment.getInvestmentType() %></td>
                <td>£<%= investment.getInitialLumpSum() %></td>
                <td>£<%= investment.getMonthlyAmount() %></td>
                <td>£<%= investment.getReturn1Year() %></td>
                <td>£<%= investment.getReturn5Years() %></td>
                <td>£<%= investment.getReturn10Years() %></td>
                <td>£<%= investment.getTotalProfit() %></td>
                <td>£<%= investment.getTotalFee() %></td>
                <td>£<%= investment.getTotalTax() %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    
    <br>
    <h2> Client Transaction Records</h2>
    <br>

    <table>
        <thead>
            <tr>
            	<th>Client ID</th>
                <th>Initial Currency</th>
                <th>Target Currency</th>
                <th>Amount</th>
                <th>Conversion Rate</th>
                <th>Transaction Fee</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                // Fetch the investment list from request attribute
                List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                if (transactions != null) {
                    for (Transaction transaction : transactions) {
            %>
            <tr>
            	<td><%= transaction.getClientId() %></td>
                <td><%= transaction.getInitialCurrency() %></td>
                <td><%= transaction.getTargetCurrency() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getConversionRate() %></td>
                <td><%= transaction.getTransactionFee() %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <br>
    <br>
    
</body>
</html>
