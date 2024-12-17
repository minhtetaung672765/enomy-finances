package com.enomyfinance.controllers;

import com.enomyfinance.models.CurrencyTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;

@Service
public class CurrencyTransactionService {

	@Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean saveTransaction(CurrencyTransaction transaction) {
        String query = "INSERT INTO currency_transaction " +
                       "(initial_currency, target_currency, amount, conversion_rate, transaction_fee, created_at, client_client_id) " +
                       "VALUES (?, ?, ?, ?, ?, NOW(), ?)";

        int rowsAffected = jdbcTemplate.update(query,
            transaction.getInitialCurrency(),
            transaction.getTargetCurrency(),
            transaction.getAmount(),
            transaction.getConversionRate(),
            transaction.getTransactionFee(),
            transaction.getClientId()); // Default client id = 1

        return rowsAffected > 0;
    }
	
}
