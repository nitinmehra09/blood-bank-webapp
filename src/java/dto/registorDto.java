package dto;
/**
 *
 * @author Nitin Mehra
 */
public class registorDto {
    
    private String username,bloodGroup,email,passcode,city;
    
    public String getFullName() {
        return username;
    }
    public void setFullName(String username) {
        this.username = username;
    }
    
    public String getBloodGroup() {
        return bloodGroup;
    }
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return passcode;
    }
    public void setPassword(String passcode) {
        this.passcode = passcode;
    }
    
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
}
