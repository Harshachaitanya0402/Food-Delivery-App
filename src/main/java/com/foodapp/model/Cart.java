package com.foodapp.model;

import java.io.Serializable;
import java.util.*;

public class Cart implements Serializable {

    private final Map<Integer,CartItem> items=new LinkedHashMap<>();
    private Integer restaurantId;

    public Integer getRestaurantId(){
        return restaurantId;
    }

    public void setRestaurantId(Integer restaurantId){
        this.restaurantId=restaurantId;
    }

    public Map<Integer,CartItem> getItems(){
        return items;
    }

    public Collection<CartItem> getAllItems(){
        return items.values();
    }

    public void addItem(CartItem item){
        CartItem old=items.get(item.getId());
        if(old==null)items.put(item.getId(),item);
        else old.setQuantity(old.getQuantity()+item.getQuantity());
    }

    public void removeItem(int id){
        items.remove(id);
    }

    public void updateItemQuantity(int id,int quantity){
        if(quantity<=0)items.remove(id);
        else if(items.containsKey(id))items.get(id).setQuantity(quantity);
    }

    public double getTotal(){
        return items.values().stream().mapToDouble(CartItem::getTotalPrice).sum();
    }

    public int getItemCount(){
        return items.size();
    }

    public void clear(){
        items.clear();
    }
}