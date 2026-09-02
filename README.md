# 🏦 Loan Default Risk Analysis | SQL + Excel Dashboard

> An end-to-end credit risk analysis of **2.26M loans** from Lending Club (2007–2018), uncovering key default drivers and delivering actionable underwriting recommendations for BFSI/Fintech lenders.



---

## 📌 Project Overview

This project analyzes historical loan performance data to identify **what drives loan defaults** and how lenders can **optimize underwriting decisions**. Using SQL for data aggregation and Excel for visualization, the analysis surfaces both expected patterns (grade-based risk) and counterintuitive insights (DTI paradox) that challenge conventional credit scoring assumptions.

**Business Context:** Loan defaults cost lenders billions annually. Understanding *which borrower attributes signal risk* — and equally important, *when they don't* — is critical for building smarter credit models.

---

## 🎯 Problem Statement

A consumer lending institution wants to:
1. Identify **key predictors** of loan default across borrower demographics, loan attributes, and macroeconomic conditions
2. Understand **which loan segments** carry disproportionate risk
3. Detect **counterintuitive patterns** that may indicate flaws in current underwriting rules
4. Develop **data-driven recommendations** to reduce portfolio default rate

---

## 📊 Dashboard Preview

<img width="465" height="314" alt="image" src="https://github.com/user-attachments/assets/eb00120b-39e1-488d-8282-f683bfd56bc0" />

<img width="464" height="302" alt="image" src="https://github.com/user-attachments/assets/0098bd32-8af0-4ef8-ba7f-cda60f0f561e" />



---

## 🗂️ Dataset

| Attribute | Details |
|-----------|---------|
| **Source** | Lending Club Public Loan Data |
| **Period** | 2007–2018 |
| **Volume** | 2.26M loan records |
| **Total Loan Value** | \$34.02 Billion |
| **Fields** | 25+ (loan amount, grade, DTI, purpose, home ownership, state, interest rate, loan status, income, etc.) |

### Key Fields Used
- `loan_amnt`, `int_rate`, `grade`, `sub_grade`
- `annual_inc`, `dti`, `home_ownership`, `addr_state`
- `purpose`, `loan_status`, `issue_d`, `term`

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **SQL Server (SSMS)** | Data cleaning, aggregation, CTE-based analysis |
| **Microsoft Excel** | Dashboard design, pivot tables, KPI visualization |
| **Excel Charts** | Combo charts, Pareto analysis, comparative bars |

---

## 🔬 Methodology

### 1. Data Cleaning (SQL)
- Removed records with NULL DTI and \$0 income (1,711 records) — data quality issues
- Standardized loan status into binary default flag (`Charged Off`, `Default` → 1)
- Filtered outliers: DTI > 100 (placeholder values)
- Created `loans_clean` table as single source of truth

### 2. Feature Engineering
- **DTI Bucketing:** Categorized into Low / Moderate / High / Very High / Extreme
- **Risk Profile:** Derived from grade (A-B = Low, C = Medium, D-G = High)
- **Default Flag:** Binary indicator from loan_status

### 3. Exploratory Analysis (SQL)
Wrote 8+ analytical queries using **CTEs, window functions, and conditional aggregation** to compute:
- Default rate by grade, purpose, DTI, home ownership, state, year
- Cross-tabulations to validate hypotheses (e.g., DTI × Purpose)
- Interest rate vs. realized default rate comparisons

### 4. Dashboard Design (Excel)
- KPI cards for portfolio-level metrics
- Combo charts (bar + line) for volume vs. rate analysis
- Insight-driven chart titles that state the *finding*, not the *field*
- Footnotes for anomalies requiring context

---

## 📈 Key Performance Indicators

| KPI | Value |
|-----|-------|
| **Total Loans** | 2,260,668 |
| **Total Loan Volume** | \$34.02B |
| **Average Loan Size** | \$15,047 |
| **Average Interest Rate** | 13.09% |
| **Total Defaults** | 284,344 |
| **Overall Default Rate** | 12.58% |

---

## 🔍 Key Findings

### 🎯 Overall Portfolio Health
- **12.58% overall default rate** across 2.26M loans
- **\$34B deployed capital**, with average loan size of \$15K
- Default rate declined significantly post-2010 (26% → ~15%)

### ⚠️ Top Risk Factors

| # | Finding |
|---|---------|
| 1 | **Grade G loans default at ~40% vs Grade A at ~5%** — 8x risk gradient |
| 2 | **Educational loans (20.75%)** and **small business (19.81%)** have highest default rates by purpose |
| 3 | **Very High DTI (30-40) borrowers default at 17.01%** vs Low DTI (<10) at 9.65% |
| 4 | **Renters default 34% more often** than mortgage holders (14.64% vs 10.92%) |
| 5 | **High-risk grade loans default 4x more** than low-risk (20.96% vs 5.32%) |

### 🧠 Counterintuitive Insight (Deep-Dive Analysis)

**Extreme DTI (40+) borrowers default LESS (7.13%) than moderate DTI borrowers.** 

Investigation revealed:
- **82% of Extreme DTI loans are debt refinancing** (62% debt consolidation + 20% credit card)
- These borrowers use loans to **REDUCE** their DTI, not increase risk
- Lender charges highest interest rate (15.21%) — filters risky applicants via price
- **Implication:** Loan *purpose* should be weighted alongside DTI in credit models

### 🌎 Geographic Risk
- **Highest default rates:** AL (15.20%), AR (14.89%), MS (14.73%)
- **Lowest default rates:** HI (13.63%), SD (13.63%), NY (13.80%)
- Southern states show elevated risk — likely correlated with income levels

### 📅 Temporal Trends
- **Default rate peaked at 26% in 2007** (financial crisis vintage)
- **Steadily declined to ~15% by 2016** — reflects tightened underwriting
- **2018 shows 3% default rate** — *understated due to loan maturity (defaults typically occur years 2-4)*

---

## 💡 Business Recommendations

### 🎯 Underwriting Policy
1. **Reprice or restrict Grade E-G loans** — current default rates (25-40%) may exceed risk premium
2. **Cap exposure to educational & small business segments** — 60% above portfolio average default rate
3. **Introduce DTI × Purpose composite score** — high DTI + consolidation ≠ high DTI + new consumption
4. **Weight home ownership more heavily** — renters carry 34% higher default risk

### 📊 Portfolio Strategy
5. **Diversify geographic concentration** — southern states show elevated risk clusters
6. **Monitor recent vintages carefully** — apparent low default rates in newer loans reflect maturity bias, not lower risk

### 🔧 Model Enhancement
7. **Re-examine DTI thresholds** — the current linear assumption breaks at the extreme
8. **Add "loan purpose intent" flag** — refinancing vs. new consumption behaves differently

---

## 🧠 Skills Demonstrated

- ✅ **SQL:** CTEs, window functions, conditional aggregation, cross-tab analysis
- ✅ **Data Cleaning:** Null handling, outlier detection, data quality validation
- ✅ **Exploratory Data Analysis:** Hypothesis formulation → testing → iteration
- ✅ **Statistical Reasoning:** Sample size validation, selection bias identification
- ✅ **Data Visualization:** Excel dashboards, combo charts, insight-driven design
- ✅ **Business Storytelling:** Translating data patterns into actionable recommendations
- ✅ **Critical Thinking:** Investigating counterintuitive patterns rather than accepting them

---



## 📬 Contact

**[Your Name]**  
📧 [sibinaugustine12830@gamil.com]  
💼 [LinkedIn](https://www.linkedin.com/in/sibin-augustine-53222516a/)  
🌐 [Portfolio](https://yourportfolio.com)

---

⭐ *If you found this analysis useful, please star the repo!*
