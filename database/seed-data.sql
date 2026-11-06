-- FoodApp sample data (safe to run more than once).
-- Uses restaurant names rather than generated IDs, so existing IDs are preserved.
USE foodapplication;

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'The Spice Hub','Indian',30,'123 Main Street, City',4.5,1,'images/spicehub.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='The Spice Hub');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Sushi World','Japanese',45,'456 Elm Street, City',4.7,1,'images/sushiworld.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Sushi World');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Pizza Palace','Italian',25,'789 Oak Avenue, City',4.2,1,'images/pizzapalace.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Pizza Palace');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Burger Barn','Fast Food',20,'321 Pine Road, City',4.0,1,'images/burgerbarn.png'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Burger Barn');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Green Delight','Vegan',35,'654 Maple Lane, City',4.8,1,'images/greendelight.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Green Delight');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Biryani House','Indian',30,'MG Road, Bangalore',4.6,1,'images/biryanihouse.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Biryani House');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Tandoori Treats','North Indian',40,'Indiranagar, Bangalore',4.4,1,'images/tandoori.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Tandoori Treats');

INSERT INTO restaurant (name,cuisine_type,delivery_time,address,rating,is_active,image_path)
SELECT 'Dragon Wok','Chinese',35,'Whitefield, Bangalore',4.5,1,'images/dragonwok.jpg'
WHERE NOT EXISTS (SELECT 1 FROM restaurant WHERE name='Dragon Wok');

-- Add menu dishes for every restaurant. Existing dishes are not duplicated by name.

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Butter Chicken','Slow-cooked chicken in a creamy tomato gravy',250,1,'images/butterchicken.jpg' FROM restaurant r
WHERE r.name='The Spice Hub' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Butter Chicken');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Paneer Tikka','Char-grilled paneer with a smoky spice marinade',180,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='The Spice Hub' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Paneer Tikka');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chicken Biryani','Fragrant basmati rice layered with spiced chicken',220,1,'images/biryani.jpg' FROM restaurant r
WHERE r.name='The Spice Hub' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chicken Biryani');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Dal Makhani','Black lentils simmered overnight with butter and cream',190,1,'images/tandoori.jpg' FROM restaurant r
WHERE r.name='The Spice Hub' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Dal Makhani');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Garlic Naan','Soft tandoor-baked bread with garlic butter',55,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='The Spice Hub' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Garlic Naan');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Sushi Roll','Freshly prepared sushi rolls with classic accompaniments',300,1,'images/sushi.jpg' FROM restaurant r
WHERE r.name='Sushi World' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Sushi Roll');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Ramen','Japanese noodle soup with rich savoury broth',240,1,'images/ramen.jpg' FROM restaurant r
WHERE r.name='Sushi World' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Ramen');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Crispy Veg Tempura','Lightly battered seasonal vegetables',210,1,'images/sushi.jpg' FROM restaurant r
WHERE r.name='Sushi World' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Crispy Veg Tempura');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Teriyaki Rice Bowl','Steamed rice with teriyaki glaze and vegetables',230,1,'images/ramen.jpg' FROM restaurant r
WHERE r.name='Sushi World' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Teriyaki Rice Bowl');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Miso Soup','Comforting Japanese soup with tofu and spring onion',120,1,'images/sushi.jpg' FROM restaurant r
WHERE r.name='Sushi World' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Miso Soup');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Margherita Pizza','Classic pizza with tomato, mozzarella and basil',229,1,'images/pizzapalace.jpg' FROM restaurant r
WHERE r.name='Pizza Palace' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Margherita Pizza');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Farmhouse Pizza','Bell peppers, onion, mushrooms and olives',319,1,'images/salad.jpg' FROM restaurant r
WHERE r.name='Pizza Palace' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Farmhouse Pizza');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Pepperoni Pizza','Cheesy pizza topped with pepperoni-style slices',349,1,'images/pizzapalace.jpg' FROM restaurant r
WHERE r.name='Pizza Palace' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Pepperoni Pizza');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Garlic Bread','Toasted bread with garlic butter and herbs',129,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='Pizza Palace' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Garlic Bread');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Pasta Alfredo','Creamy white sauce pasta with herbs',249,1,'images/pizzapalace.jpg' FROM restaurant r
WHERE r.name='Pizza Palace' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Pasta Alfredo');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Classic Cheeseburger','Juicy burger with cheese, lettuce and house sauce',199,1,'images/burgerbarn.png' FROM restaurant r
WHERE r.name='Burger Barn' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Classic Cheeseburger');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Crispy Chicken Burger','Crispy chicken, crunchy lettuce and creamy mayo',229,1,'images/burgerbarn.png' FROM restaurant r
WHERE r.name='Burger Barn' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Crispy Chicken Burger');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Loaded Fries','Golden fries topped with cheese and seasoning',149,1,'images/pizzapalace.jpg' FROM restaurant r
WHERE r.name='Burger Barn' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Loaded Fries');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Veggie Burger','Grilled vegetable patty with fresh toppings',169,1,'images/greendelight.jpg' FROM restaurant r
WHERE r.name='Burger Barn' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Veggie Burger');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chocolate Shake','Thick chocolate milkshake served chilled',119,1,'images/smoothie.jpg' FROM restaurant r
WHERE r.name='Burger Barn' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chocolate Shake');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Vegan Salad','Fresh greens, cucumber, tomato and house dressing',160,1,'images/salad.jpg' FROM restaurant r
WHERE r.name='Green Delight' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Vegan Salad');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Smoothie Bowl','Blended fruit bowl with seeds and fresh toppings',140,1,'images/smoothie.jpg' FROM restaurant r
WHERE r.name='Green Delight' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Smoothie Bowl');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Avocado Toast','Toasted sourdough with smashed avocado',190,1,'images/salad.jpg' FROM restaurant r
WHERE r.name='Green Delight' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Avocado Toast');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Roasted Veggie Wrap','Seasonal roasted vegetables in a soft wrap',175,1,'images/greendelight.jpg' FROM restaurant r
WHERE r.name='Green Delight' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Roasted Veggie Wrap');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Quinoa Power Bowl','Quinoa, chickpeas, greens and lemon dressing',210,1,'images/salad.jpg' FROM restaurant r
WHERE r.name='Green Delight' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Quinoa Power Bowl');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Hyderabadi Chicken Biryani','Dum-cooked basmati rice with aromatic spices',260,1,'images/biryanihouse.jpg' FROM restaurant r
WHERE r.name='Biryani House' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Hyderabadi Chicken Biryani');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Paneer Biryani','Fragrant rice with paneer and warming spices',220,1,'images/biryani.jpg' FROM restaurant r
WHERE r.name='Biryani House' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Paneer Biryani');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Mutton Biryani','Rich dum biryani with tender mutton pieces',320,1,'images/biryanihouse.jpg' FROM restaurant r
WHERE r.name='Biryani House' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Mutton Biryani');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chicken 65','Crispy, spicy chicken bites with curry leaves',210,1,'images/butterchicken.jpg' FROM restaurant r
WHERE r.name='Biryani House' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chicken 65');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Double Ka Meetha','Traditional bread pudding with cardamom',110,1,'images/smoothie.jpg' FROM restaurant r
WHERE r.name='Biryani House' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Double Ka Meetha');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Tandoori Chicken','Yoghurt-marinated chicken roasted with spices',290,1,'images/tandoori.jpg' FROM restaurant r
WHERE r.name='Tandoori Treats' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Tandoori Chicken');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Paneer Tikka','Tandoor-grilled paneer with peppers and onions',210,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='Tandoori Treats' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Paneer Tikka');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chicken Seekh Kebab','Juicy minced chicken kebabs with herbs',240,1,'images/tandoori.jpg' FROM restaurant r
WHERE r.name='Tandoori Treats' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chicken Seekh Kebab');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Butter Naan','Soft, fluffy naan brushed with butter',50,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='Tandoori Treats' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Butter Naan');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Dal Tadka','Yellow lentils tempered with garlic and spices',160,1,'images/butterchicken.jpg' FROM restaurant r
WHERE r.name='Tandoori Treats' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Dal Tadka');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Veg Hakka Noodles','Wok-tossed noodles with crisp vegetables',180,1,'images/dragonwok.jpg' FROM restaurant r
WHERE r.name='Dragon Wok' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Veg Hakka Noodles');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chicken Fried Rice','Wok-fried rice with chicken and spring onions',220,1,'images/ramen.jpg' FROM restaurant r
WHERE r.name='Dragon Wok' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chicken Fried Rice');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Chilli Paneer','Paneer tossed in a tangy Indo-Chinese sauce',210,1,'images/paneertikka.jpg' FROM restaurant r
WHERE r.name='Dragon Wok' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Chilli Paneer');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Schezwan Noodles','Spicy noodles tossed in house Schezwan sauce',195,1,'images/dragonwok.jpg' FROM restaurant r
WHERE r.name='Dragon Wok' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Schezwan Noodles');

INSERT INTO menu (restaurant_id,item_name,description,price,is_available,image_path)
SELECT r.restaurant_id,'Hot and Sour Soup','Bold, warming soup with vegetables and pepper',120,1,'images/ramen.jpg' FROM restaurant r
WHERE r.name='Dragon Wok' AND NOT EXISTS (SELECT 1 FROM menu m WHERE m.restaurant_id=r.restaurant_id AND m.item_name='Hot and Sour Soup');
