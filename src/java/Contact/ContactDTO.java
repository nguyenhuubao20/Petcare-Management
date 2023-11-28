/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contact;

/**
 *
 * @author sontv
 */
public class ContactDTO {
     private Integer lineAdd;
   private String contactName;
    private String contactMail;
   private String contactMessage;
  

    public ContactDTO() {
    }

    public ContactDTO(Integer lineAdd, String contactName, String contactMail, String contactMessage) {
        this.lineAdd = lineAdd;
        this.contactName = contactName;
        this.contactMail = contactMail;
        this.contactMessage = contactMessage;
    }

   
    public void setLineAdd(Integer lineAdd) {
        this.lineAdd = lineAdd;
    }

    public Integer getLineAdd() {
        return lineAdd;
    }

  
    public String getContactName() {
        return contactName;
    }

    public String getContactMessage() {
        return contactMessage;
    }

    public String getContactMail() {
        return contactMail;
    }

    public void setContactMail(String contactMail) {
        this.contactMail = contactMail;
    }

    public void setContactMessage(String contactMessage) {
        this.contactMessage = contactMessage;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }
   
    
}
