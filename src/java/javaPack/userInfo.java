package javaPack;

public class userInfo {
    private int id;
    private String name, email, password, status;
    public boolean exist = false;
	
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
    
    public String getEmail() {
	return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
	return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getStatus() {
	return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    
    @Override
	public String toString() {
            return "{"
                    + "\"id\": \"" + getId() + "\""
                    + ",\"name\": \"" + getName() + "\""
                    + ",\"email\": \"" + getEmail() + "\""
                    + ",\"password\": \"" + getPassword() + "\""
                    + ",\"status\": \"" + getStatus() + "\""
                    + "}";	
	}
}
