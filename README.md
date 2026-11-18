# 🔨 E-Auction System

A full-stack, role-based online bidding and auction management platform built using **Java EE (Jakarta Servlets & JSP)** following the **MVC (Model-View-Controller)** architecture. The platform facilitates transparent 24/7 C2C and B2C auctions with automated bid validation, session security, and real-time settlement tracking.

---

## ✨ Key Features

### 👤 Buyer Module
* **Live Auction Discovery:** Browse active, upcoming, and category-filtered auction listings.
* **Real-Time Bidding Engine:** Place competitive bids with automated validation against reserve prices and current highest bids.
* **Bid History & Watchlist:** Track active bids, won auctions, and historical transaction statuses from a personalized dashboard.

### 🏪 Seller Module
* **Item Listing Management:** Create auction listings with product images, base/reserve prices, minimum bid increments, and scheduled start/end timestamps.
* **Auction Monitoring:** Track live bid progression and bidder activity on listed items.
* **Automated Settlement:** Automatic winner determination once the auction timer expires.

### 🛡️ Admin Dashboard
* **User & Role Governance:** Manage registered buyers and sellers, verify accounts, and monitor platform activity.
* **Auction Moderation:** Approve, suspend, or remove flagged product listings.
* **System Analytics:** View platform-wide metrics including total active auctions, completed settlements, and registered user counts.

---

## 🏗️ System Architecture & Tech Stack

The application follows a strict **3-Tier MVC Architecture**:
* **Presentation Layer (View):** JSP (JavaServer Pages), HTML5, CSS3, JavaScript, Bootstrap
* **Business Logic Layer (Controller):** Jakarta Servlets (`jakarta.servlet.*`), HTTP Session Management
* **Data Access Layer (Model / DAO):** JavaBeans, JDBC (`com.mysql.cj.jdbc.Driver`)
* **Database:** MySQL 8.0+
* **Servlet Container / Server:** Apache Tomcat 10.1+

---

## 📂 Project Directory Structure

```text
E-Auction-system/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/       # Jakarta Servlets (SignUpServlet, LoginServlet, BidServlet, AdminServlet, etc.)
│       │   ├── dao/              # JDBC Data Access Objects for Users, Products, and Bids
│       │   ├── model/            # POJO / JavaBeans (User, Product, Bid, Category)
│       │   └── util/             # Database connection singleton (DBConnection.java)
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml       # Deployment descriptor & servlet mappings
│           │   └── lib/          # mysql-connector-j.jar & Jakarta dependencies
│           ├── assets/           # CSS, JS, and uploaded product images
│           ├── admin/            # Admin dashboard and moderation JSP views
│           ├── seller/           # Product creation and seller management JSPs
│           ├── buyer/            # Bidding interface and buyer history JSPs
│           ├── index.jsp         # Landing page and live auction catalog
│           ├── login.jsp         # Authentication portal
│           └── signup.jsp        # Role-based user registration
├── sql/
│   └── e_auction_schema.sql      # MySQL database schema & seed data
└── README.md
```

---

## ⚙️ Prerequisites

Ensure you have the following installed on your machine before setting up the project:
* **JDK 17** or higher
* **Apache Tomcat 10.1.x** (uses `jakarta.servlet.*` namespace)
* **MySQL Server 8.0+** & MySQL Workbench
* **IDE:** IntelliJ IDEA (with *Smart Tomcat* plugin) or Eclipse Enterprise Edition

---

## 🚀 Installation & Local Setup

### 1. Clone the Repository
```bash
git clone [https://github.com/Son7c/E-Auction-system.git](https://github.com/Son7c/E-Auction-system.git)
cd E-Auction-system
```

### 2. Configure the MySQL Database
1. Open MySQL Workbench or your MySQL CLI.
2. Create the database and import the tables:
```sql
CREATE DATABASE e_auction;
USE e_auction;
```
3. Execute the SQL script located in the repository (or ensure the core tables `users`, `products`, `bids`, and `categories` are created).
4. Update the database credentials in your JDBC connection class (e.g., `DBConnection.java`):
```java
private static final String URL = "jdbc:mysql://localhost:3306/e_auction?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "your_mysql_password";
```

### 3. Configure Dependencies & Apache Tomcat in IntelliJ IDEA
1. Open the cloned folder in **IntelliJ IDEA**.
2. Go to **File > Project Structure > Libraries** and add:
   * `servlet-api.jar` (located inside your `Apache Tomcat 10.1/lib/` directory)
   * `mysql-connector-j-8.x.x.jar` (also place a copy inside `WEB-INF/lib/`)
3. Install the **Smart Tomcat** plugin from **Settings > Plugins**.
4. Go to **Run > Edit Configurations > Add New (+) > Smart Tomcat**:
   * **Tomcat Server:** Select your local `Apache Tomcat 10.1.x` installation folder.
   * **Deployment Directory:** Point to the project's `webapp` (or `WebContent`) folder.
   * **Context Path:** `/E-Auction-system`
   * **Server Port:** `8080` (change to `8081` if port `8080` is occupied by another service).

### 4. Run the Application
Click **Run** in IntelliJ IDEA and open your browser at:
```text
http://localhost:8080/E-Auction-system/
```

---

## 🔐 Security & Session Management

* **Role-Based Access Control (RBAC):** Server-side session validation protects `/admin/*`, `/seller/*`, and `/buyer/*` endpoints from unauthorized access.
* **SQL Injection Prevention:** All database queries utilize parameterized `PreparedStatement` objects.
* **Cache Control Headers:** Protected JSP views enforce `Cache-Control: no-cache, no-store, must-revalidate` to prevent back-button access after logout.

---

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
