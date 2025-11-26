package vehicle;

public class Vehicle {
    private int id;
    private String name;
    private String type;
    private String plateNumber;
    private int capacity;
    

    // Constructors
    public Vehicle() {}

    public Vehicle(int id, String name, String type, String plateNumber, int capacity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.plateNumber = plateNumber;
        this.capacity = capacity;
        
    }

 
    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getPlateNumber() {
        return plateNumber;
    }
    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public int getCapacity() {
        return capacity;
    }
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

}
