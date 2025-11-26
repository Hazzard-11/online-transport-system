<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Booking Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', 'Segoe UI', sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://images.unsplash.com/photo-1552570173-43e2d76c37f4?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            position: relative;
            z-index: 1;
            animation: fadeIn 0.8s ease-out;
        }

        .box {
            background-color: rgba(0,0,0,0.7);
            border-radius: 12px;
            backdrop-filter: blur(5px);
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.3);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, #4285f4, #34a853);
        }

        .box header {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #fff;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }

        .box header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #fbbc05;
            border-radius: 3px;
        }

        .search-form {
            margin-top: 2rem;
            margin-bottom: 1rem;
            background: rgba(255,255,255,0.1);
            padding: 1.5rem;
            border-radius: 8px;
            border: 1px solid rgba(255,255,255,0.2);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.6rem;
            font-weight: 500;
            color: #fff;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 1rem;
            background-color: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.3);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: white;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #4285f4;
            box-shadow: 0 0 0 3px rgba(66,133,244,0.2);
            outline: none;
            background-color: rgba(255,255,255,0.2);
        }

        .form-group select option {
            background-color: #fff;
            color: #000;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .btn-primary {
            background-color: #4285f4;
            color: white;
        }

        .btn-search {
            background-color: #fbbc05;
            color: #000;
        }

        .btn-primary:hover {
            background-color: #3367d6;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .btn-search:hover {
            background-color: #e9ac00;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 480px) {
            .box {
                padding: 1.8rem;
            }

            .box header {
                font-size: 1.5rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="box">
            <header>Transport Booking</header>

            <!-- Booking Form -->
            <form action="${pageContext.request.contextPath}/TravelBookingServlet/${booking != null ? 'update' : 'insert'}" method="post">
                <!-- Add hidden field for ID when editing -->
                <c:if test="${booking != null}">
                    <input type="hidden" name="id" value="${booking.id}">
                </c:if>

                <div class="form-group">
                    <label for="pickupLocation">Pick-up Location</label>
                    <input type="text" name="pickupLocation" id="pickupLocation" 
                           placeholder="Enter pick-up address" 
                           value="${booking != null ? booking.pickupLocation : ''}" required>
                </div>

                <div class="form-group">
                    <label for="destination">Drop-off Location</label>
                    <input type="text" name="destination" id="destination" 
                           placeholder="Enter destination address" 
                           value="${booking != null ? booking.destination : ''}" required>
                </div>

                <div class="form-group">
                    <label for="rideDate">Date of Ride</label>
                    <input type="date" name="rideDate" id="rideDate" 
                           value="${booking != null ? booking.rideDate : ''}" required>
                </div>

                <div class="form-group">
                    <label for="rideTime">Time of Ride</label>
                    <input type="time" name="rideTime" id="rideTime" 
                           value="${booking != null ? booking.rideTime : ''}" required>
                </div>

                <div class="form-group">
                    <label for="vehicleType">Vehicle Type</label>
                    <select name="vehicleType" id="vehicleType" required>
                        <option value="" disabled ${booking == null ? 'selected' : ''}>Select your vehicle</option>
                        <option value="car" ${booking != null && booking.vehicleType == 'car' ? 'selected' : ''}>Car (Standard 4-seater)</option>
                        <option value="motorcycle" ${booking != null && booking.vehicleType == 'motorcycle' ? 'selected' : ''}>Motorcycle</option>
                        <option value="three-wheeler" ${booking != null && booking.vehicleType == 'three-wheeler' ? 'selected' : ''}>Three Wheeler</option>
                        <option value="van" ${booking != null && booking.vehicleType == 'van' ? 'selected' : ''}>Van (7-seater)</option>
                        <option value="luxury" ${booking != null && booking.vehicleType == 'luxury' ? 'selected' : ''}>Luxury Vehicle</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="passengers">Number of Passengers</label>
                    <input type="number" name="passengers" id="passengers" min="1" max="7" 
                           value="${booking != null ? booking.passengers : '1'}" required>
                </div>

                <div class="form-group">
                    <label for="paymentMethod">Payment Method</label>
                    <select name="paymentMethod" id="paymentMethod" required>
                        <option value="" disabled ${booking == null ? 'selected' : ''}>Select payment method</option>
                        <option value="cash" ${booking != null && booking.paymentMethod == 'cash' ? 'selected' : ''}>Cash</option>
                        <option value="card" ${booking != null && booking.paymentMethod == 'card' ? 'selected' : ''}>Credit/Debit Card</option>
                        <option value="wallet" ${booking != null && booking.paymentMethod == 'wallet' ? 'selected' : ''}>Digital Wallet</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">
                    ${booking != null ? 'Update Booking' : 'Book Now'}
                </button>
            </form>
            
            <!-- Search Booking Form -->
            <form action="${pageContext.request.contextPath}/TravelBookingServlet/search" method="get" class="search-form">
                <div class="form-group" style="margin-top: 10px">
                    <label for="searchId">Already Booked? Search by inserting booking ID</label>
                    <div style="display: flex; gap: 0.5rem;">
                        <input type="text" name="id" id="searchId" placeholder="Enter booking ID" class="detail-value" style="flex: 1;">
                        <button type="submit" class="btn btn-search" style="width: auto; padding: 0 1.5rem;">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>