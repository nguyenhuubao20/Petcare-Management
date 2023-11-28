/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pets;

import java.sql.Date;

/**
 *
 * @author DO ANH KHOA
 */
public class PetsDTO {
    private int petId;
    private int userId;
    private String petName;
    private int petAge;
    private String allergy;
    private String profilePicture;
    private String orderDate;

    public PetsDTO() {
        // Default constructor
    }

    public PetsDTO(int petId, int userId, String petName, int petAge, String allergy, String profilePicture, String orderDate) {
        this.petId = petId;
        this.userId = userId;
        this.petName = petName;
        this.petAge = petAge;
        this.allergy = allergy;
        this.profilePicture = profilePicture;
        this.orderDate = orderDate;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public int getPetAge() {
        return petAge;
    }

    public void setPetAge(int petAge) {
        this.petAge = petAge;
    }

    public String getAllergy() {
        return allergy;
    }

    public void setAllergy(String allergy) {
        this.allergy = allergy;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    

}