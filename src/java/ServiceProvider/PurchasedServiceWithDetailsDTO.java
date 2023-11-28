/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceProvider;

/**
 *
 * @author sontv
 */
public class PurchasedServiceWithDetailsDTO {
    
    private int userId;
    private int providerId;
    private String purchaseDate;
    private boolean status;
    private String username;
    private String serviceName;

    public PurchasedServiceWithDetailsDTO() {
    }

    public PurchasedServiceWithDetailsDTO(int userId, int providerId, String purchaseDate, boolean status, String username, String serviceName) {
      
        this.userId = userId;
        this.providerId = providerId;
        this.purchaseDate = purchaseDate;
        this.status = status;
        this.username = username;
        this.serviceName = serviceName;
    }

    public int getProviderId() {
        return providerId;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public boolean isStatus() {
        return status;
    }

    public String getServiceName() {
        return serviceName;
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

     
}

