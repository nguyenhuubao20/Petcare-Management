/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.util.List;

/**
 *
 * @author ADMIN_PC
 */
public class ResourcesDTO {

    private int re_id;
    private String title;
    private String description;
    private String content;
    private String category;
    private int authorID;
    private String authorName;
    private String created_date;
    private String link_img;

    public ResourcesDTO() {
    }

    public ResourcesDTO(int re_id, String title, String description, String content, String category, int authorID, String authorName, String created_date, String link_img) {
        this.re_id = re_id;
        this.title = title;
        this.description = description;
        this.content = content;
        this.category = category;
        this.authorID = authorID;
        this.authorName = authorName;
        this.created_date = created_date;
        this.link_img = link_img;
    }

    public int getRe_id() {
        return re_id;
    }

    public void setRe_id(int re_id) {
        this.re_id = re_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getLink_img() {
        return link_img;
    }

    public void setLink_img(String link_img) {
        this.link_img = link_img;
    }

    @Override
    public String toString() {
        return "ResourcesDTO{" + "re_id=" + re_id + ", title=" + title + ", description=" + description + ", content=" + content + ", category=" + category + ", authorID=" + authorID + ", authorName=" + authorName + ", created_date=" + created_date + ", link_img=" + link_img + '}';
    }

}
