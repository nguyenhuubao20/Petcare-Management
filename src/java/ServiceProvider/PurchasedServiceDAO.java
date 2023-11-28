/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceProvider;

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
public class PurchasedServiceDAO {
    //admin 
      public List<PurchasedServiceDTO> getAllPurchasedService(){
     List<PurchasedServiceDTO> purchasedServiceList = new ArrayList<>();
       String sql = "SELECT * FROM PurchasedServices";
     try {
        Connection conn = DBUtils.getConnection(); 
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
                 PurchasedServiceDTO purchasedService = new PurchasedServiceDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getBoolean(4));

              
                purchasedServiceList.add(purchasedService);
                
        }
           return purchasedServiceList;
    } catch (SQLException ex) {
        System.out.println("Query error: " + ex.getMessage());
    }
    
    return null;
}
    public void purchaseService(Integer userid, Integer proid) {
        String sql = "INSERT INTO PurchasedServices ( user_id, provider_id, purchase_date, status) " 
                +"VALUES ( ?, ?, GETDATE(), ?)";
     
        try {
         Connection conn = DBUtils.getConnection(); 
        PreparedStatement ps = conn.prepareStatement(sql);
      
            ps.setLong(1, userid);
            ps.setInt(2, proid);       
            ps.setBoolean(3, true);
          

                   ps.executeUpdate();
        } catch (SQLException ex) {
           System.out.println("Query error: " + ex.getMessage());
        }
    }
      public List<PurchasedServiceDTO> getOwnedServices(Long userId) {
        List<PurchasedServiceDTO> ownedServices = new ArrayList<>();
            String sql = "SELECT * FROM PurchasedServices WHERE user_id = ? AND status =1";

        try {  Connection conn = DBUtils.getConnection(); 
        PreparedStatement ps = conn.prepareStatement(sql);
        Integer check = userId.intValue();
            ps.setInt(1, check);
             ResultSet rs = ps.executeQuery();       
            while (rs.next()) {
             
                PurchasedServiceDTO purchasedService = new PurchasedServiceDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getBoolean(4));

                ownedServices.add(purchasedService);
            }
        } catch (SQLException ex) {
             System.out.println("Query error: " + ex.getMessage());
        }

        return ownedServices;
    }
     public List<PurchasedServiceDTO> getAlreadyOwnedServices(Long userId) {
        List<PurchasedServiceDTO> ownedServices = new ArrayList<>();
            String sql = "SELECT * FROM PurchasedServices WHERE user_id = ? AND status =0";

        try {  Connection conn = DBUtils.getConnection(); 
        PreparedStatement ps = conn.prepareStatement(sql);
        Integer check = userId.intValue();
            ps.setInt(1, check);
             ResultSet rs = ps.executeQuery();       
            while (rs.next()) {
             
                PurchasedServiceDTO purchasedService = new PurchasedServiceDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getBoolean(4));

                ownedServices.add(purchasedService);
            }
        } catch (SQLException ex) {
             System.out.println("Query error: " + ex.getMessage());
        }

        return ownedServices;
    }
     public List<PurchasedServiceWithDetailsDTO> getAllPurchasedServiceWithDetails() {
    List<PurchasedServiceWithDetailsDTO> purchasedServiceList = new ArrayList<>();
    String sql = "SELECT ps.user_id, ps.provider_id, ps.purchase_date, ps.status," +
                 "u.name, sp.name  " +
                 "FROM PurchasedServices ps " +
                 "INNER JOIN Users u ON ps.user_id = u.user_id " +
                 " INNER JOIN ServiceProvider sp ON ps.provider_id = sp.provider_id;";

    try {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            PurchasedServiceWithDetailsDTO purchasedService = new PurchasedServiceWithDetailsDTO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getBoolean(4),rs.getString(5),rs.getString(6));
            

            purchasedServiceList.add(purchasedService);
        }
        return purchasedServiceList;
    } catch (SQLException ex) {
        System.out.println("Query error: " + ex.getMessage());
    }

    return null;
}
 public void deleteService(int serviceID, int userID) {
        String sql = "UPDATE PurchasedServices SET status = 0 WHERE provider_id = ? AND user_id= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, serviceID);
             ps.setInt(2, userID);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Delete error: " + ex.getMessage());
        }

    }
 
  public void deleteService( String userID) {
        String sql = "DELETE PurchasedServices  WHERE  user_id= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
             ps.setString(1, userID);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Delete error: " + ex.getMessage());
        }

    }

 }

