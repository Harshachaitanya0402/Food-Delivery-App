CREATE DATABASE IF NOT EXISTS foodapplication CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE foodapplication;
CREATE TABLE IF NOT EXISTS `user` (
 user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, username VARCHAR(100), password VARCHAR(255), email VARCHAR(100) UNIQUE, phone VARCHAR(15), address TEXT, role VARCHAR(20) DEFAULT 'customer', created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, last_login_date TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS restaurant (
 restaurant_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), cuisine_type VARCHAR(100), delivery_time INT, address TEXT, admin_user_id INT NULL, rating DOUBLE, is_active TINYINT(1) DEFAULT 1, image_path VARCHAR(255), KEY(admin_user_id), CONSTRAINT fk_restaurant_admin FOREIGN KEY(admin_user_id) REFERENCES `user`(user_id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS menu (
 menu_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, restaurant_id INT NULL, item_name VARCHAR(100), description TEXT, price DOUBLE, is_available TINYINT(1) DEFAULT 1, image_path VARCHAR(255), KEY(restaurant_id), CONSTRAINT fk_menu_restaurant FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS orders (
 order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, user_id INT NULL, restaurant_id INT NULL, order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, total_amount DOUBLE, status VARCHAR(50), payment_mode VARCHAR(50), delivery_address TEXT, KEY(user_id), KEY(restaurant_id), CONSTRAINT fk_orders_user FOREIGN KEY(user_id) REFERENCES `user`(user_id), CONSTRAINT fk_orders_restaurant FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id)
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS order_item (
 order_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, order_id INT NULL, menu_id INT NULL, quantity INT, total_price DOUBLE, KEY(order_id), KEY(menu_id), CONSTRAINT fk_order_item_order FOREIGN KEY(order_id) REFERENCES orders(order_id), CONSTRAINT fk_order_item_menu FOREIGN KEY(menu_id) REFERENCES menu(menu_id)
) ENGINE=InnoDB;
