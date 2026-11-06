# Food Delivery Application

A full-stack Java web application that allows users to explore restaurants, browse menus, manage a shopping cart, and place food orders. The application is built using **Spring MVC**, **Hibernate/JPA**, **JSP**, and **MySQL**.

> **Project type:** Java Web Application  
> **Architecture:** Spring MVC with DAO and service layers  
> **Build tool:** Maven

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Application Architecture](#application-architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Database Configuration](#database-configuration)
- [Run the Application](#run-the-application)
- [Application URL](#application-url)
- [Security Notes](#security-notes)
- [Future Enhancements](#future-enhancements)

## Overview

Food Delivery Application is designed to provide a simple online food-ordering experience. Users can register and log in, view available restaurants, explore menu items, add items to a cart, update quantities, and complete checkout using Cash on Delivery.

The application uses Spring MVC to handle web requests, Hibernate/JPA for persistence, and MySQL to store application data.

## Features

- **User registration and login** with BCrypt password hashing.
- **Restaurant browsing** to view available restaurants.
- **Menu browsing** to view dishes offered by a restaurant.
- **Menu search** to help users find items.
- **Shopping cart** to add items, update quantities, remove items, and clear the cart.
- **Checkout** with Cash on Delivery.
- **Order management** with orders and order items persisted in the database.
- **Delivery address** saved with the order.
- **Responsive interface** for desktop and mobile screens.

## Technology Stack

| Technology | Purpose |
|---|---|
| Java (JDK 21) | Core application programming language |
| Spring MVC | Web MVC framework and request handling |
| Hibernate ORM | Object-relational mapping |
| JPA | Persistence API used to interact with database entities |
| JSP | Server-side view pages |
| JSTL | JSP tag library |
| HTML, CSS, JavaScript | Front-end structure, styling, and client-side interactions |
| MySQL | Relational database |
| Maven | Dependency management and build |
| Apache Tomcat 10.1 | Servlet container |
| Eclipse IDE | Development environment |

## Application Architecture

The application follows a layered MVC architecture:

1. **View layer:** JSP pages display information and collect user input.
2. **Controller layer:** Spring MVC controllers handle HTTP requests, validate request data, manage session-related actions, and select views or redirects.
3. **Service layer:** Contains application/business logic and coordinates operations across DAOs.
4. **DAO layer:** Encapsulates database access using JPA's `EntityManager`.
5. **Entity layer:** Java entity classes represent persistent application data.
6. **Database layer:** MySQL stores users, restaurants, menu items, orders, and order items.

### Request flow

```text
Browser
   |
   v
Spring DispatcherServlet
   |
   v
Controller
   |
   v
Service Layer
   |
   v
DAO Layer (JPA EntityManager / Hibernate)
   |
   v
MySQL Database

Controller --> JSP View --> Browser
```

## Project Structure

The repository is organized as a Maven web application. The main source code is under `src/main`, and database scripts are under `database`.

```text
Food-Delivery-App/
├── database/
│   ├── schema.sql
│   ├── seed-data.sql
│   └── upgrade-existing-database.sql
├── src/
│   └── main/
│       ├── java/
│       │   └── com/foodapp/
│       │       ├── config/
│       │       ├── controller/
│       │       ├── dao/
│       │       ├── entity/
│       │       └── service/
│       ├── resources/
│       │   └── application.properties
│       └── webapp/
│           ├── WEB-INF/
│           │   └── views/
│           ├── css/
│           └── images/
├── .gitignore
├── pom.xml
└── README.md
```

*Note: The exact package and resource subfolders may vary slightly as the project evolves.*

## Prerequisites

Install the following before running the application:

- JDK 21
- Eclipse IDE with Maven and Web Tools support
- Apache Tomcat 10.1
- MySQL Server
- MySQL Workbench (recommended for running the SQL scripts)

## Setup and Installation

### 1. Clone the repository

```bash
git clone https://github.com/Harshachaitanya0402/Food-Delivery-App.git
```

### 2. Import into Eclipse

1. Open Eclipse.
2. Select **File → Import**.
3. Choose **Maven → Existing Maven Projects**.
4. Browse to the cloned `Food-Delivery-App` folder.
5. Select the project containing `pom.xml`.
6. Click **Finish**.
7. Right-click the project and select **Maven → Update Project**.

### 3. Configure MySQL

1. Start MySQL Server.
2. Open MySQL Workbench.
3. Create or prepare the database using the SQL scripts described below.
4. Open `src/main/resources/application.properties`.
5. Set the database URL, username, and password for your local MySQL installation.

The default database configuration described by the project is:

- Database: `foodapplication`
- Host: `localhost`
- Port: `3306`

Example configuration (use your own local credentials):

```properties
db.url=jdbc:mysql://localhost:3306/foodapplication
db.username=YOUR_MYSQL_USERNAME
db.password=YOUR_MYSQL_PASSWORD
```

Keep real credentials local. Do not commit passwords or access tokens to GitHub.

## Database Configuration

The `database` folder contains SQL scripts.

### For a new database

Run these scripts in MySQL Workbench in this order:

1. `database/schema.sql`
2. `database/seed-data.sql`

### For an existing database

If you already have a `foodapplication` database with data:

1. Back up your database first.
2. Run `database/upgrade-existing-database.sql`.
3. Run `database/seed-data.sql` to add missing sample restaurant and menu data.

**Important:** Do not run `schema.sql` against an existing database unless you have reviewed its statements and understand their effect. It may recreate or alter database objects.

## Run the Application

1. Make sure MySQL Server is running.
2. Confirm that `application.properties` contains the correct local database settings.
3. Configure Apache Tomcat 10.1 in Eclipse.
4. Right-click the project.
5. Select **Run As → Run on Server**.
6. Choose your Tomcat 10.1 server and finish.

Open the application in your browser using the URL below. The context path may differ depending on your Eclipse deployment configuration.

```text
http://localhost:8080/FoodDelivery/restaurants
```

## Application URL

- Local URL: `http://localhost:8080/FoodDelivery/restaurants`
- GitHub repository: https://github.com/Harshachaitanya0402/Food-Delivery-App

## Security Notes

- Never commit your real MySQL password, GitHub Personal Access Token, or other secrets.
- Use local configuration for credentials and replace example values with your own.
- Passwords for newly registered users are hashed using BCrypt.
- Accounts created by an older version that stored plain-text passwords may not work with the BCrypt login flow. Register a new test account when necessary.

## Future Enhancements

Possible improvements for future versions:

- Online payment gateway integration.
- Order tracking and order history for users.
- Admin dashboard for managing restaurants and menu items.
- REST API layer for integration with mobile or front-end applications.
- Automated tests for controllers, services, and DAO operations.

---

## Author

**Harsha Chaitanya**

- GitHub: [Harshachaitanya0402](https://github.com/Harshachaitanya0402)
- Project: [Food-Delivery-App](https://github.com/Harshachaitanya0402/Food-Delivery-App)

---

If you find this project useful, feel free to explore the repository and share feedback.

