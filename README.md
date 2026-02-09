# Time-Series-Sales-Forecasting-Project

🧠 Project Overview

Retail businesses need reliable sales forecasts to plan inventory, staffing, and promotions.

This project builds a data-driven forecasting system that analyzes historical weekly sales and predicts future demand using statistical time series modeling.

The final output includes:

A SARIMA forecasting model built in Python

A Power BI dashboard to visualize actual vs forecasted sales and forecast accuracy

This project simulates how forecasting solutions are delivered in real analytics teams.

🎯 Business Problem

Retail sales fluctuate due to:

Seasonal demand patterns

Holiday spikes

Trend shifts over time

Without forecasting:

Inventory shortages or overstock occur

Poor staffing decisions are made

Revenue opportunities are missed

Goal: Build a model that captures seasonal sales behavior and supports planning decisions.

📊 Dataset Description

Weekly retail sales data

Multiple years of historical performance

Clear yearly seasonal patterns (holiday peaks)

Each record represents:

Total company sales for a specific week

🔍 Project Workflow

1️⃣ Exploratory Data Analysis (EDA)

What I did

Visualized weekly sales trends

Identified strong yearly seasonality

Observed recurring end-of-year sales spikes

Insight
Sales patterns repeat annually, meaning seasonality must be modeled.

2️⃣ Stationarity Testing

What I did

Applied first differencing to remove trend

Used ADF (Augmented Dickey-Fuller) test

Key Result

ADF Statistic: -6.43

p-value: ~0.000000016

✔ Data became stationary after differencing
✔ Suitable for ARIMA-based models

3️⃣ ARIMA Modeling (Baseline)

built ARIMA(2,1,1) based on ACF & PACF analysis.

Problem Found

High AIC (~4370)

Poor residual diagnostics

Could not capture yearly seasonality

Conclusion: ARIMA alone is not enough for retail sales.

4️⃣ SARIMA Modeling (Final Model)

upgraded to:

SARIMA(2,1,1)
 
×
 
(1,1,1,52)
SARIMA(2,1,1) × (1,1,1,52)

This model captures:

Short-term patterns

Long-term trend

Yearly seasonal cycles (52 weeks)

📈 Model Performance

Model Fit Metrics

| Metric                     | Value      | Interpretation                 |
| -------------------------- | ---------- | ------------------------------ |
|   AIC                      | 787.71     | Strong model fit               |
| Ljung-Box p-value          | 0.33       | No autocorrelation left        |
| Jarque-Bera p-value        | 0.88       | Residuals approximately normal |
| Heteroskedasticity p-value | 0.33       | Stable variance                |


✔ Residuals behave like random noise → Model captured meaningful structure

Forecast Accuracy (Test Set)

| Metric             | Value        | Meaning                          |
| ------------------ | ------------ | -------------------------------- |
| **MAE**            | 6.74 million | Avg weekly forecast error        |
| **Estimated MAPE** | ~14%         | Good retail forecasting accuracy |


Retail forecasting typically has 10–20% error due to demand volatility.
This model performs within an acceptable business range.

📊 Power BI Forecasting Dashboard

The forecast results were integrated into a Power BI dashboard for business users.

Dashboard Features

📈 Line Chart: Actual vs Forecasted Weekly Sales

🎯 Forecast Accuracy KPI

📅 Monthly Trend Analysis

📋 Weekly Forecast Error Table

Business Value

The dashboard helps decision-makers:

Compare expected vs actual demand

Plan inventory and staffing

Identify high-risk demand periods

🛠 Tools & Technologies

Tool	Purpose
Python	Data processing & modeling
Pandas / NumPy	Data transformation
Statsmodels	ARIMA & SARIMA modeling
Matplotlib	Visualization
Power BI	Forecast dashboard

🧠 Key Learnings

Retail sales are heavily influenced by seasonality

ARIMA is a good baseline but SARIMA is essential for seasonal data

Forecasting requires both statistical validation and business interpretation

Delivering insights through dashboards is as important as building models

🚀 Future Improvements

Add holiday variables to improve spike prediction

Use SARIMAX with promotional data as external features

Compare with Prophet on a clean environment

📌 Final Outcome

This project demonstrates an end-to-end forecasting pipeline:

Data → Statistical Modeling → Validation → Business Dashboard
