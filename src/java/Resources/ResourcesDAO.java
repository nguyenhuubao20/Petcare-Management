/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.util.ArrayList;
import java.util.List;
import Ubtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN_PC
 */
public class ResourcesDAO {

    public static List<ResourcesDTO> getSources(String cate, String des) {
        List<ResourcesDTO> resourcesList = new ArrayList<>();
        String sql = "SELECT * FROM Resources";
        int index = 0;
        String where = "";
        String whereJoinWord = " WHERE ";

        if (des != null && !des.trim().isEmpty() && cate != null && !cate.trim().isEmpty()) {
            where += whereJoinWord;
            where += " (category = ? and description = ?)";
        }

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql + where);

            if (des != null && !des.trim().isEmpty() && cate != null && !cate.trim().isEmpty()) {
                ps.setString(++index, cate);
                ps.setString(++index, des);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int re_id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String content_resources = rs.getString(4);
                String category = rs.getString(5);
                int author_id = rs.getInt(6);
                String author_name = rs.getString(7);
                String created_date = rs.getString(8);
                String image_link = rs.getString(9);

                ResourcesDTO resources = new ResourcesDTO(re_id, title, description, cate, category, author_id, author_name, created_date, image_link);
                resourcesList.add(resources);
            }
            return resourcesList;

        } catch (SQLException ex) {
            System.out.println("SQL query error: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Other error: " + ex.getMessage());
        }

        return resourcesList;
    }

    public static List<ResourcesDTO> getSourcesByCategory(String cate) {
        List<ResourcesDTO> resourcesList = new ArrayList<>();
        String sql = "SELECT * FROM Resources";
        int index = 0;
        String where = "";
        String whereJoinWord = " WHERE ";

        if (cate != null && !cate.trim().isEmpty()) {
            where += whereJoinWord;
            where += " (category = ?)";
        }

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql + where);

            if (cate != null && !cate.trim().isEmpty()) {
                ps.setString(++index, cate);
            }

            ResultSet rs = ps.executeQuery();

           while (rs.next()) {
                int re_id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String content_resources = rs.getString(4);
                String category = rs.getString(5);
                int author_id = rs.getInt(6);
                String author_name = rs.getString(7);
                String created_date = rs.getString(8);
                String image_link = rs.getString(9);

                ResourcesDTO resources = new ResourcesDTO(re_id, title, description, cate, category, author_id, author_name, created_date, image_link);
                resourcesList.add(resources);
            }
            return resourcesList;

        } catch (SQLException ex) {
            System.out.println("SQL query error: " + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Other error: " + ex.getMessage());
        }

        return resourcesList;
    }

  public static List<ResourcesDTO> insertResource(String title, String description, String content_resources,
                                                String category, int author_id, String author_name,
                                                String created_date, String image_link) {
    List<ResourcesDTO> insertedResources = new ArrayList<>();

    try {
        Connection connection = DBUtils.getConnection();

        String query = "INSERT INTO Resources (title, description, content_resources, category, author_id, author_name, created_date, image_link) "
                + "VALUES (?,?,?,?,?,?,?,?)";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, title);
        statement.setString(2, description);
        statement.setString(3, content_resources);
        statement.setString(4, category);
        statement.setInt(5, author_id);
        statement.setString(6, author_name);
        statement.setString(7, created_date);
        statement.setString(8, image_link);

        statement.executeUpdate(); 

        System.out.println("Dữ liệu đã được thêm vào bảng Resources.");
        System.out.println("--------------------------------------");
        ResourcesDTO resourcesDTO = new ResourcesDTO();
        resourcesDTO.setTitle(title);
        resourcesDTO.setDescription(description);
        resourcesDTO.setCategory(content_resources);
        resourcesDTO.setCategory(category);
        resourcesDTO.setAuthorID(author_id);
        resourcesDTO.setAuthorName(author_name);
        resourcesDTO.setCreated_date(created_date);
        resourcesDTO.setLink_img(image_link);

        insertedResources.add(resourcesDTO);

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return insertedResources;
}


    public static List<ResourcesDTO> deleteResource(String category, String description) {
    List<ResourcesDTO> deletedList = new ArrayList<>();
    String deleteSQL = "DELETE FROM Resources WHERE category = ? AND description = ?";
    String selectSQL = "SELECT * FROM Resources WHERE category = ?";

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
         PreparedStatement selectStmt = conn.prepareStatement(selectSQL)) {
        deleteStmt.setString(1, category);
        deleteStmt.setString(2, description);
        selectStmt.setString(1, category);
        int rowsAffected = deleteStmt.executeUpdate();

        if (rowsAffected > 0) {
            ResultSet rs = selectStmt.executeQuery();

            while (rs.next()) {
                ResourcesDTO deletedResource = new ResourcesDTO();
                deletedResource.setTitle(rs.getString("title"));
                deletedResource.setDescription(rs.getString("description"));
                deletedResource.setContent(rs.getString("content_resources"));
                deletedResource.setCategory(rs.getString("category"));
                deletedResource.setAuthorID(rs.getInt("author_id"));
                deletedResource.setAuthorName(rs.getString("author_name"));
                deletedResource.setCreated_date(rs.getString("created_date"));
                deletedResource.setLink_img(rs.getString("image_link"));
                deletedList.add(deletedResource);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return deletedList;
}


  public List<ResourcesDTO> updateResources(String title, String description, String content,
                                          String category, String imageLink, String createdDate) {
    List<ResourcesDTO> updatedList = new ArrayList<>();
    String updateSQL = "UPDATE Resources SET title = ?, description = ?, content_resources = ?, image_link = ?, created_date = ? WHERE category = ? AND description = ?";
    String selectSQL = "SELECT * FROM Resources WHERE category = ? AND description = ?"; 

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
         PreparedStatement selectStmt = conn.prepareStatement(selectSQL)) {
        updateStmt.setString(1, title);
        updateStmt.setString(2, description);
        updateStmt.setString(3, content);
        updateStmt.setString(4, imageLink);
        updateStmt.setString(5, createdDate);
        updateStmt.setString(6, category);
        updateStmt.setString(7, description);
        int rowsAffected = updateStmt.executeUpdate();

        if (rowsAffected > 0) {
            selectStmt.setString(1, category);
            selectStmt.setString(2, description);
            ResultSet rs = selectStmt.executeQuery();

            while (rs.next()) {
                ResourcesDTO updatedResource = new ResourcesDTO();
                updatedResource.setTitle(rs.getString("title"));
                updatedResource.setDescription(rs.getString("description"));
                updatedResource.setContent(rs.getString("content_resources"));
                updatedResource.setCategory(rs.getString("category"));
                updatedResource.setAuthorID(rs.getInt("author_id"));
                updatedResource.setAuthorName(rs.getString("author_name"));
                updatedResource.setCreated_date(rs.getString("created_date"));
                updatedResource.setLink_img(rs.getString("image_link"));
                updatedList.add(updatedResource);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return updatedList;
}


    
   public List<ResourcesDTO> searchResources(String searchKeyword) {
    List<ResourcesDTO> resultList = new ArrayList<>();
    String sql = "SELECT * FROM Resources WHERE 1=1";
    List<String> params = new ArrayList<>();

    if (searchKeyword != null && !searchKeyword.isEmpty()) {
        sql += " AND (title LIKE ? OR description LIKE ? OR content_resources LIKE ? OR author_name LIKE ?)";
        params.add("%" + searchKeyword + "%");
        params.add("%" + searchKeyword + "%");
        params.add("%" + searchKeyword + "%");
        params.add("%" + searchKeyword + "%");
    }

    try (Connection conn = DBUtils.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
        for (int i = 0; i < params.size(); i++) {
            stmt.setString(i + 1, params.get(i));
        }
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
                ResourcesDTO updatedResource = new ResourcesDTO();
                updatedResource.setRe_id(rs.getInt("resource_id"));
                updatedResource.setTitle(rs.getString("title"));
                updatedResource.setDescription(rs.getString("description"));
                updatedResource.setContent(rs.getString("content_resources"));
                updatedResource.setCategory(rs.getString("category"));
                updatedResource.setAuthorID(rs.getInt("author_id"));
                updatedResource.setAuthorName(rs.getString("author_name"));
                updatedResource.setCreated_date(rs.getString("created_date"));
                updatedResource.setLink_img(rs.getString("image_link"));
                resultList.add(updatedResource);
            }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return resultList;
}

     
 public List<ResourcesDTO> searchAndFilterAuthor(String searchKeyword) {
    List<ResourcesDTO> resultList = new ArrayList<>();
    String sql = "SELECT * FROM Resources WHERE ";
    List<String> params = new ArrayList<>();

    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        sql += " TRIM(LOWER(author_name)) LIKE ?";
        searchKeyword = "%" + searchKeyword.trim().toLowerCase() + "%";
        params.add(searchKeyword);
    }

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, searchKeyword);

        ResultSet rs = stmt.executeQuery();

         while (rs.next()) {
                ResourcesDTO updatedResource = new ResourcesDTO();
                updatedResource.setRe_id(rs.getInt("resource_id"));
                updatedResource.setTitle(rs.getString("title"));
                updatedResource.setDescription(rs.getString("description"));
                updatedResource.setContent(rs.getString("content_resources"));
                updatedResource.setCategory(rs.getString("category"));
                updatedResource.setAuthorID(rs.getInt("author_id"));
                updatedResource.setAuthorName(rs.getString("author_name"));
                updatedResource.setCreated_date(rs.getString("created_date"));
                updatedResource.setLink_img(rs.getString("image_link"));
                resultList.add(updatedResource);
            }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultList;
}
 
  public List<ResourcesDTO> searchAndFilterCategory(String searchKeyword) {
    List<ResourcesDTO> resultList = new ArrayList<>();
    String sql = "SELECT * FROM Resources WHERE ";
    List<String> params = new ArrayList<>();

    if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        sql += " TRIM(LOWER(category)) LIKE ?";
        searchKeyword = "%" + searchKeyword.trim().toLowerCase() + "%";
        params.add(searchKeyword);
    }

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, searchKeyword);

        ResultSet rs = stmt.executeQuery();

         while (rs.next()) {
                ResourcesDTO updatedResource = new ResourcesDTO();
                updatedResource.setRe_id(rs.getInt("resource_id"));
                updatedResource.setTitle(rs.getString("title"));
                updatedResource.setDescription(rs.getString("description"));
                updatedResource.setContent(rs.getString("content_resources"));
                updatedResource.setCategory(rs.getString("category"));
                updatedResource.setAuthorID(rs.getInt("author_id"));
                updatedResource.setAuthorName(rs.getString("author_name"));
                updatedResource.setCreated_date(rs.getString("created_date"));
                updatedResource.setLink_img(rs.getString("image_link"));
                resultList.add(updatedResource);
            }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultList;
}
 
public List<ResourcesDTO> getAllSource() {
    List<ResourcesDTO> resourcesList = new ArrayList<>();
    String sql = "SELECT * FROM Resources"; 

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            ResourcesDTO resourceDTO = new ResourcesDTO(rs.getInt(1), rs.getString(2), rs.getString(3), 
                   rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7),
                    rs.getString(8), rs.getString(9));
           
            resourcesList.add(resourceDTO);
        }
    } catch (SQLException ex) {
        System.out.println("Error fetching resources: " + ex.getMessage());
    }

    return resourcesList;
}

public static List<ResourcesDTO> deleteAllResource(int re_id) {
    List<ResourcesDTO> deletedList = new ArrayList<>();
    String deleteSQL = "DELETE FROM Resources WHERE resource_id = ?";
    String selectSQL = "SELECT * FROM Resources"; 

    try (Connection conn = DBUtils.getConnection();
         PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
         PreparedStatement selectStmt = conn.prepareStatement(selectSQL)) {
        deleteStmt.setInt(1, re_id);
        int rowsAffected = deleteStmt.executeUpdate();
        if (rowsAffected > 0) {
            ResultSet rs = selectStmt.executeQuery();

            while (rs.next()) {
                ResourcesDTO deletedResource = new ResourcesDTO();
                deletedResource.setRe_id(rs.getInt("re_id"));
                deletedResource.setTitle(rs.getString("title"));
                deletedResource.setDescription(rs.getString("description"));
                deletedResource.setContent(rs.getString("content_resources"));
                deletedResource.setCategory(rs.getString("category"));
                deletedResource.setAuthorID(rs.getInt("author_id"));
                deletedResource.setAuthorName(rs.getString("author_name"));
                deletedResource.setCreated_date(rs.getString("created_date"));
                deletedResource.setLink_img(rs.getString("image_link"));
                deletedList.add(deletedResource);
            }
        }

    } catch (SQLException ex) {
        System.out.println("Error deleting resource: " + ex.getMessage());
    }

    return deletedList;
}


 public void deleteAuthorByUsingUserID(String author_id) {
        String sql = "delete from Resources where author_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, author_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  
        public static void main(String[] args) {
        ResourcesDAO resourcesDAO = new ResourcesDAO();

        // Test case: Search with keyword "Dog"
        String searchKeyword = "Dog";
        List<ResourcesDTO> resultList = resourcesDAO.searchAndFilterCategory(searchKeyword);

        if (!resultList.isEmpty()) {
            System.out.println("Search results for keyword: " + searchKeyword);
            for (ResourcesDTO resource : resultList) {
                System.out.println("id: " + resource.getRe_id());
                System.out.println("Description: " + resource.getDescription());
                System.out.println("Category: " + resource.getCategory());
                // Print other fields if needed
                System.out.println("------------------------");
            }
        } else {
            System.out.println("No search results found for keyword: " + searchKeyword);
        }
    }
    
    
}
