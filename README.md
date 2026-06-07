# Job Website 🧑‍💼

A full-stack job posting web application where users can post and view job listings.
Built with Java Spring Boot on the backend and JSP for the frontend.

## Tech Stack

- **Backend:** Java, Spring Boot 4.0
- **Frontend:** JSP, HTML, CSS
- **Database:** PostgreSQL
- **ORM:** Spring Data JPA / Hibernate
- **Build Tool:** Maven
- **Other:** Lombok

## Features

- View all available job postings
- Add new job postings with tech stack requirements
- Data persisted in PostgreSQL database

## Project Structure
src/
├── controller/
│   └── WebController.java       # Handles HTTP requests
├── service/
│   └── JobService.java          # Business logic
├── repo/
│   └── JobRepo.java             # Database operations
├── model/
│   └── JobPost.java             # Job entity / DB table
└── resources/
└── application.properties   # App configuration

## How to Run Locally

### Prerequisites
- Java 17+
- PostgreSQL installed
- Maven

### Steps

1. Clone the repo
   git clone https://github.com/akanshu-09/JobWebsite.git

2. Create a PostgreSQL database
   CREATE DATABASE jobwebsite;

3. Set the following environment variables
   DB_URL=jdbc:postgresql://localhost:5432/jobwebsite
   DB_USERNAME=your_postgres_username
   DB_PASSWORD=your_postgres_password

4. Run the application
   ./mvnw spring-boot:run

5. Open browser and go to
   http://localhost:8080

## Author

Akanshu
[GitHub](https://github.com/akanshu-09) | LinkedIn — https://www.linkedin.com/in/akanshu-yadav-917804314/
