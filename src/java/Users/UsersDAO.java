/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import Pets.PetsDAO;
import Resources.ResourcesDAO;
import Ubtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DO ANH KHOA
 */
public class UsersDAO extends DBUtils {

    public UsersDTO login(String email, String password) {

        if ("admin".equals(email) && "admin".equals(password)) {
            UsersDTO userDTO = new UsersDTO();
            userDTO.setEmail("admin");
            userDTO.setPassword("admin");
            userDTO.setName("Admin");
            userDTO.setAddress("Admin Address");
            userDTO.setPhonenumber("Admin Phone");
            return userDTO;
        }

        String sql = "select * from Users "
                + " where email = ? and password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                UsersDTO userDTO = new UsersDTO();
                userDTO.setUser_id(rs.getLong("user_id"));
                userDTO.setEmail(rs.getString("email"));
                userDTO.setPassword(rs.getString("password"));
                userDTO.setName(rs.getString("name"));
                userDTO.setAddress(rs.getString("address"));
                userDTO.setPhonenumber(rs.getString("phonenumber"));
                return userDTO;

            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }

    public UsersDTO register(String name, String email, String password, String address, String phonenumber) {
        String sql = "INSERT INTO Users (name, email, password, created_at, address, phonenumber) "
                + "VALUES (?, ?, ?, GETDATE(), ?, ?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, address);
            ps.setString(5, phonenumber);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                UsersDTO userDTO = new UsersDTO();
                userDTO.setName(name);
                userDTO.setEmail(email);
                userDTO.setPassword(password);
                userDTO.setAddress(address);
                userDTO.setPhonenumber(phonenumber);
                return userDTO;
            }
        } catch (Exception ex) {

        }
        return null;
    }

    public boolean updateUser(UsersDTO user) {
        String sql = "UPDATE Users SET name = ?, password = ?, email = ?, address = ?, phonenumber = ? WHERE user_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPhonenumber());
            ps.setLong(6, user.getUser_id());

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println("Update User error: " + ex.getMessage());
        }

        return false;
    }

    public UsersDTO load(Long user_id) {
        String sql = "SELECT user_id, name, email, address, phonenumber from Users where user_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, user_id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new UsersDTO(
                        rs.getLong("user_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("phonenumber"));
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }

    public List<UsersDTO> getAllUsers() {
        List<UsersDTO> userList = new ArrayList<>();

        String sql = "SELECT user_id, name, email, address, phonenumber, created_at FROM Users WHERE email <> 'admin' ";

        try (Connection con = DBUtils.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Tạo một đối tượng UsersDTO từ dữ liệu trả về từ cơ sở dữ liệu
                UsersDTO user = new UsersDTO(rs.getLong("user_id"), rs.getString("name"), rs.getString("email"), rs.getString("address"), rs.getString("phonenumber"));
                userList.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return userList;
    }

    public void deleteUser(String user_id) {
        String sql = "delete from Users where user_id = ?";
        Connection conn = DBUtils.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    public static void main(String[] args) {
        // Gọi phương thức getAllUsers() để lấy danh sách người dùng
        UsersDAO dao = new UsersDAO();
        Pets.PetsDAO petDao = new PetsDAO();
        Resources.ResourcesDAO resourceDAO = new ResourcesDAO();
        petDao.deletePetByUsingUserID("2");
        resourceDAO.deleteAuthorByUsingUserID("2");
        dao.deleteUser("2");
        List<UsersDTO> userList = dao.getAllUsers();
        
        // In ra danh sách người dùng
        for (UsersDTO user : userList) {
            System.out.println("User ID: " + user.getUser_id());
            System.out.println("Name: " + user.getName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Address: " + user.getAddress());
            System.out.println("Phone number: " + user.getPhonenumber());
            System.out.println("--------------------------------");
        }
    }

}
