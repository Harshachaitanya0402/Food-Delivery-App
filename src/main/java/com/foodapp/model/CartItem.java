package com.foodapp.model;

import java.io.Serializable;

public class CartItem implements Serializable {

    private int id;
    private String name;
    private double price;
    private int quantity;

    public CartItem(){}

    public CartItem(int id,String name,double price,int quantity){
        this.id=id;
        this.name=name;
        this.price=price;
        this.quantity=quantity;
    }

    public int getId(){
        return id;
    }

    public void setId(int v){
        id=v;
    }

    public String getName(){
        return name;
    }

    public void setName(String v){
        name=v;
    }

    public double getPrice(){
        return price;
    }

    public void setPrice(double v){
        price=v;
    }

    public int getQuantity(){
        return quantity;
    }

    public void setQuantity(int v){
        quantity=v;
    }

    public double getTotalPrice(){
        return price*quantity;
    }
}