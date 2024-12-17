<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enomy Finance Landing Page</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            text-align: center;
        }

        h1 {
            margin-top: 50px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 20px;
        }

        .card-container {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        /* Card Styles */
        .card {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 10px;
            background-color: #fff;
            width: 250px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            text-align: center;
        }

        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
        }

        .card-text {
            margin: 10px 0;
            font-size: 14px;
            color: #333;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Enomy Finance</h1>
        <p>Please choose an option to proceed:</p>

        <div class="card-container">
            <!-- Client Login Card -->
            <div class="card">
                <h5 class="card-title">Login as Client</h5>
                <p class="card-text">Access currency conversion and investments as a client.</p>
                <a href="clientLogin" class="btn">Client Login</a>
            </div>

            <!-- Staff Login Card -->
            <div class="card">
                <h5 class="card-title">Login as Staff</h5>
                <p class="card-text">Manage client records and transactions as staff.</p>
                <a href="staffLogin" class="btn btn-secondary">Staff Login</a>
            </div>
        </div>
    </div>
</body>
</html>
