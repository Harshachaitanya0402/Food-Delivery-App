package com.foodapp.model;

import jakarta.persistence.*;

@Entity
@Table(name="restaurant")

public class Restaurant {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="restaurant_id")
    private Integer restaurantId;

    private String name;

    @Column(name="cuisine_type")
    private String cuisineType;

    @Column(name="delivery_time")
    private Integer deliveryTime;

    private String address;

    @Column(name="admin_user_id")
    private Integer adminUserId;

    private Double rating;

    @Column(name="is_active")
    private boolean active;

    @Column(name="image_path")
    private String imageUrl;

    public Restaurant(){}

    public Integer getRestaurantId(){
        return restaurantId;
    }

    public void setRestaurantId(Integer v){
        restaurantId=v;
    }

    public String getName(){
        return name;
    }

    public void setName(String v){
        name=v;
    }

    public String getCuisineType(){
        return cuisineType;
    }

    public void setCuisineType(String v){
        cuisineType=v;
    }

    public Integer getDeliveryTime(){
        return deliveryTime;
    }

    public void setDeliveryTime(Integer v){
        deliveryTime=v;
    }

    public String getAddress(){
        return address;
    }

    public void setAddress(String v){
        address=v;
    }

    public Integer getAdminUserId(){
        return adminUserId;
    }

    public void setAdminUserId(Integer v){
        adminUserId=v;
    }

    public Double getRating(){
        return rating;
    }

    public void setRating(Double v){
        rating=v;
    }

    public boolean isActive(){
        return active;
    }

    public void setActive(boolean v){
        active=v;
    }

    public String getImageUrl(){
        return imageUrl;
    }

    public void setImageUrl(String v){
        imageUrl=v;
    }

}