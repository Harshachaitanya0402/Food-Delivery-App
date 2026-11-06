# FoodApp — Spring MVC + Hibernate/JPA

A Java web-based food delivery application built with Spring MVC, Hibernate ORM/JPA, JSP, JSTL, Maven, and MySQL. This refreshed package includes a responsive restaurant/menu UI, sample menus for all eight restaurants, explicit Spring request parameter names, compiler parameter metadata, and delivery-address persistence on orders.

## Requirements
- JDK 21
- Eclipse IDE with Maven support
- Apache Tomcat 10.1
- MySQL Server and MySQL Workbench

## Import into Eclipse
1. Extract this ZIP to a normal folder.
2. In Eclipse choose **File → Import → Maven → Existing Maven Projects**.
3. Browse to the extracted `FoodDelivery-SpringMVC-Hibernate` folder and select its `pom.xml`.
4. Click **Finish**, then right-click the project → **Maven → Update Project**.

## Configure MySQL
1. Open `src/main/resources/application.properties`.
2. Set `db.username` and `db.password` for your local MySQL account. Do not share a ZIP containing your real database password.
3. The default schema is `foodapplication` on `localhost:3306`.

For a brand-new database, run `database/schema.sql` first, then `database/seed-data.sql` in MySQL Workbench.

For an existing `foodapplication` database:
1. Keep your existing tables and user records. Back up the schema first.
2. Run `database/upgrade-existing-database.sql`. It adds `orders.delivery_address` only if missing.
3. Run `database/seed-data.sql` to add any missing restaurant records and populate dishes for all eight restaurants. The script checks restaurant names and per-restaurant dish names, so rerunning it does not duplicate those rows.
4. Do **not** run `schema.sql` on an existing database unless you understand the effect of its statements.

## Deploy and run
1. Use Tomcat 10.1 in Eclipse (the application uses Jakarta Servlet APIs).
2. Right-click the project → **Run As → Run on Server**.
3. Open `http://localhost:8080/FoodDelivery/restaurants` (the context path can differ based on your Eclipse deployment settings).

## Main features
- Restaurant discovery with client-side search
- Menus with item search and add-to-cart controls
- Cart quantity update, remove, and clear actions
- Registration and login using BCrypt password hashing
- Cash-on-delivery checkout
- Order and order-item persistence through Hibernate/JPA
- Delivery address stored with the order
- Responsive UI for desktop and mobile

## Notes
- This archive intentionally does not include a real MySQL password. Set it locally in `application.properties` before running.
- Existing accounts created by an older plain-text-password version may not authenticate with the BCrypt login. Register a new account for testing; do not delete existing records unless you choose to.
- The UI uses Google Fonts if internet access is available; it still falls back to system fonts offline.
