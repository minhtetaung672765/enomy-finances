<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Module</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
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
        .container {
            display: flex;
            justify-content: center;
            margin: 20px;
        }
        .conversion-area, .content-showing-area {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 45%;
            margin: 10px;
        }
        .conversion-area {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group select, .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-group input[type="button"] {
            background-color: navy;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .form-group input[type="button"]:hover {
            background-color: black;
        }
        .content-showing-area {
            text-align: center;
        }
        .content-showing-area ul {
            list-style: none;
        }
    </style>
    <script>
    
    
        function showExchangeDetails() {
            var fromCurrency = document.getElementById('fromCurrency').value;
            var toCurrency = document.getElementById('toCurrency').value;
            var amount = document.getElementById('amount').value;
            
            let isValid = true;
            
            if(amount < 300 || amount > 5000) {
            	isValid = false;
            	document.getElementById('amountValidation').innerText = " (Amount should be within 300 - 50000.)";
            }
            
            if (isValid) {
            // Fetch exchange details from server
            fetch('currencyConversion', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amount })
            })
            .then(response => response.json())
            .then(data => {
                var contentArea = document.getElementById('contentArea');
                contentArea.innerHTML = `
                	<div style="font-size: 20px;">
                    <h3>Exchange Details 🔄️</h3>
                    <p><strong>Converted Amount:</strong> <span id="convertedAmount">${data.convertedAmount}</span> ${toCurrency}</p>
                    <p><strong>Transaction Fee:</strong> <span id="transactionFee">${data.transactionFee}</span> ${toCurrency}</p>
                    </div>                    
                    
                    <!-- for data passing through form -->
                    <form action="confirmTransaction" method="post" id="transactionForm" onsubmit="return submitTransactionForm()">
                    <input type="hidden" name="initialCurrency" value="${fromCurrency}" />
                    <input type="hidden" name="targetCurrency" value="${toCurrency}" />
                    <input type="hidden" name="amount" value="${amount}" />
                    <input type="hidden" name="conversionRate" value="${data.convertedAmount}" />
                    <input type="hidden" name="transactionFee" value="${data.transactionFee}" />
                    <button type="submit" id="btn-submit" onclick="showTransactionSuccess()" 
                    style="
                    background-color:navy;background-color: green;
                    color: #fff;
                    border: none; padding: 10px; margin-top: 20px; border-radius: 5px;" >Confirm Transaction</button>
                	</form>

                    <p id="successMessage" style="padding-top: 50px; font-weight:bold; font-size: 18px; color:green;"></p> <!-- Success message will be displayed here -->
                `;
            });
            }
        }
        
        function showTransactionSuccess() {
            // Hide the confirm button
            document.getElementById('btn-submit').style.display = 'none';
            // Display success message
            document.getElementById('successMessage').innerText = 'Transaction confirmed successfully!';
        }

        function submitTransactionForm() {
            var formData = new FormData(document.getElementById("transactionForm"));

            fetch('/enomyfinance-webapp/confirmTransaction', {
                method: 'POST',
                body: new URLSearchParams(formData)
            })
            .then(response => response.text())
            .then(result => {
                // Show success message or handle the result
                document.getElementById('successMessage').innerText = "Transaction Successful ✅";
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
    <div class="container">
        <div class="conversion-area">
            <h2>Currency Conversion 💲</h2>
            <div class="form-group">
                <label for="fromCurrency">From Currency</label>
                <select id="fromCurrency">
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
                    <option value="GBP">GBP</option>
                    <option value="BRL">BRL</option>
                    <option value="JPY">JPY</option>
                    <option value="TRY">TRY</option>
                    <!-- Add more currencies as needed -->
                </select>
            </div>
            <div class="form-group">
                <label for="toCurrency">To Currency</label>
                <select id="toCurrency">
                    <option value="USD">USD</option>
                    <option value="EUR">EUR</option>
                    <option value="GBP">GBP</option>
                    <option value="BRL">BRL</option>
                    <option value="JPY">JPY</option>
                    <option value="TRY">TRY</option>
                    <!-- Add more currencies as needed -->
                </select>
            </div>
            <div class="form-group">
                <label for="amount">Amount <span id="amountValidation" style="color: red;"></span></label>
                <input type="number" id="amount" min="300" max="5000" step="10" value="300" >
            </div>
            <div class="form-group">
                <input type="button" value="See Exchange Details" onclick="showExchangeDetails()">
            </div>
        </div>
        <div class="content-showing-area" id="contentArea">
            <h2>Available Currencies ✅</h2>
            <ul>
                <li>USD - US Dollar</li>
                <li>EUR - Euro</li>
                <li>GBP - British Pound</li>
                <li>BRL - Brazilian Real</li>
                <li>JPY - Japanese Yen</li>
                <li>TRY - Turkish Lira</li>
            </ul>
        </div>
    </div>
</body>
</html>
