# Sunrise Dental Clinic

Sunrise Dental Clinic is a Java-based web application developed to support the day-to-day appointment and patient management activities of a dental clinic. The system allows authorised clinic staff to register patients, manage appointments, search appointment records, calculate patient bills, generate reports and access appointment information through a REST API.

## Main Features

- Secure staff login and logout
- Patient registration
- Appointment registration
- View appointment records
- Search appointments by appointment number
- Appointment validation and duplicate prevention
- Billing calculation using treatment and consultation fees
- Printable patient bills/receipts
- Appointment and revenue reports
- Help interface
- Appointment REST API with JSON responses
- API Viewer for consuming appointment API data
- Automated JUnit testing
- Maven build and test automation
- GitHub Actions continuous integration

## Technologies Used

- Java
- Jakarta Servlets
- JSP
- JDBC
- MySQL
- HTML and CSS
- Maven
- JUnit
- Apache Tomcat
- Git and GitHub
- GitHub Actions

## System Structure

The application uses a structured Java web architecture consisting of model, DAO and controller components.

- **Model** – represents users, patients, dentists, treatments and appointments.
- **DAO** – handles database operations using JDBC.
- **Servlets/Controllers** – process user requests and coordinate application operations.
- **JSP** – provides the user interfaces for authorised clinic staff.
- **REST API** – provides appointment information in JSON format.

## Database Configuration

The application uses a MySQL database named `sunrise_dental_clinic`.

Database configuration supports environment variables:

- `DB_URL`
- `DB_USERNAME`
- `DB_PASSWORD`

Sensitive database credentials are not stored directly in the public repository.

## Build and Test

The project uses Maven for building and automated testing.

Run the automated tests using:

```bash
mvn test
```

Build the application using:

```bash
mvn clean package
```

The generated WAR file can then be deployed to Apache Tomcat.

## Automated Testing

JUnit tests are included to verify the billing calculation implemented in the `Appointment` model. The current automated test suite contains three billing tests and can be executed through Maven.

## Continuous Integration

GitHub Actions is configured to automatically build the Maven project and execute the automated tests when changes are pushed to the repository.

## Academic Project

This system was developed for the **CIS6003 – Advanced Programming** module. It demonstrates Java web development, object-oriented programming, database integration, REST-based distributed functionality, automated testing, version control and continuous integration.
