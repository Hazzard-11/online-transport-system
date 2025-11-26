<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
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
        
        .booking-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }
        
        .booking-item {
            background: rgba(255,255,255,0.1);
            padding: 1.5rem;
            border-radius: 8px;
            border: 1px solid rgba(255,255,255,0.2);
        }
        
        .booking-item .booking-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }
        
        @media (max-width: 768px) {
            .booking-item .booking-details {
                grid-template-columns: 1fr;
            }
        }

        .container {
            width: 100%;
            max-width: 800px;
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

        .booking-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .detail-group {
            margin-bottom: 1.5rem;
        }

        .detail-label {
            display: block;
            margin-bottom: 0.6rem;
            font-weight: 500;
            color: #fff;
        }

        .detail-value {
            width: 100%;
            padding: 1rem;
            background-color: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.3);
            border-radius: 8px;
            font-size: 1rem;
            color: white;
        }

        .status-badge {
            display: inline-block;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            background-color: rgba(251, 188, 5, 0.2);
            color: #fbbc05;
            border: 1px solid rgba(251, 188, 5, 0.3);
        }

        .actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn {
            display: block;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            flex: 1;
            text-decoration: none;
        }

        .btn-update {
            background-color: #4285f4;
            color: white;
        }

        .btn-delete {
            background-color: #ea4335;
            color: white;
        }

        .btn-new {
            background-color: #34a853;
            color: white;
        }

        .btn-back {
            background-color: #9e9e9e;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .empty-state {
            text-align: center;
            padding: 2rem;
            color: rgba(255,255,255,0.8);
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: rgba(255,255,255,0.3);
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: #fff;
        }

        .empty-state p {
            font-size: 1rem;
            margin-bottom: 1.5rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .booking-details {
                grid-template-columns: 1fr;
            }
            
            .actions {
                flex-direction: column;
            }
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
            <header>Booking Details</header>

            <c:choose>
                <c:when test="${not empty booking}">
                    <div class="booking-details">
                        <div class="detail-group">
                            <span class="detail-label">Booking ID</span>
                            <div class="detail-value">#${booking.id}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Status</span>
                            <div>
                                <span class="status-badge">
                                    <i class="fas fa-clock"></i> ${booking.status}
                                </span>
                            </div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Pickup Location</span>
                            <div class="detail-value">${booking.pickupLocation}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Destination</span>
                            <div class="detail-value">${booking.destination}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Date & Time</span>
                            <div class="detail-value">${booking.rideDate} at ${booking.rideTime}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Vehicle Type</span>
                            <div class="detail-value">${booking.vehicleType}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Passengers</span>
                            <div class="detail-value">${booking.passengers}</div>
                        </div>
                        
                        <div class="detail-group">
                            <span class="detail-label">Payment Method</span>
                            <div class="detail-value">${booking.paymentMethod}</div>
                        </div>
                    </div>
                    
                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/TravelBookingServlet/edit?id=${booking.id}" 
                           class="btn btn-update">
                            <i class="fas fa-edit"></i> Update Booking
                        </a>
                        <a href="${pageContext.request.contextPath}/TravelBookingServlet/delete?id=${booking.id}" 
                           class="btn btn-delete"
                           onclick="return confirm('Are you sure you want to cancel this booking?')">
                            <i class="fas fa-trash-alt"></i> Cancel Booking
                        </a>
                    </div>
                </c:when>
                <c:when test="${not empty listBookings}">
                    <div class="booking-list">
                        <c:forEach items="${listBookings}" var="booking">
                            <div class="booking-item">
                                <div class="booking-details">
                                    <div class="detail-group">
                                        <span class="detail-label">Booking ID</span>
                                        <div class="detail-value">#${booking.id}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Status</span>
                                        <div>
                                            <span class="status-badge">
                                                <i class="fas fa-clock"></i> ${booking.status}
                                            </span>
                                        </div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Pickup Location</span>
                                        <div class="detail-value">${booking.pickupLocation}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Destination</span>
                                        <div class="detail-value">${booking.destination}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Date & Time</span>
                                        <div class="detail-value">${booking.rideDate} at ${booking.rideTime}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Vehicle Type</span>
                                        <div class="detail-value">${booking.vehicleType}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Passengers</span>
                                        <div class="detail-value">${booking.passengers}</div>
                                    </div>
                                    
                                    <div class="detail-group">
                                        <span class="detail-label">Payment Method</span>
                                        <div class="detail-value">${booking.paymentMethod}</div>
                                    </div>
                                </div>
                                
                                <div class="actions">
                                    <a href="${pageContext.request.contextPath}/TravelBookingServlet/edit?id=${booking.id}" 
                                       class="btn btn-update">
                                        <i class="fas fa-edit"></i> Update
                                    </a>
                                    <a href="${pageContext.request.contextPath}/TravelBookingServlet/delete?id=${booking.id}" 
                                       class="btn btn-delete"
                                       onclick="return confirm('Are you sure you want to cancel this booking?')">
                                        <i class="fas fa-trash-alt"></i> Cancel
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/TravelBookingServlet/new" class="btn btn-new">
                            <i class="fas fa-plus"></i> New Booking
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-calendar-times"></i>
                        <h3>Booking Not Found</h3>
                        <p>No booking found with the provided ID.</p>
                        <div class="actions">
                            <a href="${pageContext.request.contextPath}/TravelBookingServlet/new" class="btn btn-new">
                                <i class="fas fa-plus"></i> Create New Booking
                            </a>
                            <a href="${pageContext.request.contextPath}/TravelBookingServlet" class="btn btn-back">
                                <i class="fas fa-arrow-left"></i> Back to Search
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>