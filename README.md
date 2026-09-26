# 🎬 CineVault

### **Java Web Application • GitHub Actions CI/CD • AWS EC2 • Apache Tomcat**

<p align="center">
  <strong>A lightweight Java web application deployed automatically to AWS EC2 using a CI/CD pipeline.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=openjdk" alt="Java 21">
  <img src="https://img.shields.io/badge/Maven-Build-red?style=for-the-badge&logo=apachemaven" alt="Maven">
  <img src="https://img.shields.io/badge/Tomcat-10-yellow?style=for-the-badge&logo=apachetomcat" alt="Tomcat">
  <img src="https://img.shields.io/badge/AWS-EC2-orange?style=for-the-badge&logo=amazonaws" alt="AWS EC2">
  <img src="https://img.shields.io/badge/GitHub-Actions-black?style=for-the-badge&logo=githubactions" alt="GitHub Actions">
</p>

---

## 🌟 About the Project

**CineVault** is a lightweight Java web application created primarily as a **DevOps and CI/CD portfolio project**.

The application itself is intentionally simple. The main focus is the complete deployment lifecycle:

```text
Developer
    │
    │ git push
    ▼
 GitHub
    │
    ▼
GitHub Actions
    │
    ├── Checkout source
    ├── Setup Java 21
    ├── Maven build
    └── Generate WAR
          │
          ▼
       SSH / SCP
          │
          ▼
       AWS EC2
          │
          ▼
      Apache Tomcat
          │
          ▼
     CineVault 🎬
```

A code change pushed to GitHub can therefore travel through the entire pipeline and become a new version of the live application.

---

# 🏗️ Architecture

```text
                    ┌───────────────────┐
                    │     Developer     │
                    │                   │
                    │   Java / JSP      │
                    └─────────┬─────────┘
                              │
                           git push
                              │
                              ▼
                    ┌───────────────────┐
                    │      GitHub       │
                    │    Repository     │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │  GitHub Actions   │
                    │                   │
                    │  • Checkout       │
                    │  • Java 21        │
                    │  • Maven Build    │
                    │  • Create WAR     │
                    └─────────┬─────────┘
                              │
                         SSH / SCP
                              │
                              ▼
              ┌────────────────────────────┐
              │          AWS EC2           │
              │                            │
              │      Amazon Linux 2023     │
              │             │              │
              │       Apache Tomcat 10     │
              │             │              │
              │       cinevault.war        │
              └──────────────┬─────────────┘
                             │
                             ▼
                     🌐 Live Application
```

---

# 🔄 CI/CD Pipeline

Every deployment follows this process:

### 1️⃣ Developer pushes code

```bash
git add .
git commit -m "Update CineVault"
git push
```

### 2️⃣ GitHub Actions starts

The workflow automatically triggers when code is pushed to the `main` branch.

### 3️⃣ Java environment is prepared

GitHub Actions installs:

```text
Java 21
Maven
```

### 4️⃣ Application is built

```bash
mvn clean package
```

This generates:

```text
target/cinevault.war
```

### 5️⃣ WAR is transferred to EC2

GitHub Actions securely connects to the EC2 server using SSH.

### 6️⃣ Tomcat deployment

The previous application is removed and the new WAR is deployed:

```text
/usr/share/tomcat10/webapps/cinevault.war
```

### 7️⃣ Tomcat restarts

```bash
sudo systemctl restart tomcat10
```

### 8️⃣ Deployment health check

The workflow verifies:

```bash
curl -f http://localhost:8080/cinevault/
```

If the application does not respond successfully, the GitHub Actions workflow fails.

---

# 🛠️ Technology Stack

| Technology          | Purpose                  |
| ------------------- | ------------------------ |
| ☕ Java 21           | Application development  |
| 🌐 JSP              | Web presentation         |
| ⚙️ Jakarta Servlet  | Request handling         |
| 📦 Maven            | Build and WAR packaging  |
| 🐱 Apache Tomcat 10 | Application server       |
| ☁️ AWS EC2          | Cloud deployment server  |
| 🔄 GitHub Actions   | CI/CD automation         |
| 🔐 SSH              | Secure server deployment |
| 🐙 Git/GitHub       | Source control           |

---

# 📁 Project Structure

```text
cinevault/
│
├── .github/
│   └── workflows/
│       └── cicd.yml
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── cinevault/
│       │           └── HomeServlet.java
│       │
│       └── webapp/
│           ├── index.jsp
│           └── home.jsp
│
├── pom.xml
├── .gitignore
└── README.md
```

---

# ⚙️ Run Locally

## Prerequisites

Install:

* Java 21
* Maven
* Apache Tomcat 10
* Git

Verify Java:

```bash
java -version
```

Verify Maven:

```bash
mvn -version
```

---

## Build the Application

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/cinevault.git
```

Enter the project:

```bash
cd cinevault
```

Build:

```bash
mvn clean package
```

The WAR file will be generated at:

```text
target/cinevault.war
```

---

# 🐱 Deploy to Tomcat

Copy the generated WAR file into Tomcat's `webapps` directory:

```text
cinevault.war
        ↓
Tomcat/webapps/
```

Start Tomcat.

Then open:

```text
http://localhost:8080/cinevault/
```

---

# ☁️ AWS Deployment

The production-style deployment uses:

```text
AWS EC2
   │
   ├── Amazon Linux 2023
   ├── Java 21
   └── Apache Tomcat 10
```

The application is deployed as:

```text
/usr/share/tomcat10/webapps/cinevault.war
```

The application becomes available through:

```text
http://EC2-PUBLIC-IP:8080/cinevault/
```

---

# 🔐 GitHub Actions Secrets

The CI/CD pipeline uses GitHub Repository Secrets.

Required secrets:

```text
EC2_HOST
EC2_USER
EC2_SSH_KEY
```

### EC2_HOST

The public IPv4 address of the EC2 instance.

### EC2_USER

```text
ec2-user
```

### EC2_SSH_KEY

The private SSH key used to connect to the EC2 instance.

> 🔒 Private keys are stored as GitHub Secrets and are never committed to the repository.

---

# 🚀 GitHub Actions Workflow

The workflow is located at:

```text
.github/workflows/cicd.yml
```

Pipeline:

```text
Push to main
     │
     ▼
Checkout
     │
     ▼
Java 21
     │
     ▼
Maven Build
     │
     ▼
cinevault.war
     │
     ▼
SSH/SCP
     │
     ▼
AWS EC2
     │
     ▼
Tomcat 10
     │
     ▼
Health Check
     │
     ▼
Deployment Complete ✅
```

---

# 📸 Application Preview

> Add screenshots of the running application here.

### CineVault Homepage

```text
📷 Add screenshot here
```

### GitHub Actions — Successful Deployment

```text
📷 Add GitHub Actions screenshot here
```

### AWS EC2 — Tomcat Deployment

```text
📷 Add EC2/Tomcat screenshot here
```

---

# 📊 DevOps Skills Demonstrated

This project demonstrates practical experience with:

* ✅ Git version control
* ✅ GitHub repository management
* ✅ GitHub Actions
* ✅ CI/CD pipeline creation
* ✅ Java 21
* ✅ Maven builds
* ✅ WAR packaging
* ✅ Linux server administration
* ✅ AWS EC2
* ✅ Apache Tomcat
* ✅ SSH-based deployment
* ✅ Application health checks
* ✅ Deployment automation
* ✅ GitHub Secrets
* ✅ Basic cloud deployment architecture

---

# 🎯 Project Objective

The primary objective of CineVault is not application complexity.

The project was intentionally designed to demonstrate a complete **application delivery pipeline**:

```text
Code
 ↓
Version Control
 ↓
Build
 ↓
Package
 ↓
Deploy
 ↓
Run
 ↓
Verify
```

This makes the project easy to understand while keeping the focus on practical DevOps concepts.

---

# 🔮 Future Improvements

Possible future improvements include:

* [ ] Nginx reverse proxy
* [ ] HTTPS with Let's Encrypt
* [ ] Custom domain
* [ ] Docker containerization
* [ ] Terraform infrastructure
* [ ] AWS IAM deployment strategy
* [ ] Blue/Green deployment
* [ ] Automated rollback
* [ ] Monitoring and logging
* [ ] CloudWatch integration
* [ ] AWS Application Load Balancer
* [ ] Auto Scaling

---

# 🧠 What I Learned

Through this project, I practiced how a Java application moves from a developer's machine to a cloud server through an automated CI/CD pipeline.

The complete process:

```text
Java Development
       ↓
Maven
       ↓
WAR Packaging
       ↓
Git
       ↓
GitHub
       ↓
GitHub Actions
       ↓
AWS EC2
       ↓
Tomcat
       ↓
Live Application
```

---

# 👨‍💻 Author

**Vamsi Krishna**

Aspiring **AWS / DevOps Engineer**

Focused on:

```text
AWS
DevOps
CI/CD
Linux
Terraform
Java
Cloud Deployment
Automation
```

---

## ⭐ Project

If you find this project useful or interesting, consider giving the repository a ⭐.

**Built with Java. Deployed with AWS. Automated with GitHub Actions. 🚀**
