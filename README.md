# 📈 Retail Sales Forecasting using ARIMA & SARIMA

🧠 Project Overview

This project builds an end-to-end time series forecasting system to predict weekly retail company sales using statistical models.

The objective is to transform raw historical sales data into a forecasting model that supports demand planning and inventory decisions.

We compare ARIMA vs SARIMA and evaluate model accuracy on unseen future data.

🎯 Business Problem

Retail sales show:

Weekly fluctuations

Holiday demand spikes

Yearly seasonal patterns

The goal is to answer:

“How much will we sell in upcoming weeks?”

Accurate forecasting helps with:

✔ Inventory planning

✔ Staffing decisions

✔ Supply chain optimization

🛠 Tools & Technologies

| Tool                   | Purpose                        |
| ---------------------- | ------------------------------ |
| Python (Pandas, NumPy) | Data cleaning & transformation |
| Matplotlib / Seaborn   | Visualization                  |
| Statsmodels            | ARIMA & SARIMA modeling        |
| Scikit-learn           | Forecast accuracy metrics      |

🧱 Project Workflow

1️⃣ Data Preparation

Aggregated store-level data into total weekly company sales

Converted Date column into time index

Ensured continuous weekly frequency

2️⃣ Trend & Seasonality Analysis

📊 Weekly Sales Trend

<img width="992" height="686" alt="image" src="https://github.com/user-attachments/assets/9d19a591-27bd-46b1-9528-a52cf569f9c1" />

📈 12-Week Rolling Average

<img width="1204" height="736" alt="image" src="https://github.com/user-attachments/assets/a4fe8719-5a1c-4596-8f7f-e0cb527e9523" />

Findings

Strong yearly seasonal peaks

No consistent long-term growth

Data is non-stationary

3️⃣ Stationarity Treatment

Applied first differencing:

              **Yt′​=Yt​−Yt−1**
              ​​
<img width="980" height="565" alt="image" src="https://github.com/user-attachments/assets/82d13c28-8d27-486a-a424-1d965f713337" />

4️⃣ ADF Test (Stationarity Check)

| Metric        | Value    | Conclusion              |
| ------------- | -------- | ----------------------- |
| ADF Statistic | -6.43    | Strong stationarity     |
| p-value       | 1.68e-08 | Reject non-stationarity |

→ Set d = 1

5️⃣ ACF & PACF Analysis

Used to estimate ARIMA parameters.

<img width="567" height="437" alt="image" src="https://github.com/user-attachments/assets/ce270f49-5faf-4463-bb4e-f75dcba39919" />

<img width="567" height="437" alt="image" src="https://github.com/user-attachments/assets/ab04240e-3f33-4de5-a1b9-45568ab3067c" />

| Plot | Insight            | Parameter |
| ---- | ------------------ | --------- |
| ACF  | Spike at lag 1     | q = 1     |
| PACF | Spikes up to lag 3 | p = 2–3   |

📈 ARIMA Modeling

Tested:

ARIMA(2,1,1)

ARIMA(3,1,1)

| Model        | AIC  |
| ------------ | ---- |
| ARIMA(2,1,1) | 4370 |
| ARIMA(3,1,1) | 4458 |

⚠ Residuals still showed seasonal structure → ARIMA underfitting

🔁 Switching to SARIMA

Retail sales exhibit yearly seasonality, so we introduced:

**SARIMA(2,1,1) × (1,1,1,52**

| Component  | Captures            |
| ---------- | ------------------- |
| Short-term | Weekly dependencies |
| Seasonal   | Yearly cycles       |

📊 SARIMA Model Results

<img width="971" height="559" alt="image" src="https://github.com/user-attachments/assets/9add5fcf-ce7c-4b6c-a5b4-7e329cbe610c" />


| Metric         | Value      |
| -------------- | ---------- |
| Observations   | 132 weeks  |
| Log Likelihood | -387.86    |
| **AIC**        | **787.71** |

🧪 Residual Diagnostics

| Test               | p-value | Result                |
| ------------------ | ------- | --------------------- |
| Ljung-Box          | 0.33    | No autocorrelation    |
| Jarque-Bera        | 0.88    | Near normal residuals |
| Heteroskedasticity | 0.33    | Stable variance       |

✔ Residuals behave like random noise

🔮 Forecast vs Actual

<img width="971" height="482" alt="image" src="https://github.com/user-attachments/assets/bc5cc3d9-d29c-407a-b5ea-a576f1c84a4a" />



| Metric   | Value     |
| -------- | --------- |
| MAE      | 613,853   |
| RMSE     | 596B      |
| **MAPE** | **1.32%** |

🎯 Interpretation

Weekly sales ≈ 45–50 million
Forecast error ≈ 0.6 million

➡ Forecast Accuracy ≈ 98.7%

🚀 Key Learnings

ARIMA works for short-term patterns

Retail sales require seasonal modeling

SARIMA dramatically improves forecasting

Proper residual checks are critical

Date alignment is essential for evaluation

🏁 Final Outcome

A production-ready SARIMA forecasting model capable of predicting weekly retail sales with ~1.3% error.
