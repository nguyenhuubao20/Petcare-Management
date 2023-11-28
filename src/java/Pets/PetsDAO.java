/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pets;

import Ubtils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DO ANH KHOA
 */
public class PetsDAO extends DBUtils {

    public List<PetsDTO> getAll(int user_id) {
        String sql = "Select * from Pets where user_id = ?";
        List<PetsDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                PetsDTO petDTO = new PetsDTO();
                petDTO.setPetId(rs.getInt("pet_id"));
                petDTO.setUserId(rs.getInt("user_id"));
                petDTO.setPetName(rs.getString("pet_name"));
                petDTO.setPetAge(rs.getInt("pet_age"));
                petDTO.setAllergy(rs.getString("allergy"));
                petDTO.setProfilePicture(rs.getString("profile_picture"));
//                java.sql.Date order_date = rs.getDate("order_date");

//                if (order_date != null) {
//                    //chuyển java.sql => java.until
//                    petDTO.setOrderDate((java.sql.Date) new Date(order_date.getTime()));
//                }
                petDTO.setOrderDate(rs.getString("order_date"));
                list.add(petDTO);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public void addPet(PetsDTO pet) {
        String sql = "INSERT INTO Pets (pet_id, user_id, pet_name, pet_age, allergy, profile_picture, order_date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, pet.getPetId());
            ps.setInt(2, pet.getUserId());
            ps.setString(3, pet.getPetName());
            ps.setInt(4, pet.getPetAge());
            ps.setString(5, pet.getAllergy());
            ps.setString(6, pet.getProfilePicture());
            ps.setString(7, pet.getOrderDate());

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(PetsDTO pet) {
        String sql = "UPDATE Pets SET user_id = ?, pet_name = ?, pet_age = ?, "
                + "allergy = ?, profile_picture = ?, order_date = ? WHERE pet_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, pet.getUserId());
            ps.setString(2, pet.getPetName());
            ps.setInt(3, pet.getPetAge());
            ps.setString(4, pet.getAllergy());
            ps.setString(5, pet.getProfilePicture());
            ps.setString(6, pet.getOrderDate());
            ps.setInt(7, pet.getPetId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public PetsDTO loadInfo(int petId) {
        PetsDTO pet = null;
        String query = "SELECT * FROM Pets WHERE pet_id = ?";
        try (Connection conn = DBUtils.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, petId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pet = new PetsDTO();
                pet.setPetId(rs.getInt("pet_id"));
                pet.setUserId(rs.getInt("user_id"));
                pet.setPetName(rs.getString("pet_name"));
                pet.setPetAge(rs.getInt("pet_age"));
                pet.setAllergy(rs.getString("allergy"));
                pet.setProfilePicture(rs.getString("profile_picture"));
                pet.setOrderDate(rs.getString("order_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pet;
    }

    public void deletePet(int petId) {
        String sql = "DELETE FROM Pets WHERE pet_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, petId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deletePetByUsingUserID(String user_id) {
        String sql = "DELETE FROM Pets WHERE user_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean exists(int user_id) {
        String sql = "SELECT pet_id FROM Pets WHERE pet_id = ?";
        ResultSet rs = null;

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, user_id);
            rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    
     public List<PetsDTO> getAllPet() {
        List<PetsDTO> petList = new ArrayList<>();

        String sql = "select * from Pets";

        try (Connection con = DBUtils.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Tạo một đối tượng UsersDTO từ dữ liệu trả về từ cơ sở dữ liệu
                PetsDTO pet = new PetsDTO(rs.getInt("pet_id"), rs.getInt("user_id"), rs.getString("pet_name"), rs.getInt("pet_age"), rs.getString("allergy"), rs.getString("profile_picture"), rs.getString("order_date"));
                petList.add(pet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return petList;
    }

    public static void main(String[] args) {
        // Create an instance of the PetsDAO class
//        PetsDAO petDAO = new PetsDAO();
//
//        // Call the getAll method to retrieve all pets from the database
//        List<PetsDTO> pets = petDAO.getAll(1);
//        System.out.println(pets);
//        // Print the details of each pet
//        for (PetsDTO pet : pets) {
//            System.out.println("Pet ID: " + pet.getPetId());
//            System.out.println("User ID: " + pet.getUserId());
//            System.out.println("Pet Name: " + pet.getPetName());
//            System.out.println("Pet Age: " + pet.getPetAge());
//            System.out.println("Allergy: " + pet.getAllergy());
//            System.out.println("Profile Picture: " + pet.getProfilePicture());
//            System.out.println("Order Date: " + pet.getOrderDate());
//            System.out.println("-------------------------");
//        }

        //Create a new PetsDTO object representing the pet to be added
//        PetsDTO pet = new PetsDTO();
//        pet.setPetId(19);
//        pet.setUserId(1);
//        pet.setPetName("Son Buoi");
//        pet.setPetAge(20);
//        pet.setAllergy("Tuy My");
//        pet.setProfilePicture("Buoi.jpg");
//        pet.setOrderDate("05/7/2003"); // Set the orderDate to the current date/time
//        
//        // Create an instance of the PetsDAO class
//        PetsDAO petDAO = new PetsDAO();
//        boolean idExists = petDAO.exists(19);
//        
//        if (idExists) {
//                        // ID đã tồn tại, hiển thị thông báo lên
//                        System.out.println("ID đã tồn tại, hiển thị thông báo lên");
//                        return;
//        }
//        // Call the addPet method to insert the pet into the database
//        petDAO.addPet(pet);
//
//        System.out.println("Pet added successfully!");
PetsDAO dao = new PetsDAO();
        List<PetsDTO> petList = dao.getAllPet();

        // In ra danh sách người dùng
        for (PetsDTO pet : petList) {
            System.out.println("User ID: " + pet.getPetId());
            System.out.println("Name: " + pet.getUserId());
            System.out.println("Email: " + pet.getPetName());
            System.out.println("Address: " + pet.getPetAge());
            System.out.println("Phone number: " + pet.getAllergy());
            System.out.println("--------------------------------");
        }


    }
        // Tạo một đối tượng PetsDTO đại diện cho con vật cần cập nhật
//        PetsDTO pet = new PetsDTO();
//        pet.setPetId(1); // ID của con vật cần cập nhật
//        pet.setUserId(1); // ID của người dùng
//        pet.setPetName("New Pet Name"); // Tên mới cho con vật
//        pet.setPetAge(3); // Tuổi mới cho con vật
//        pet.setAllergy("No allergy"); // Tình trạng dị ứng mới
//        pet.setProfilePicture("newpicture.jpg"); // Ảnh đại diện mới
//        pet.setOrderDate("2023-07-17"); // Ngày đặt hàng mới
//
//        // Tạo một đối tượng PetsDAO
//        PetsDAO petDAO = new PetsDAO();
//
//        // Gọi phương thức update để cập nhật con vật cưng
//        petDAO.update(pet);
//
//        System.out.println("Pet updated successfully!");
//    }
//     int petId = 2; // ID của con vật cần tải thông tin
//        
//        // Tạo một đối tượng PetsDAO
//        PetsDAO petDAO = new PetsDAO();
//
//        // Gọi phương thức loadInfo để tải thông tin con vật
//        PetsDTO pet = petDAO.loadInfo(petId);
//
//        if (pet != null) {
//            System.out.println("Pet ID: " + pet.getPetId());
//            System.out.println("User ID: " + pet.getUserId());
//            System.out.println("Pet Name: " + pet.getPetName());
//            System.out.println("Pet Age: " + pet.getPetAge());
//            System.out.println("Allergy: " + pet.getAllergy());
//            System.out.println("Profile Picture: " + pet.getProfilePicture());
//            System.out.println("Order Date: " + pet.getOrderDate());
//        } else {
//            System.out.println("Pet not found!");
//        }
//    }
//    PetsDAO petDAO = new PetsDAO();
//
//    // Provide a petId to delete
//    int petIdToDelete = 15;
//
//    // Call the deletePet method
//    petDAO.deletePet(petIdToDelete);
//
//    System.out.println("Pet deleted successfully!");
//        int userIdToCheck = 10; // Thay đổi giá trị user_id cần kiểm tra
//
//        PetsDAO petsDAO = new PetsDAO();
//
//        boolean userExists = petsDAO.exists(userIdToCheck);
//
//        if (userExists) {
//            System.out.println("User with user_id " + userIdToCheck + " exists in the database.");
//        } else {
//            System.out.println("User with user_id " + userIdToCheck + " does not exist in the database.");
//        }
    

}