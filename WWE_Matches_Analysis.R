---
title: "WWE PLE Matches & Winners"
author: "Daveion"
date: "2025-05-08"
output: html_document
---

# ===============================
# WWE Match Outcome Analysis (Cleaned)
# ===============================

# 📦 Load Packages
install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(janitor)
library(ggplot2)

# 📁 Load and Clean
data <- read_csv("WWE_History_1000.csv")
data <- clean_names(data)

# Create outputs and visuals folders if they don't exist
if (!dir.exists("outputs")) dir.create("outputs")
if (!dir.exists("images")) dir.create("images")

# 🕵️ Inspect Data
glimpse(data)
summary(data)

# ===============================
# ANALYSIS
# ===============================

# ----------------------------------------
# 1. Top 10 Winners in alphabetical order
# ----------------------------------------
  top_winners <- data %>%
  count(winner, sort = FALSE) %>%
  arrange(desc(n), winner) %>%
  slice_head(n = 10)
  
  write.csv(top_winners, "outputs/top_winners.csv", row.names = FALSE)


# ----------------------------------------
# 2. Top 10 Losers
# ----------------------------------------
top_losers <- data %>%
  count(loser) %>%
  arrange(desc(n), loser) %>%
  slice_head(n = 10)

write.csv(top_losers, "outputs/top_losers.csv", row.names = FALSE)

## Troubleshooting win / loss results to validate data integrity
top_winners$winner
top_losers$loser

win_counts <- data %>% count(winner, name = "wins")
loss_counts <- data %>% count(loser, name = "losses")

win_loss_summary <- full_join(win_counts, loss_counts, by = c("winner" = "loser")) %>%
  replace_na(list(wins = 0, losses = 0)) %>%
  mutate(net_wins = wins - losses) %>%
  arrange(desc(net_wins))

print(head(win_loss_summary, 10))

# NOTE: These results appear flawed — equal win/loss counts as well as no wins for some wrestlers likely indicate synthetic data.
write.csv(win_loss_summary, "outputs/win_loss_summary.csv", row.names = FALSE)


# ----------------------------------------
# 3. Total Title Matches
# ----------------------------------------
title_match_count <- data %>%
  filter(title_match == "Yes") %>%
  nrow()

# Convert count to a proper data frame before writing
title_match_df <- data.frame(total_title_matches = title_match_count)
write.csv(title_match_df, "outputs/title_match_count.csv", row.names = FALSE)


# ----------------------------------------
# 4. Title Match Ratio
# ----------------------------------------
title_match_ratio <- title_match_count / nrow(data)

# Convert ratio to a proper data frame before writing
title_match_ratio_df <- data.frame(ratio_title_matches = title_match_ratio)
write.csv(title_match_ratio_df, "outputs/title_match_ratio.csv", row.names = FALSE)

# NOTE: Ratio seems ridiculously high as more than half the matches were title matches.


# ----------------------------------------
# 5. Match Count by Event
# ----------------------------------------
top_events <- data %>%
  count(event, sort = TRUE) %>%
  slice_max(n, n = 10)
  
write.csv(top_events, "outputs/top_events.csv", row.names = FALSE)

## NOTE: Multiple events having exact same number of matches


# ----------------------------------------
# 6. Combined Wrestler Appearances
# ----------------------------------------
appearances <- data %>%
  pivot_longer(cols = c(winner, loser), names_to = "role", values_to = "wrestler") %>%
  count(wrestler, sort = TRUE) %>%
  slice_max(n, n = 10)
  
write.csv(appearances, "outputs/appearances.csv", row.names = FALSE)

## NOTE: Multiple wrestlers appearing 42 times (21 wins + 21 losses)



# ===============================
# VISUALIZATION
# ===============================

# ----------------------------------------
# Top Winners
# ----------------------------------------
ggplot(top_winners, aes(x = reorder(winner, n), y = n)) +
  geom_col(fill = "#1E90FF") +
  coord_flip() +
  labs(title = "Top 10 Match Winners", x = "Wrestler", y = "Wins") +
  theme_minimal()
ggsave("images/top_winners.png")

# ----------------------------------------
# Top Losers
# ----------------------------------------
# Create and assign the plot
p <- ggplot(top_losers, aes(x = reorder(loser, n), y = n)) +
  geom_col(fill = "#FF4500") +
  coord_flip() +
  labs(title = "Top 10 Match Losers", x = "Wrestler", y = "Losses") +
  theme_minimal()

# Display the plot
print(p)

# Save the plot to the images folder
ggsave("images/top_losers.png", plot = p, width = 8, height = 5)

# ----------------------------------------
# Title Match Ratio (Bar)
# ----------------------------------------
ggplot(data.frame(category = c("Title Matches", "Non-Title Matches"),
                  count = c(title_match_count, nrow(data) - title_match_count)),
       aes(x = category, y = count, fill = category)) +
  geom_col(show.legend = FALSE) +
  labs(title = "Title Match Frequency", x = "", y = "Match Count") +
  scale_fill_manual(values = c("#228B22", "#B0C4DE")) +
  theme_minimal()
ggsave("images/title_match_ratio.png")

# ----------------------------------------
# Matches per Event
# ----------------------------------------
ggplot(top_events, aes(x = reorder(event, n), y = n)) +
  geom_col(fill = "#8A2BE2") +
  coord_flip() +
  labs(title = "Top Events by Match Count", x = "Event", y = "Matches") +
  theme_minimal()
ggsave("images/top_events.png")

# This analysis is included not to draw conclusions, but to demonstrate
# how we might evaluate a dataset's structure and realism. The visual
# trends help us identify possible issues in the data generation process.
