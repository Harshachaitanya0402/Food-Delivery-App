package com.foodapp.controller;

import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;
import com.foodapp.service.FoodService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CartController
{
    private final FoodService service;

    public CartController(FoodService service)
    {
        this.service = service;
    }

    @PostMapping("/cart/add")
    public String add(@RequestParam("menuId") int menuId,
                      @RequestParam("restaurantId") int restaurantId,
                      @RequestParam(value = "quantity", defaultValue = "1") int quantity,
                      HttpSession session, RedirectAttributes redirectAttributes)
    {
        Menu menu = service.menuItem(menuId);
        if (menu == null || !menu.isAvailable()) 
        {
            redirectAttributes.addFlashAttribute("error", "That menu item is not available.");
            return "redirect:/restaurants";
        }
        Cart cart = (Cart) session.getAttribute("cart");
        boolean switchedRestaurant = cart != null && !cart.getItems().isEmpty()
                && cart.getRestaurantId() != null && !cart.getRestaurantId().equals(restaurantId);
        if (cart == null || switchedRestaurant) 
        {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        cart.setRestaurantId(restaurantId);
        cart.addItem(new CartItem(menu.getMenuId(), menu.getItemName(), menu.getPrice(), Math.max(1, quantity)));
        session.setAttribute("restaurantId", restaurantId);
        if (switchedRestaurant) 
        {
            redirectAttributes.addFlashAttribute("success", "Your cart was switched to this restaurant. " + menu.getItemName() + " was added.");
        }
        else
        {
            redirectAttributes.addFlashAttribute("success", menu.getItemName() + " added to your cart.");
        }
        return "redirect:/cart";
    }

    @PostMapping("/cart/update")
    public String update(@RequestParam("menuId") int menuId,
                         @RequestParam("quantity") int quantity,
                         HttpSession session) 
    {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) cart.updateItemQuantity(menuId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/cart/remove")
    public String remove(@RequestParam("menuId") int menuId, HttpSession session)
    {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) cart.removeItem(menuId);
        return "redirect:/cart";
    }

    @PostMapping("/cart/clear")
    public String clear(HttpSession session) 
    {
        session.removeAttribute("cart");
        session.removeAttribute("restaurantId");
        return "redirect:/cart";
    }
}
