# WWE Match Analysis: A Case Study in Data Validation 🕵️‍♂️

This project began as an analysis of 1,000 WWE matches to uncover trends but pivoted into a critical review of data quality. It demonstrates the process of identifying, documenting, and drawing conclusions from a flawed or likely synthetic dataset.

---

### The Objective

The initial goal was to analyze a dataset of 1,000 WWE Premium Live Event (PLE) matches from Kaggle to identify patterns in wins, losses, title defenses, and event frequency.

---

### The Discovery: A Pivot to Critical Review

During exploratory data analysis, I uncovered significant and repeated anomalies that called the integrity of the entire dataset into question. The patterns discovered were not consistent with the real-world logistics and booking of WWE events.

This discovery prompted a pivot: the project's new focus became to document these data quality issues and showcase the importance of skepticism and data validation before drawing conclusions.

#### Evidence of Flawed Data

Key red flags that pointed to synthetic or fabricated data included:
* **❗ Unrealistic Event Frequency:** The dataset listed as many as five major PLEs within a single month, a logistical impossibility.
* **❗ Duplicate Annual Events:** Marquee events that occur only once per year (like WrestleMania or the Royal Rumble) were listed multiple times within the same calendar year.
* **❗ Nonexistent Matchups:** The data contained records of matches that have never taken place at the listed event.

---

### Featured Visualization: The "Broken" Chart

The charts created from this data did not reflect reality. Instead, they revealed the dataset's flaws, such as the unnaturally symmetrical win/loss records shown below. This visual was the key piece of evidence that confirmed the data was unreliable.

*To add your main chart here, place the image file (e.g., `symmetrical-wins-chart.png`) inside your `images` folder and make sure the filename below matches it exactly.*

![Unnatural Win/Loss Ratios](./images/your-most-revealing-chart.png)

---

### The Outcome: The Value of Skepticism

While the dataset could not be used to generate reliable insights about WWE booking, the project successfully demonstrates a more critical real-world skill:
- How to rigorously investigate data for inconsistencies.
- The importance of validating assumptions with domain knowledge.
- How to clearly communicate the limitations of a dataset.

---

### 🛠️ Tools & Technology

* **Data Wrangling & Analysis:** R (using `tidyverse` and `dplyr`)
* **Data Cleaning:** `janitor`
* **Visualization:** `ggplot2`
