package com.foodapp.model;

import jakarta.persistence.*;

@Entity
@Table(name="menu")

public class Menu {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="menu_id")
    private Integer menuId;

    @Column(name="restaurant_id")
    private Integer restaurantId;

    @Column(name="item_name")
    private String itemName;

    private String description;

    private Double price;

    @Column(name="is_available")
    private boolean available;

    @Column(name="image_path")
    private String imagePath;

    public Menu(){}

    public Integer getMenuId(){
        return menuId;
    }

    public void setMenuId(Integer v){
        menuId=v;
    }

    public Integer getRestaurantId(){
        return restaurantId;
    }

    public void setRestaurantId(Integer v){
        restaurantId=v;
    }

    public String getItemName(){
        return itemName;
    }

    public void setItemName(String v){
        itemName=v;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String v){
        description=v;
    }

    public Double getPrice(){
        return price;
    }

    public void setPrice(Double v){
        price=v;
    }

    public boolean isAvailable(){
        return available;
    }

    public void setAvailable(boolean v){
        available=v;
    }

    public String getImagePath(){
        return imagePath;
    }

    public void setImagePath(String v){
        imagePath=v;
    }

}