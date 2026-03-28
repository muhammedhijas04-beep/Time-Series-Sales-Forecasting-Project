📈 Retail Sales Forecasting using SARIMA

🧠 Project Overview

This project builds a time-series forecasting model to predict weekly retail sales using historical data.

The objective is to support inventory planning, demand forecasting, and operational decision-making by accurately estimating future sales.

🚨 Business Problem

Retail businesses face:

Fluctuating weekly demand
Seasonal spikes during holidays
Uncertainty in inventory planning

👉 Key question:
“How much should we stock in upcoming weeks?”

🎯 Business Impact

Improves inventory planning accuracy
Reduces overstocking and stockouts
Supports staffing and supply chain decisions
Enables data-driven demand forecasting

📊 Dataset Summary

132 weeks of historical sales data
Aggregated at company level
Weekly frequency
🛠 Tools & Technologies
Python (Pandas, NumPy) – Data processing
Matplotlib / Seaborn – Visualization
Statsmodels – Time series modeling
Scikit-learn – Model evaluation

🔍 Key Analysis

Identified strong yearly seasonal patterns
Observed stable baseline demand (~45M weekly sales)
Detected holiday-driven sales spikes
Confirmed need for seasonal modeling

🤖 Model Approach

Tested ARIMA models → underperformed due to seasonality
Implemented SARIMA model to capture:
Short-term trends
Yearly seasonal cycles

📈 Model Performance

Metric	Value
MAE	   613K
RMSE	 772K
MAPE	1.32%

👉 Forecast accuracy = 98.7%

🔮 Key Insights

Weekly sales remain stable with predictable seasonal spikes
Holiday periods increase demand significantly
SARIMA effectively captures long-term patterns

📊 Forecast Visualization

<img width="971" height="482" alt="SARIMA Forecast vs Actual" src="https://github.com/user-attachments/assets/f8b7e2cd-4929-46db-af3f-3310934ed241" />



🚀 Final Outcome

Developed a SARIMA-based forecasting model capable of predicting weekly retail sales with high accuracy (~1.3% error), enabling better demand planning and operational decision-making.
