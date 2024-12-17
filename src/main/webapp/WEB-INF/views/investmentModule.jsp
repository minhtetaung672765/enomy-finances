<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Investment Module</title>
    <!--  <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />"> --><!-- Optional CSS -->
    <!--  <script src="<c:url value='/resources/js/investment.js' />"></script>--> <!-- JavaScript for validation -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
</head>

	<style>
	
		/* General Body Styling */
		body {
		    font-family: Arial, sans-serif;
		    background-color: #f4f4f4;
		    margin: 0;
		    padding: 0;
		}
		
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
		
		/* Container Styling */
		.container {
		    margin: 20px;
		}
		
		/* Investment Options (Cards) */
		.investment-options {
		    display: flex;
		    justify-content: space-around;
		    margin-bottom: 20px;
		}
		
		.card {
			
		    background-color: white;
		    border: 1px solid #ccc;
		    border-radius: 8px;
		    width: 30%;
		    padding: 20px;
		    margin: 5px;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		.card:hover {
		    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
		}
		
		.card h3 {
		    color: #333;
		    margin-bottom: 10px;
		}
		
		.card p {
		    color: #666;
		    margin: 8px 0;
		}
		
		/* Investment Form Styling */
		#investment-form-container {
		    background-color: rgba(178, 184, 247, 0.3);
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
		    
		}
		
		label {
		    display: block;
		    margin: 10px 0 5px;
		    color: #333;
		}
		
		input[type="number"] {
		    width: 100%;
		    padding: 10px;
		    margin: 10px 0;
		    box-sizing: border-box;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}
		
		button {
		    background-color: #4CAF50;
		    color: white;
		    padding: 10px 20px;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    margin-top: 10px;
		}
		
		button:hover {
		    background-color: #45a049;
		}
		
		/* Validation Message Styling */
		#validationMessage {
		    font-size: 14px;
		    color: red;
		    margin-bottom: 10px;
		}
		
		/* Investment Quote Section */
		#investment-quote-container {
		    margin: 0 0 0 150px;
		    
		    background-color: #f9f9f9;
		    padding: 15px;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    width: 40vw;
		}
		
		#investmentQuote p {
		    color: #333;
		    margin: 5px 0;
		}
			
	</style>
	
	<script type="text/javascript">
	
		function showInvestmentForm(option) {
		    document.getElementById('investment-form-container').style.display = 'block';
		    
		    var investmentType = "";
		    
		    switch (option) {
	        	case 1: investmentType = "Basic Savings Plan";
	        	break;
	        	case 2: investmentType = "Savings Plan Plus";
	        	break;
	        	case 3: investmentType = "Managed Stock Investments";
	        	break;
		    }
		    document.getElementById('investmentType').value = investmentType;
	
		    // Reset form and validation message
		    
		    document.getElementById('validationMessage').innerText = '';
		    // document.getElementById('investment-quote-container').style.display = 'none';
		}
	
		function submitInvestmentDetails() {
		    const investmentType = document.getElementById('investmentType').value;
		    const initialLumpSum = parseFloat(document.getElementById('initialLumpSum').value);
		    const monthlyAmount = parseFloat(document.getElementById('monthlyAmount').value);
		    let valid = true;

		    // Clear any previous validation message
		    document.getElementById('validationMessage').innerText = "";

		    // Validation based on the investment type
		    switch (investmentType) {
		        case 'Basic Savings Plan':
		            if (monthlyAmount < 50) {
		                document.getElementById('validationMessage').innerText = "Minimum monthly investment for Basic Savings Plan is £50.";
		                valid = false;
		            }
		            break;
		        case 'Savings Plan Plus':
		            if (initialLumpSum < 300 || monthlyAmount < 50) {
		                document.getElementById('validationMessage').innerText = "Minimum lump sum for Savings Plan Plus is £300 and monthly £50.";
		                valid = false;
		            }
		            break;
		        case 'Managed Stock Investments':
		            if (initialLumpSum < 1000 || monthlyAmount < 150) {
		                document.getElementById('validationMessage').innerText = "Minimum lump sum for Managed Stock Investments is £1000 and monthly £150.";
		                valid = false;
		            }
		            break;
		    }

		    if (valid) {
		        // Proceed with form submission
		        document.getElementById("investmentForm").submit();
		    }
		}

	

	
	</script>

<body>

    <!-- Navigation Bar -->
    <div class="navbar">
    	<div style="font-size: 18px; font-weight: bold;">Enomy Finances</div>
    	<div>
        <a href="currencyExchange">Exchange Currency</a>
        <a href="savingAndInvestment">Saving and Investment</a>
        <a >|</a>
        <a href="/enomyfinance-webapp">Logout</a>
        </div>
    </div>

    <!-- Investment Options Section -->
    <div class="container">
    	<br>
        <h2>Select an Investment Plan</h2><br>
        <div class="investment-options">
            <!-- Option 1: Basic Savings Plan -->
            <div class="card" onclick="showInvestmentForm(1)">
            	<div>
                <h3>Basic Savings Plan</h3>
                <p>Max: £20,000/year</p>
                <p>Min: £50/month</p>
                <p>Returns: 1.2% - 2.4%</p>
                </div>
            </div>

            <!-- Option 2: Savings Plan Plus -->
            <div class="card" onclick="showInvestmentForm(2)">
                <div>
                <h3>Savings Plan Plus</h3>
                <p>Max: £30,000/year</p>
                <p>Min: £50/monthly | Initial lump sum: £300</p>
                <p>Returns: 3% - 5.5%</p>
                </div>
            </div>

            <!-- Option 3: Managed Stock Investments -->
            <div class="card" onclick="showInvestmentForm(3)">
                <div>
                <h3>Managed Stock Investments</h3>
                <p>No limit</p>
                <p>Min: £150/monthly | Initial lump sum: £1000</p>
                <p>Returns: 4% - 23%</p>
                </div>
            </div>
        </div>

        <!-- Investment Form Section -->
        <div id="investment-form-container" style="display:none;">
            <div>
            <h3>Enter Your Investment Details</h3>
            <form id="investmentForm" method="POST" action="<%= request.getContextPath() %>/calculateInvestmentQuote">
			    <!-- Hidden Field for Investment Type -->
			    <input type="hidden" id="investmentType" name="investmentType" value="Basic Savings Plan"/>
			
			    <!-- Initial Lump Sum -->
			    <label for="initialLumpSum">Initial Lump Sum:</label>
			    <input type="number" id="initialLumpSum" name="initialLumpSum" value="50" required><br>
			
			    <!-- Monthly Investment -->
			    <label for="monthlyAmount">Monthly Amount:</label>
			    <input type="number" id="monthlyAmount" name="monthlyAmount" value="50" required><br>
			
			    <!-- Validation message -->
			    <div id="validationMessage" style="color:red;"></div>
			
			    <!-- Submit Button to Calculate Quote -->
			    <button type="button" onclick="submitInvestmentDetails()">See Investment Details</button>
			</form>

            </div>

            
        </div>
    </div>

</body>
</html>
