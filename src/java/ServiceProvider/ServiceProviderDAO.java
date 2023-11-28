/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceProvider;

import Pets.PetsDTO;
import Resources.ResourcesDTO;
import Ubtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DO ANH KHOA
 */
public class ServiceProviderDAO {

    public List<ServiceProviderDTO> getAllService() {
        List<ServiceProviderDTO> ServiceList = new ArrayList<>();
        String sql = "SELECT * FROM ServiceProvider where status = 1;";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceProviderDTO service = new ServiceProviderDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getFloat(6), rs.getString(7), rs.getBoolean(8));
                ServiceList.add(service);

            }
            return ServiceList;
        } catch (SQLException ex) {
            System.out.println("Query error: " + ex.getMessage());
        }

        return null;
    }

    public void deleteService(int serviceId) {
        String sql = "UPDATE ServiceProvider SET status = 0 WHERE provider_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, serviceId);

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Delete error: " + ex.getMessage());
        }

    }

    public void insertService(ServiceProviderDTO service) {
        String sql = "INSERT INTO ServiceProvider (provider_id, name, service_type, location, description, price_ServiceProvider, status, date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            int nextId = getNextId();
            service.setServiceID(nextId);
            ps.setInt(1, nextId);
            ps.setString(2, service.getServiceName());
            ps.setString(3, service.getServiceType());
            ps.setString(4, service.getServiceLocation());
            ps.setString(5, service.getDescription());
            ps.setFloat(6, service.getServicePrice());

            ps.setBoolean(7, true);
            ps.setString(8, service.getDate());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Insert error: " + ex.getMessage());
        }

    }

    public List<ServiceProviderDTO> GetServiceByUser(String keyword) {
        List<ServiceProviderDTO> ServiceList = new ArrayList<>();
        String sql = "SELECT * FROM ServiceProvider where status = 1 ";
        int index = 0;
        String where = "";
        String whereJoinWord = " and ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            where += whereJoinWord;
            where += " (location LIKE ? )";
        }

        try {
            sql += where;
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, keyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                ServiceProviderDTO service = new ServiceProviderDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getFloat(6), rs.getString(7), rs.getBoolean(8));
                ServiceList.add(service);
            }
        } catch (SQLException ex) {
            System.out.println("Query error: " + ex.getMessage());
        }

        return ServiceList;
    }

    public List<Integer> getPurchasedServiceIdsByUser(Long userId) {
        List<Integer> purchasedServiceIds = new ArrayList<>();
        String sql = "SELECT provider_id FROM PurchasedServices WHERE user_id = ? AND status =1";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int serviceId = rs.getInt(1);
                int serId = serviceId;
                purchasedServiceIds.add(serId);
            }
        } catch (SQLException ex) {
            System.out.println("Query error: " + ex.getMessage());
        }

        return purchasedServiceIds;
    }

    private int getNextId() throws SQLException {
        int nextId = 1;
        String sql = "SELECT MAX(provider_id) FROM ServiceProvider";

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

    public void updateService(ServiceProviderDTO serviceProvider) {
        String sql = "UPDATE ServiceProvider SET name = ?, service_type = ?, location = ?, description = ?, price_ServiceProvider = ?, date = ? WHERE  provider_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, serviceProvider.getServiceName());
            ps.setString(2, serviceProvider.getServiceType());
            ps.setString(3, serviceProvider.getServiceLocation());
            ps.setString(4, serviceProvider.getDescription());
            ps.setFloat(5, serviceProvider.getServicePrice());
            ps.setString(6, serviceProvider.getDate());
            ps.setInt(7, serviceProvider.getServiceID());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Update error: " + ex.getMessage());
        }

    }

    public ServiceProviderDTO getServiceById(int serviceId) {
        String sql = "SELECT * FROM ServiceProvider WHERE provider_id = ? AND status =1";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, serviceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ServiceProviderDTO serviceProvider = new ServiceProviderDTO(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getString("location"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getString("date"),
                        rs.getBoolean("status")
                );
                return serviceProvider;
            }
        } catch (SQLException ex) {
            System.out.println("Query error: " + ex.getMessage());
        }
        return null;
    }

}
