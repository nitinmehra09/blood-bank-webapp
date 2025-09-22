package dto;
/**
 *
 * @author Nitin Mehra
 */
public class UserDTOSearch {
    private String name;
    private String bloodGroup;
    private String location;
    private String contact;

    // Constructor
    public UserDTOSearch(String name, String bloodGroup, String location, String contact) {
        this.name = name;
        this.bloodGroup = bloodGroup;
        this.location = location;
        this.contact = contact;
    }

    // Getters
    public String getName() { 
        return name; 
    }

    public String getBloodGroup() { 
        return bloodGroup; 
    }

    public String getLocation() { 
        return location; 
    }

    public String getContact() { 
        return contact; 
    }
}


