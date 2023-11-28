 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceProvider;

import java.sql.Date;


/**
 *
 * @author DO ANH KHOA
 */
public class ServiceProviderDTO {
    private Integer serviceID;
    private String serviceName;
    private String serviceType;
    private String serviceLocation;
    private String description;
    private Float servicePrice;
    private String date;
    private Boolean status;

    public ServiceProviderDTO() {
    }

    public ServiceProviderDTO(Integer serviceID, String serviceName, String serviceType, String serviceLocation, String description, Float servicePrice, String date, Boolean status){
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.serviceType = serviceType;
        this.serviceLocation = serviceLocation;
        this.description = description;
        this.servicePrice = servicePrice;
        this.date = date;
        this.status=status;
    }

    public Integer getServiceID() {
        return serviceID;
    }

    public void setServiceID(Integer serviceID) {
        this.serviceID = serviceID;
    }

   

   

   

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getDescription() {
        return description;
    }

    public String getDate() {
        return date;
    }

   
    public String getServiceLocation() {
        return serviceLocation;
    }

    public Float getServicePrice() {
        return servicePrice;
    }

    public void setDate(String date) {
        this.date = date;
    }

  
    public void setDescription(String description) {
        this.description = description;
    }

    public void setServiceLocation(String serviceLocation) {
        this.serviceLocation = serviceLocation;
    }

    public void setServicePrice(Float servicePrice) {
        this.servicePrice = servicePrice;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getStatus() {
        return status;
    }


}

