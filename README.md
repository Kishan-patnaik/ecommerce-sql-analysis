# Zepto E-Commerce SQL Data Analysis

This project contains SQL scripts designed to perform data exploration, cleaning, and analysis on an e-commerce dataset, inspired by Zepto — a fast grocery delivery platform. The dataset consists of product-level information such as pricing, discount, availability, and weight, enabling valuable insights into inventory, revenue, and product performance.

---

## 📚 Dataset Source

Data is sourced from Kaggle's **Zepto Inventory Dataset**, which provides detailed product catalog and pricing information for Zepto—a 10‑minute grocery delivery service:  
[Kaggle: Zepto Inventory Dataset](https://www.kaggle.com/datasets/devshahoff/zepto-dataset) :contentReference[oaicite:1]{index=1}

---

## 📂 Project Structure

- `zepto_data_analysis.sql` – Main SQL script that:
  - Creates and defines the `Zepto` table
  - Performs data exploration
  - Identifies and cleans problematic records
  - Executes analytical queries to extract insights

---

## 🔍 Key Features

### ✅ Database Setup & Schema Creation
- Creates the `ECOMMERCE` database and `Zepto` table
- Defines constraints to ensure data integrity (e.g., non-negative prices, weights)

### 📊 Data Exploration
- Count total records
- View sample data
- Identify null values
- Find duplicate product names
- Examine category distribution and stock status

### 🧹 Data Cleaning
- Detects and removes products with zero MRP or selling price
- Converts pricing from paise to rupees (MRP / 100)

### 📈 Analysis & Business Insights
1. **Top 10 best-value products** (by discount)  
2. **High‑MRP products out of stock**  
3. **Estimated revenue per category**  
4. **Premium products with low discounts**  
5. **Top 5 categories by average discount**  
6. **Price‑per‑gram calculation for 100 g+ items**  
7. **Categorizing products by weight: Low, Medium, Bulk**  
8. **Total inventory weight per category**

---

## 📌 Requirements

- MySQL 5.7+ or any compatible SQL engine
- A basic understanding of SQL (SELECT, GROUP BY, JOIN, etc.)

---

## 🚀 How to Use

1. Download or clone this repository.
2. Obtain the Zepto dataset from the Kaggle link above and import the data into the `Zepto` table.
3. Run `zepto_data_analysis.sql` in your SQL IDE.
4. Review results, tweak queries, and generate insights.

---

## 📬 Author

**Bhanukishan Ravupalli**  
_Analyst | Data Enthusiast_

---

## 🧠 Note

This is a simulated project for learning and portfolio purposes. Real-world e-commerce platforms inspire the dataset and assumptions, but not sourced directly from Zepto.
