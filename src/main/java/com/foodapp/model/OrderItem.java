package com.foodapp.model;

import jakarta.persistence.*;

@Entity
@Table(name="order_item")

public class OrderItem {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="order_item_id")
    private Integer orderItemId;

    @Column(name="order_id")
    private Integer orderId;

    @Column(name="menu_id")
    private Integer menuId;

    private Integer quantity;

    @Column(name="total_price")
    private Double price;

    public OrderItem(){}

    public Integer getOrderItemId(){
        return orderItemId;
    }

    public void setOrderItemId(Integer v){
        orderItemId=v;
    }

    public Integer getOrderId(){
        return orderId;
    }

    public void setOrderId(Integer v){
        orderId=v;
    }

    public Integer getMenuId(){
        return menuId;
    }

    public void setMenuId(Integer v){
        menuId=v;
    }

    public Integer getQuantity(){
        return quantity;
    }

    public void setQuantity(Integer v){
        quantity=v;
    }

    public Double getPrice(){
        return price;
    }

    public void setPrice(Double v){
        price=v;
    }

}