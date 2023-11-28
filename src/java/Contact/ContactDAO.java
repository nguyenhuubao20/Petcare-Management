/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contact;

import Contact.ContactDAO;
import Ubtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sontv
 */
public class ContactDAO {
    public List<ContactDTO> getAllContact(){
      List<ContactDTO> contactList = new ArrayList<>();
       String sql = "SELECT * FROM contact";
     try {
        Connection conn = DBUtils.getConnection(); 
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
               ContactDTO contact = new ContactDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
                contactList.add(contact);
                
        }
           return contactList;
    } catch (SQLException ex) {
        System.out.println("Query error: " + ex.getMessage());
    }
    
    return null;
}

    private int getNextId() throws SQLException {
        int nextId = 1;
        String sql = "SELECT MAX(lineadd) FROM contact";

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                int maxId = resultSet.getInt(1);
                nextId = maxId + 1;
            }
        }

        return nextId;
    }

    public void insert(ContactDTO contact) throws SQLException {
        String sql = "INSERT INTO contact (lineadd, cname, email, message) VALUES (?, ?, ?, ?)";

            Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);

            int nextId = getNextId();
            contact.setLineAdd(nextId);

            ps.setInt(1, nextId);
            ps.setString(2, contact.getContactName());
            ps.setString(3, contact.getContactMail());
            ps.setString(4, contact.getContactMessage());

            ps.executeUpdate();
          
    }

  
//
//       public void delete(ContactDTO contact) throws SQLException {
//        String sql = "DELETE FROM contact WHERE lineadd = ?";
//
//       Connection connection = DBUtils.getConnection();
//             PreparedStatement statement = connection.prepareStatement(sql); 
//
//            statement.setInt(1, contact.getLineAdd());
//
//            statement.executeUpdate();
//        
//    }



   
    public void deleteContact(Integer contactId) {
        String sql = "DELETE FROM contact WHERE lineadd  = ?";
        try {
            Connection conn = DBUtils.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, contactId);
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            System.out.println("Delete error: " + ex.getMessage());
        }
     
    }
}

