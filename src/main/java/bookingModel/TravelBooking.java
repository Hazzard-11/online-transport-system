package bookingModel;

public class TravelBooking {
    private int id;
    private String pickupLocation;
    private String destination;
    private String rideDate;
    private String rideTime;
    private String vehicleType;
    private int passengers;
    private String paymentMethod;
    private String status;

    public TravelBooking() {
        // Default constructor
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }
    
    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }
    
    public String getRideDate() { return rideDate; }
    public void setRideDate(String rideDate) { this.rideDate = rideDate; }
    
    public String getRideTime() { return rideTime; }
    public void setRideTime(String rideTime) { this.rideTime = rideTime; }
    
    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }
    
    public int getPassengers() { return passengers; }
    public void setPassengers(int passengers) { this.passengers = passengers; }
    
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}