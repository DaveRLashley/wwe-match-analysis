# wwe-match-analysis (Critical Data Review)
An analysis of 1000 WWE PLE match outcomes.

## 🧠 Problem Statement

This project aimed to analyze match outcomes from WWE Premium Live Events using a dataset of 1,000 match records. However, during analysis, data quality issues were discovered that significantly impacted insights and accuracy.

## 📊 Dataset Source

- Dataset: `WWE_History_1000.csv`
- Source: [Kaggle](https://www.kaggle.com/datasets/waqi786/wwe-champion-dataset/data)

## 🛠️ Tools Used

- R + dplyr
- tidyverse (for data wrangling)
- ggplot2 (for visualization)
- janitor (for cleaning column names)
- CSV export for result sharing

## 🔍 Step-by-Step Analysis

1. **Data Load & Inspection**
   - Identified columns: Match ID, Date, Event, Winner, Loser, Title Match.
   - Discovered that `Date` and `Match ID` were unreliable and likely synthetic or improperly structured.

2. **Top 10 Winners & Losers**
   - Counted occurrences of each wrestler as winner/loser.
   - Found identical win/loss counts for many — including unusual cases like 20 wins and 0 losses.

3. **Win vs Loss Summary**
   - Merged winner/loser counts to calculate net wins.
   - Found the dataset lacks realism — symmetrical booking, unbalanced appearances, etc.

4. **Conclusion**
   - The dataset is statistically flawed or overly synthetic, limiting reliable insights.
   - Despite this, the process showed how to:
     - Investigate data inconsistencies
     - Validate assumptions
     - Communicate limitations

## 🔍 Key Insights

- Data without context (like timeframes or unique match IDs) is hard to verify.
- Balanced match outcomes may be artificially generated.
- Even flawed data is valuable for teaching cleanup, validation, and skepticism.

## 📸 Visuals / Screenshots
![Folder](./images)

---

## 🚀 Future Work

- Find or construct a more detailed WWE dataset with verifiable match IDs and accurate timestamps.
- Use APIs or scrapers (like Cagematch or WrestlingData) to build a fresh dataset.
