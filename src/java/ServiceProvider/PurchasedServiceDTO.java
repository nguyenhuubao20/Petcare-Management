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
public class PurchasedServiceDTO {

    private int userId;
    private int providerId;
    private String purchaseDate;
    private Boolean status;

    public PurchasedServiceDTO(int userId, int providerId, String purchaseDate, Boolean status) {
        this.userId = userId;
        this.providerId = providerId;
        this.purchaseDate = purchaseDate;
        this.status = status;
    }

    public PurchasedServiceDTO() {
    }

    public int getProviderId() {
        return providerId;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

  


    public void setStatus(Boolean status) {
        this.status = status;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

}
