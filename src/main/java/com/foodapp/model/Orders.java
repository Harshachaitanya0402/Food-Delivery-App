package com.foodapp.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="orders")

public class Orders {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="order_id")
    private Integer orderId;

    @Column(name="user_id")
    private Integer userId;

    @Column(name="restaurant_id")
    private Integer restaurantId;

    @Column(name="order_date",insertable=false,updatable=false)
    private Timestamp orderDate;

    @Column(name="total_amount")
    private Double totalAmount;

    private String status;

    @Column(name="payment_mode")
    private String paymentMode;

    @Column(name="delivery_address")
    private String deliveryAddress;

    public Orders(){}

    public Integer getOrderId(){
        return orderId;
    }

    public void setOrderId(Integer v){
        orderId=v;
    }

    public Integer getUserId(){
        return userId;
    }

    public void setUserId(Integer v){
        userId=v;
    }

    public Integer getRestaurantId(){
        return restaurantId;
    }

    public void setRestaurantId(Integer v){
        restaurantId=v;
    }

    public Timestamp getOrderDate(){
        return orderDate;
    }

    public void setOrderDate(Timestamp v){
        orderDate=v;
    }

    public Double getTotalAmount(){
        return totalAmount;
    }

    public void setTotalAmount(Double v){
        totalAmount=v;
    }

    public String getStatus(){
        return status;
    }

    public void setStatus(String v){
        status=v;
    }

    public String getPaymentMode(){
        return paymentMode;
    }

    public void setPaymentMode(String v){
        paymentMode=v;
    }

    public String getDeliveryAddress(){
        return deliveryAddress;
    }

    public void setDeliveryAddress(String v){
        deliveryAddress=v;
    }

}