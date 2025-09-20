
# 🩸 Blood Donation Portal

A **Java-based Blood Donation Management System** built with **Servlets, JSP (MVC)**, and **MySQL**.
The portal allows users to **request blood, donate blood**, and **search for donors** by blood group and city.

---

## ✨ Key Features

* ✔️ User-friendly dashboard displaying all blood requests
* ✔️ Donors can pledge to donate via a form
* ✔️ Patients can request blood online
* ✔️ Search donors by blood group & location
* ✔️ Modern red-themed UI with blood drop animation
* ✔️ Database integration with MySQL

---

## 📂 Project Structure
<pre>
BloodDonationPortal/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/blooddonation/
│       │       ├── controller/    # Servlets
│       │       ├── dto/           # DTO Classes
│       │       └── util/          # DB Connection
│       └── webapp/
│           ├── assets/
│           │   └── css/
│           │       └── style.css  # Theme & Animations
│           ├── home.jsp
│           ├── requestBlood.jsp
│           ├── donateBlood.jsp
│           ├── dashboard.jsp
│           └── searchDonor.jsp
├── pom.xml / build.xml
</pre>


---

## 🛠️ Tech Stack

* **Backend:** Java, Servlets, JSP (MVC pattern)
* **Frontend:** HTML5, CSS3, Bootstrap
* **Database:** MySQL
* **Server:** Apache Tomcat

---

## ⚙️ Setup Guide

**1️⃣ Clone Repository**

```
git clone https://github.com/your-username/blood-donation-portal.git
```

**2️⃣ Setup MySQL Database**

```
CREATE DATABASE blooddb;
USE blooddb;

CREATE TABLE registration (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    bloodGroup VARCHAR(5),
    location VARCHAR(100),
    contact VARCHAR(15)
);
```

**3️⃣ Update DB Credentials**
Edit file:

```
src/main/java/com/blooddonation/util/DBConnection.java
```

**4️⃣ Deploy on Apache Tomcat**

**5️⃣ Access in Browser**

```
http://localhost:8080/blood-donation-portal/home.jsp
```

---

## 🚀 Future Enhancements

* 🔑 Admin Dashboard for managing donors & requests
* 📧 Email / SMS notifications
* 🔒 Secure login with hashed passwords
* 📱 REST API for mobile integration

---

## 📜 License

📝 Licensed under the **MIT License**

✨ **Contributions are welcome!** If you’d like to improve this project, feel free to **fork** and submit a **pull request**.
