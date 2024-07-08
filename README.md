# Online Medical Shop

## Overview
This project is an online medical shop web application developed using Java, Apache Tomcat, MySQL, and MySQL Connector/J. The application allows users to browse and purchase medicines online. It includes user authentication, medicine management, and order processing functionalities.

## Technologies Used
- Java
- Apache Tomcat
- MySQL
- MySQL Connector/J
- JSP
- Servlets

## Prerequisites
- JDK 8 or higher
- Apache Tomcat 9 or higher
- MySQL Server
- Maven

## Installation

### Step 1: Clone the repository
```bash
git clone https://github.com/yourusername/online-medical-shop.git
cd online-medical-shop

Step 2: Set up the MySQL Database

    Start your MySQL server.
    Create a new database named medicalshop.
    Execute the schema.sql file located in the database directory to create the necessary tables.

sql

CREATE DATABASE medicalshop;
USE medicalshop;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medicines (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    PRIMARY KEY (id)
);

Step 3: Configure the Database Connection

    Open the db.properties file located in the src/main/resources directory.
    Update the database connection properties according to your MySQL setup.

properties

db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/medicalshop
db.username=root
db.password=yourpassword

Step 4: Build the Project

    Navigate to the project root directory.
    Use Maven to build the project.

bash

mvn clean install

Step 5: Deploy the Project to Tomcat

    Copy the generated WAR file from the target directory to the webapps directory of your Tomcat installation.
    Start the Tomcat server.

Step 6: Access the Application

Open a web browser and navigate to http://localhost:8080/online-medical-shop.
Features

    User Registration and Login
    Browse Medicines
    Admin Panel to Add/Edit/Delete Medicines
    Place Orders

Directory Structure

css

online-medical-shop/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com/
│   │   │   │   └── medicalshop/
│   │   │   │       ├── controller/
│   │   │   │       │   ├── AdminServlet.java
│   │   │   │       │   ├── UserServlet.java
│   │   │   │       ├── dao/
│   │   │   │       │   ├── MedicineDao.java
│   │   │   │       │   ├── UserDao.java
│   │   │   │       ├── model/
│   │   │   │       │   ├── Medicine.java
│   │   │   │       │   ├── User.java
│   │   │   │       ├── util/
│   │   │   │       │   └── DBUtil.java
│   │   │   ├── webapp/
│   │   │       ├── WEB-INF/
│   │   │       │   ├── web.xml
│   │   │       ├── index.jsp
│   │   │       ├── login.jsp
│   │   │       ├── register.jsp
│   │   │       ├── admin.jsp
│   │   │       ├── user.jsp
│   ├── resources/
│       └── db.properties
├── database/
│   └── schema.sql
├── pom.xml
├── README.md

Contributing

Contributions are welcome! Please fork the repository and submit a pull request.
License

This project is licensed under the MIT License. See the LICENSE file for more details.
Acknowledgements

    Apache Tomcat
    MySQL
    Maven
    JSP and Servlets

css


This `README.md` provides a comprehensive guide for setting up and running the online medical shop application. Adjust the details as needed to match your specific implementation and repository.

