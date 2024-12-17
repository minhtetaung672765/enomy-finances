
        function showExchangeDetails() {
            var fromCurrency = document.getElementById('fromCurrency').value;
            var toCurrency = document.getElementById('toCurrency').value;
            var amount = document.getElementById('amount').value;
            
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
                    <h3>Exchange Details</h3>
                    <p><strong>Converted Amount:</strong> ${data.convertedAmount} ${toCurrency}</p>
                    <p><strong>Transaction Fee:</strong> ${data.transactionFee} ${toCurrency}</p>
                `;
            });
        }
 