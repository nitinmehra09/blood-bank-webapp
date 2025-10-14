//package dto;
//
///**
// * DTO for searching donors
// */
//public class UserDTOSearch {
//
//    private String username;
//    private String bloodGroup;
//    private String city;
//    private String email;
//
//    // Constructor
//    public UserDTOSearch(String username, String bloodGroup, String city, String email) {
//        this.username = username;
//        this.bloodGroup = bloodGroup;
//        this.city = city;
//        this.email = email;
//    }
//
//    // Default constructor (optional, but good practice)
//    public UserDTOSearch() {}
//
//    // Getters and Setters
//    public String getUsername() {
//        return username;
//    }
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getBloodGroup() {
//        return bloodGroup;
//    }
//    public void setBloodGroup(String bloodGroup) {
//        this.bloodGroup = bloodGroup;
//    }
//
//    public String getCity() {
//        return city;
//    }
//    public void setCity(String city) {
//        this.city = city;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//    public void setEmail(String email) {
//        this.email = email;
//    }
//}
//
//
package dto;

/**
 * DTO for donor search results
 */
public class UserDTOSearch {
    private String donorName;
    private String bloodGroup;
    private String city;
    private String phone;

    // Constructor
    public UserDTOSearch(String donorName, String bloodGroup, String city, String phone) {
        this.donorName = donorName;
        this.bloodGroup = bloodGroup;
        this.city = city;
        this.phone = phone;
    }

    // Getters and Setters
    public String getDonorName() {
        return donorName;
    }
    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
}

