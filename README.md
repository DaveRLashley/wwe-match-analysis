# wwe-match-analysis (Critical Data Review)
This project explores the outcomes of 1,000 WWE Premium Live Event (PLE) matches with the goal of identifying trends in wins, losses, title matches, and event frequency.

## 🔍 Objective

The original aim was to analyze match history and uncover meaningful patterns. However, during the course of the analysis, significant data quality issues emerged — including improbable distributions and inconsistencies — which affected the reliability of insights.

## 💡 Outcome

Instead of abandoning the project, the analysis pivots to showcase how to identify and document flawed or synthetic data. This serves as both a technical exercise and a demonstration of responsible data interpretation.

## 📊 Dataset Source

- Dataset: `WWE_History_1000.csv`
- Source: [Kaggle](https://www.kaggle.com/datasets/waqi786/wwe-champion-dataset/data)

### 🔎 How Issues Were Discovered

Suspicions about the dataset’s reliability arose during exploratory analysis when:

- **Unrealistic Event Frequency** – As many as five major PLEs were listed within a single month, which is not logistically possible.
- **Duplicate Annual Events** – PLEs that occur only once a year appeared multiple times in the same calendar year.
- **Nonexistent Matchups** – Several matches were logged between wrestlers who have never competed against each other at their listed PLE.

These patterns strongly indicated that the dataset was synthetic or fabricated, prompting a shift in project focus.

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
![Link to](./images)

---

## 🚀 Future Work

- Find or construct a more detailed WWE dataset with verifiable match IDs and accurate timestamps.
- Use APIs or scrapers (like Cagematch or WrestlingData) to build a fresh dataset.
