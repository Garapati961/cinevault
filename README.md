# 🎬 CineVault

<p align="center">

## Java Application • AWS EC2 • Apache Tomcat • GitHub Actions CI/CD

A Java web application deployed through a multi-environment CI/CD pipeline:

**DEV → TEST → PRE-PROD → PRODUCTION**

</p>

---

## 🚀 Project Overview

CineVault is a Java web application created to demonstrate a practical
multi-environment CI/CD deployment workflow using AWS EC2, Apache Tomcat,
Maven, GitHub and GitHub Actions.

The application is packaged as a WAR file and automatically promoted through
four separate environments.

```text
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ├── Checkout
    ├── Java 21
    ├── Maven Build
    ├── Tests
    └── WAR Package
            │
            ▼
       cinevault.war
            │
            ▼
          DEV
            │
            ▼
          TEST
            │
            ▼
        PRE-PROD
            │
            ▼
       PRODUCTION
🏗️ Architecture
                         ┌──────────────────────┐
                         │      DEVELOPER       │
                         │                      │
                         │      Java / Git      │
                         └──────────┬───────────┘
                                    │
                                 git push
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       GITHUB         │
                         │     Repository       │
                         └──────────┬───────────┘
                                    │
                                    ▼
                    ┌──────────────────────────────┐
                    │       GITHUB ACTIONS         │
                    │                              │
                    │  Checkout                    │
                    │  Java 21                     │
                    │  Maven Build                 │
                    │  Tests                       │
                    │  WAR Packaging               │
                    └──────────────┬───────────────┘
                                   │
                              cinevault.war
                                   │
              ┌────────────────────┼────────────────────┐
              │                    │                    │
              ▼                    ▼                    ▼
       ┌─────────────┐      ┌─────────────┐      ┌─────────────┐
       │     DEV     │      │    TEST     │      │  PRE-PROD   │
       │   AWS EC2   │      │   AWS EC2   │      │   AWS EC2   │
       │  Tomcat 10  │      │  Tomcat 10  │      │  Tomcat 10  │
       └──────┬──────┘      └──────┬──────┘      └──────┬──────┘
              │                    │                    │
              └────────────────────┴────────────────────┘
                                   │
                              Promotion
                                   │
                                   ▼
                         ┌─────────────────┐
                         │   PRODUCTION    │
                         │     AWS EC2     │
                         │    Tomcat 10    │
                         └─────────────────┘
☁️ AWS Infrastructure

The project uses four EC2 instances.

Environment	Private IP	Public IP	Instance Type	Application Server
DEV	172.31.8.25	100.48.222.71	t3.micro	Tomcat 10
TEST	172.31.13.102	44.203.24.28	t3.micro	Tomcat 10
PRE-PROD	172.31.14.57	100.31.199.43	t3.micro	Tomcat 10
PRODUCTION	172.31.9.44	100.54.24.160	t3.micro	Tomcat 10

All environments run:

Amazon Linux
Java 21
Apache Tomcat 10
🔄 CI/CD Pipeline

The complete deployment process is:

                    git push
                       │
                       ▼
                ┌─────────────┐
                │    BUILD    │
                │ Java 21     │
                │ Maven       │
                │ Tests       │
                └──────┬──────┘
                       │
                       ▼
                 cinevault.war
                       │
                       ▼
                    DEV EC2
                       │
                       ▼
                   TEST EC2
                       │
                       ▼
                 PRE-PROD EC2
                       │
                       ▼
                  PROD EC2
                       │
                       ▼
                  Health Check
                       │
                       ▼
                    SUCCESS

The application is built once.

The same WAR artifact is promoted through all four environments.

              ONE BUILD
                  │
                  ▼
           cinevault.war
                  │
        ┌─────────┼─────────┐
        ▼         ▼         ▼
       DEV       TEST     PRE-PROD
                             │
                             ▼
                            PROD

This prevents different application builds from being accidentally deployed
to different environments.

🧪 Build and Test

The application is built using Maven.

mvn clean package

The generated deployment artifact is:

target/cinevault.war

GitHub Actions then stores this WAR as a workflow artifact.

🚀 Deployment

Each environment receives the WAR through SSH/SCP.

The deployment process is:

Download WAR
     │
     ▼
Copy WAR to EC2
     │
     ▼
Stop Tomcat
     │
     ▼
Remove previous deployment
     │
     ▼
Copy new WAR
     │
     ▼
Start Tomcat
     │
     ▼
Wait for application
     │
     ▼
Health Check

The deployed application is available at:

http://EC2-PUBLIC-IP:8080/cinevault/
🔐 GitHub Environments

The project uses four GitHub Environments:

GitHub
│
├── dev
├── test
├── pre-production
└── production

Each environment contains its own deployment secrets.

Required secrets:

EC2_HOST
EC2_USER
EC2_SSH_KEY

Sensitive credentials are stored using GitHub Secrets and are not committed
to the repository.

🛡️ Deployment Protection

The higher environments can be protected using GitHub Environment
required reviewers.

Recommended flow:

DEV
 │
 │ automatic
 ▼
TEST
 │
 │ approval
 ▼
PRE-PROD
 │
 │ approval
 ▼
PRODUCTION

This provides a controlled promotion process before production deployment.

🔎 Deployment Verification

Every deployment performs a health check directly on the target EC2 instance.

curl -f http://localhost:8080/cinevault/

If the application does not return a successful HTTP response, the GitHub
Actions job fails.

This prevents a successful deployment from being reported when the
application is not responding.

🛠️ Technology Stack
Technology	Purpose
Java 21	Application development
JSP	Web interface
Maven	Build and packaging
WAR	Deployment artifact
Apache Tomcat 10	Java application server
Amazon Linux	EC2 operating system
AWS EC2	Cloud infrastructure
Git	Version control
GitHub	Source repository
GitHub Actions	CI/CD automation
SSH	Remote server access
SCP	WAR transfer
📁 Project Structure
cinevault/
│
├── .github/
│   └── workflows/
│       └── cicd.yml
│
├── src/
│   └── main/
│       ├── java/
│       │
│       └── webapp/
│           ├── index.jsp
│           └── home.jsp
│
├── pom.xml
├── .gitignore
└── README.md
💻 Run Locally
Requirements

Install:

Java 21
Maven
Apache Tomcat 10
Git

Check Java:

java -version

Check Maven:

mvn -version

Build the project:

mvn clean package

WAR file:

target/cinevault.war

Deploy the WAR to Tomcat and open:

http://localhost:8080/cinevault/
📸 Project Screenshots
🎬 Application

Add a screenshot of the running CineVault application here.

Application running on Tomcat
⚙️ GitHub Actions

The completed pipeline:

✅ Build & Test
       ↓
✅ Deploy → DEV
       ↓
✅ Deploy → TEST
       ↓
✅ Deploy → PRE-PROD
       ↓
✅ Deploy → PRODUCTION
☁️ AWS Infrastructure

Four EC2 environments:

DEV
TEST
PRE-PROD
PRODUCTION

All running Java and Apache Tomcat.

📊 DevOps Skills Demonstrated

This project demonstrates practical experience with:

Git
GitHub
GitHub Actions
CI/CD
Java 21
Maven
WAR packaging
Apache Tomcat
Linux
AWS EC2
SSH
SCP
GitHub Environments
GitHub Secrets
Multi-environment deployments
Artifact promotion
Deployment automation
Health checks
Production deployment workflow
🎯 Project Objective

The primary objective of CineVault is to demonstrate a complete application
delivery lifecycle.

SOURCE CODE
     │
     ▼
VERSION CONTROL
     │
     ▼
BUILD
     │
     ▼
TEST
     │
     ▼
PACKAGE
     │
     ▼
DEV
     │
     ▼
TEST
     │
     ▼
PRE-PROD
     │
     ▼
PRODUCTION
     │
     ▼
VERIFY

The application itself is intentionally lightweight so that the focus remains
on the deployment and DevOps workflow.

🔮 Future Improvements

Potential improvements include:

Docker containerization
Terraform Infrastructure as Code
AWS Application Load Balancer
HTTPS
Route 53
CloudWatch monitoring
Automated rollback
Blue/Green deployment
AWS IAM-based deployment
Private deployment architecture
Monitoring and alerting
Infrastructure automation
👨‍💻 Author
Vamsi Krishna

Aspiring AWS / DevOps Engineer

AWS
DevOps
CI/CD
Linux
Terraform
Java
Cloud Deployment
Automation
⭐ Final Result

CineVault demonstrates:

Java Application
       ↓
Maven
       ↓
WAR
       ↓
GitHub
       ↓
GitHub Actions
       ↓
DEV
       ↓
TEST
       ↓
PRE-PROD
       ↓
PRODUCTION
       ↓
Tomcat
       ↓
Live Application

Build → Test → Deploy → Verify 🚀