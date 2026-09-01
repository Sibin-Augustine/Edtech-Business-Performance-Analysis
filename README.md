**EdTech Business Performance Dashboard**

## Project Overview
This project analyses 1,000 student records from an EdTech platform, tracking revenue, student demographics, payment status, device usage, and engagement metrics using Excel/Google sheets. 

## Problem Statement 

An education tech platform which is focused on providing great learning experience for students coming from different education background, recently, experiencing low student enrollment which results in lower profit margin. The stakeholders is expected to identify the less popular courses and popular course delivery medium. 

## Dashboard Preview 

<img width="406" height="320" alt="project51" src="https://github.com/user-attachments/assets/30c33fb5-6016-48cf-adb1-35572f12831a" />


## Dataset
- 1,000 student records
- Revenue
- Course
- Device
- Payment Status
- Region
- Passing Year
- Student Points
- Learning Streak

## Tools Used
- Microsoft Excel
- Google Sheets
- Pivot Tables
- Pivot Charts
- Slicers
- Conditional & aggregation formulas
- Dashboard Design

## 🔬 Methodology
1. **Data Cleaning**: Dataset contain missing details such as course fee which differ for each region. Using conditional formula and autofill feature the course fee for each student is calculated. As per Gender of the students a salutation field is added and concataneted with name to obtain proper full name.   
2. **Feature Engineering**: Using XLOOKUP, the details of the users experienced login issues is filled in another table. 
3. **EDA**: Conditional aggregation formulas (SUMIF, COUNTIF) used to analyse the payment status and collected revenue. Also obtained number of students who uses various device. The user engagement is analysed using the average streak and average points. 
4. **Visualization Strategy**: Pivot tables are used to summarize the given data based on region, signup device, passing year, education background, courses enrolled. Then bar chart is used to visualize number of students enrolled as per the selected metric. Donut chart is used to indicate percentagewise distribution of students as per their education background. Slicers are used to filter the visuals based on gender and payment status to make it interactive. 

## KPIs 
- Total Revenue :- The total payment collected from enrolled students.
- Total Students :- Total number of students enrolled in the platform.
- Average Revenue Per student :- Total Revenue/Total Students
- Mobile Users :- Percentage of users with mobile as sign up device 
- Payment Completion Rate :- Percentage of enrolled students whose payment status is Completed.
- Average Streak :- Average of the number of days students visited the platform continuously
- Average Points :- Average of the points acquired by students by completing course modules 

## Key Findings

📊 **Overall Portfolio Health**
- Total loans analyzed: 2.26M
- Overall default rate: __%
- Total capital deployed: $__ million

⚠️ **Top Risk Factors**
1. Grade G loans default at __% vs Grade A at __%
2. Small business loans have __% default rate — highest among purposes
3. Borrowers with DTI > 30 default __x more than those with DTI < 10
4. Renters default __% more than homeowners

🌎 **Geographic Risk**
- Highest risk states: __, __, __
- Safest states: __, __, __

📈 **Trends**
- Default rates spiked in year __ (likely due to __)
- Average loan size grew from $__ to $__ over the period

## Recommendations
- Increase targeted marketing campaigns in East and West regions to improve student acquisition and balance regional enrollment.
- Continue developing courses aligned with the needs of recent graduates while exploring programs tailored for working professionals to diversify the learner base.
- Continue investing in the mobile learning experience, as over 77% of students access the platform via mobile devices.
- Review the Web Development course offering, pricing, and curriculum to identify factors contributing to low enrollment and improve its market appeal.
- Introduce automated payment reminders and simplify the payment process to improve payment completion rates.
## Skills Demonstrated

- Data Cleaning
- Data Analysis
- Dashboard Design
- Pivot Tables
- Pivot Charts
- Interactive Slicers
- KPI Development
- Business Analysis
- Data Storytelling
