# 🎬 CineVault

A lightweight Java web application created as an AWS/DevOps CI/CD portfolio project.

## Architecture

Developer → GitHub → GitHub Actions → Maven Build → WAR → AWS EC2 → Apache Tomcat → CineVault

## Stack

Java 21 • Jakarta Servlet • JSP • Maven • Apache Tomcat 10 • GitHub Actions • AWS EC2

## Local deployment

```bash
mvn clean package
```

WAR output:

```text
target/cinevault.war
```

Copy the WAR to Tomcat's `webapps` directory, start Tomcat, and open:

```text
http://localhost:8080/cinevault/
```

## CI/CD

`.github/workflows/cicd.yml` builds the WAR automatically whenever code is pushed to `main`.

The next stage is secure EC2 deployment from the same workflow.

## Goal

The application is intentionally lightweight. The main goal is to demonstrate:

Git → GitHub → GitHub Actions → Maven → WAR → AWS EC2 → Tomcat
