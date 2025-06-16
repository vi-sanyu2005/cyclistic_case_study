# To set working directory to where CSV files are saved
setwd("/Users/apple/Downloads/case study data")

# used packages in the cleaning
library(readr)   # for read_csv
library(dplyr) # for bind_rows
library(janitor) # for data cleaning and preparation
library(skimr) #  for summary statistics for data exploration
library(lubridate) # work with date/time data
library(ggplot2) # for plots or graphs


# Set the working directory
setwd("/Users/apple/Downloads/case study data")

# List all CSV files in the folder
csv_files <- list.files(pattern = "\\.csv$", full.names = TRUE)

# Read and combine all CSVs
all_data <- csv_files %>%
  lapply(read_csv) %>%
  bind_rows()

# View the combined data
head(all_data)

# Cleanings starts (Exploratory Data Analysis begins)

all_data <- clean_names(all_data)
all_data <- all_data %>% remove_empty("cols")
all_data <- all_data %>% distinct()

# for time 
all_data <- all_data %>%  
  mutate(started_at = ymd_hms(started_at),
         ended_at = ymd_hms(ended_at))  

# adding new rows 
all_data <- all_data %>%
  mutate(ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
         day_of_week = wday(started_at, label = TRUE),
         month = month(started_at, label = TRUE),
         start_hour = hour(started_at))

# for maximum ride lenght 24 hours
all_data <- all_data %>%
  filter(ride_length > 0 & ride_length < 1440)  

# Convert timestamp columns to datetime format
all_data$started_at <- as.POSIXct(all_data$started_at, format = "%Y-%m-%d %H:%M:%S")
all_data$ended_at <- as.POSIXct(all_data$ended_at, format = "%Y-%m-%d %H:%M:%S")

# Calculate ride length in minutes
all_data$ride_length <- as.numeric(difftime(all_data$ended_at, all_data$started_at, units = "mins"))

# Add derived columns for analysis
all_data$day_of_week <- weekdays(all_data$started_at)
all_data$month <- format(all_data$started_at, "%B")
all_data$start_hour <- as.numeric(format(all_data$started_at, "%H"))

# to understand whole data 
skim(all_data_clean)

# Drop rows where start or end station name is NA
all_data_clean <- all_data %>%
  filter(!is.na(start_station_name), !is.na(end_station_name))

# summarising things
all_data_clean%>%
  group_by(member_casual) %>%
  summarise(mean_ride = mean(ride_length), .groups = 'drop')

all_data_clean %>%
  group_by(member_casual, day_of_week) %>%
  summarise(num_rides = n(), avg_ride_length = mean(ride_length), .groups = 'drop') %>%
  arrange(member_casual, day_of_week)

# graphs and plots
all_data_clean %>%
  group_by(day_of_week, member_casual) %>%
  summarise(num_rides = n(), .groups = 'drop') %>%
  ggplot(aes(x = day_of_week, y = num_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Total Rides by Day", y = "Number of Rides")


all_data_clean %>%
  group_by(day_of_week, member_casual) %>%
  summarise(avg_duration = mean(ride_length), .groups = 'drop') %>%
  ggplot(aes(x = day_of_week, y = avg_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Avg Ride Duration by Day", y = "Minutes")

# extract the clean csv
write_csv(all_data_clean, "cyclistic_cleaned.csv")

getwd()

