/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

/**
 *
 * @author DO ANH KHOA
 */
public class UsersDTO {
    private Long user_id;
    private String name;
    private String email;
    private String password;
    private String create_at;
    private String address;
    private String phonenumber;

    public UsersDTO() {
    }

    public UsersDTO(Long user_id, String name, String email, String password, String create_at, String address, String phonenumber) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.create_at = create_at;
        this.address = address;
        this.phonenumber = phonenumber;
    }

    UsersDTO(Long user_id, String name, String email,String address, String phonenumber) {
        this.user_id = user_id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phonenumber = phonenumber;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
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

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    
}