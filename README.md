
# 🚲 Cyclistic Bike-Share Case Study

This project is the capstone for the **Google Data Analytics Professional Certificate**. It investigates how **annual members** and **casual riders** use the Cyclistic bike-share program differently. The goal is to help the marketing team design strategies to convert casual riders into annual members.

---

## 📁 Project Structure

```
Cyclistic-Case-Study/
│
├── 📊 tableau_dashboard.twbx         # Interactive Tableau dashboard
├── 📂 data/
│   └── 12_months_raw_data/          # Raw CSV data (12 months)
├── 📂 scripts/
│   ├── cyclistic_cleaning.R         # Full R cleaning & transformation script
│   ├── cyclistic_queries.sql        # SQL script for analysis (optional)
│   └── final_summary_skim.R         # Script generating data summary
├── 📄 Cyclistic_Case_Study_Report.pdf  # Final case study report (optional)
├── 📄 README.md                      # You're here
```
## 🔗 External Files

Some large files are stored externally due to GitHub size limits:

- 📄 [Cleaned CSV Dataset (view/Download )](https://drive.google.com/file/d/128E6Mw5fYuTVCKzWrwcBubxBqooWybwe/view?usp=sharing)
- 📄 [Cleaned CSV Dataset (view/Download)](https://drive.google.com/file/d/1XYPN2mtWfFF0d3qNCZFTMa1fvGaNbzeo/view?usp=sharing)

---

## 🎯 Business Task

**How do annual members and casual riders use Cyclistic bikes differently?**  
The answer will help drive decisions about targeted marketing strategies.

---

## 📊 Key Tools Used

| Tool         | Purpose                        |
|--------------|--------------------------------|
| R            | Data cleaning, analysis, EDA   |
| SQL (MySQL)  | Optional querying and analysis |
| Tableau      | Dashboard & visualization      |
| Libraries    | `dplyr`, `lubridate`, `janitor`, `skimr`, `ggplot2` |

---

## 🧹 Data Cleaning Steps

- Combined 12 CSVs into one dataset (~5.6M rows)
- Removed rows with:
  - Missing station IDs or names
  - Duplicate or abnormal ride lengths
- Standardized column names
- Added new columns:
  - `ride_length` (in minutes)
  - `day_of_week`, `month`, `start_hour`

---

## 🔍 Exploratory Data Analysis (EDA)

Key analyses include:

- Ride length distribution by user type
- Weekly/monthly trends
- Peak usage hours
- Popular stations for casual vs. member riders

---

## 📈 Tableau Dashboard Features

- **Filters**: User type, day of week, month
- **Maps**: Interactive heatmaps of start stations
- **Charts**: Ride trends, ride length by hour, popular days

[🔗 View on Tableau Public](https://public.tableau.com/) *(link to be added)*

---

## 📌 Insights Summary

- Casual riders tend to ride more on weekends
- Members show consistent weekday usage
- Average ride length is significantly longer for casual riders
- Certain stations are predominantly used by casuals (tourist-heavy areas)

---

## 🧠 Recommendations

- Target weekend promotions for casual users
- Promote annual plans at popular casual-only stations
- Offer shorter membership trials near tourist hotspots

---

## ✅ Credits

- Project by Vivek Sanyu Yarra
- Guided by: Google Data Analytics Professional Certificate Capstone

---

## 📬 Contact

For questions or collaboration:  
📧 your.email@example.com  
📍 [LinkedIn](https://linkedin.com/in/your-profile)
