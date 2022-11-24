package javaPack;

public class LicensesInfo {
    private int poNumber, counter;
    private String customerName, customerNumber, siteNumber, projectName, christeningNumber, christeningDate, poDate, customerContact, address, quantity, kind, description, partNumber;
    public boolean exist = false;
	
    public int getPoNumber() {
	return poNumber;
    }
    public void setPoNumber(int poNumber) {
	this.poNumber = poNumber;
    }
    
    public int getCounter() {
	return counter;
    }
    public void setCounter(int counter) {
        this.counter = counter;
    }
    
    public String getCustomerName() {
	return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getCustomerNumber() {
	return customerNumber;
    }
    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }
    
    public String getSiteNumber() {
	return siteNumber;
    }
    public void setSiteNumber(String siteNumber) {
        this.siteNumber = siteNumber;
    }
    
    public String getProjectName() {
	return projectName;
    }
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
    
    public String getChristeningNumber() {
	return christeningNumber;
    }
    public void setChristeningNumber(String christeningNumber) {
        this.christeningNumber = christeningNumber;
    }
    
    public String getChristeningDate() {
	return christeningDate;
    }
    public void setChristeningDate(String christeningDate) {
        this.christeningDate = christeningDate;
    }
    
    public String getPoDate() {
	return poDate;
    }
    public void setPoDate(String poDate) {
        this.poDate = poDate;
    }
    
    public String getCustomerContact() {
	return customerContact;
    }
    public void setCustomerContact(String customerContact) {
        this.customerContact = customerContact;
    }
    
    public String getAddress() {
	return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getQuantity() {
	return quantity;
    }
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    public String getKind() {
	return kind;
    }
    public void setKind(String kind) {
        this.kind = kind;
    }
    
    public String getDescription() {
	return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getPartNumber() {
	return partNumber;
    }
    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }
    
    @Override
	public String toString() {
            return "{"
                    + "\"customerName\": " + getCustomerName()
                    + ",\"customerNumber\": " + getCustomerNumber()
                    + ",\"siteNumber\": " + getSiteNumber()
                    + ",\"projectName\": " + getProjectName()
                    + ",\"christeningNumber\": " + getChristeningNumber()
                    + ",\"christeningDate\": " + getChristeningDate()
                    + ",\"poNumber\": " + getPoNumber()
                    + ",\"poDate\": " + getPoDate()
                    + ",\"customerContact\": " + getCustomerContact()
                    + ",\"address\": " + getAddress()
                    + ",\"quantity\": " + getQuantity()
                    + ",\"kind\": " + getKind()
                    + ",\"description\": " + getDescription()
                    + ",\"partNumber\": " + getPartNumber()
                    + ",\"counter\": " + getCounter()
                    + "}";	
	}
}
