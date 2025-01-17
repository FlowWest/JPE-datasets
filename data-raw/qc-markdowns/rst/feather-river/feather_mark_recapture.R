# install.packages("RODBC")
library(RODBC)
library(tidyverse)
library(lubridate)

# Set up connection with CAMP access database 
feather_camp <- odbcConnectAccess2007("../../../projects/JPE/CAMP Feather River/CAMP_RST_29Oct2018/Data/CAMP.mdb")

# Pull in relevant data 
CatchRaw <- sqlFetch(feather_camp, "CatchRaw") 
TrapVisit <- sqlFetch(feather_camp, "TrapVisit") %>% glimpse
Release <- sqlFetch(feather_camp, "Release")
ReleaseFish <- sqlFetch(feather_camp, "ReleaseFish") %>% glimpse
fish_origin_lu <- sqlFetch(feather_camp, "luFishOrigin") %>% glimpse
# select relevant column
selected_trap_visit <- TrapVisit %>% 
  select(trapVisitID, visitTime) %>% 
  glimpse 

selected_catch <- CatchRaw %>% 
  select(catchRawID, trapVisitID, taxonID, finalRunID, n, releaseID, forkLength) %>% glimpse

# Look at releases per day 
Release %>% 
  filter(year(releaseTime) > 1970) %>% 
  group_by(releasePurposeID, date = as_date(releaseTime)) %>% 
  summarise(trials_per_day = n()) %>%
  pivot_wider(names_from = releasePurposeID, values_from = trials_per_day) %>% 
  filter(year(date) == 2020)

Release %>% view

selected_released_fish <- ReleaseFish %>%
  group_by(releaseID) %>%
  summarise(median_fork_length_released = median(forkLength, na.rm = T)) %>%
  glimpse

unique(selected_released_fish$median_fork_length_released)

selected_release <- Release %>% 
  full_join(selected_released_fish, by = c("releaseID" = "releaseID")) %>%
  left_join(fish_origin_lu, by = c("markedFishOriginID" = "fishOriginID")) %>%
  filter(releasePurposeID == 1) %>% 
  select(releaseID, releaseSiteID, nReleased, releaseTime, median_fork_length_released, fishOrigin) %>% 
  mutate(release_date = as_date(releaseTime),
         release_time = hms::as_hms(releaseTime),
         fish_origin = tolower(fishOrigin)) %>% 
  select(-releaseTime, -fishOrigin) %>% glimpse

# Check catch ID 
catch_trap_id <- CatchRaw$trapVisitID %>% unique() %>% sort()
trap_trap_id <- TrapVisit$trapVisitID %>% unique() %>% sort()

length(catch_trap_id)
length(trap_trap_id)

# Combine all tables 
catch_with_date <- selected_catch %>% 
  left_join(selected_trap_visit, by = c("trapVisitID" = "trapVisitID")) %>% 
  mutate(recaptured_date = as_date(visitTime)) %>% 
  filter(releaseID != 0 & releaseID != 255) %>% 
  group_by(releaseID, recaptured_date) %>% 
  summarise(number_recaptured = sum(n, na.rm = T),
            median_fork_length_recaptured = median(forkLength, na.rm = T)) %>% 
  full_join(selected_release, by = c("releaseID" = "releaseID")) %>% 
  mutate(efficiency = number_recaptured/nReleased) %>% 
  glimpse()

# catch_with_date$release_time %>% unique()
unique(selected_release$median_fork_length_recaptured)
unique(catch_with_date$median_fork_length_recaptured)

# Visualize data 
catch_with_date %>% 
  ggplot(aes(x = efficiency, color = as.character(year(recaptured_date)))) + 
  geom_density()

catch_with_date %>% 
  filter(year(release_date) == 2020) %>% 
  group_by(release_date) %>% 
  summarise(daily_trials = n()) %>% 
  filter(daily_trials > 1)

catch_with_date %>% 
  group_by(year = year(release_date)) %>% 
  summarise(trials_per_year = n()) %>% 
  ggplot(aes(x = as.character(year), y = trials_per_year)) +
  geom_col()

catch_with_date %>% 
  ggplot(aes(x = month(release_date), y = year(release_date), size = efficiency)) +
  geom_point()

# Save data 
# write_rds(catch_with_date, "data/rst/feather_mark_recapture_data.rds")
# 
# write_csv(catch_with_date, "data/rst/feather_mark_recapture.csv")

f <- function(input, output) write_csv(input, file = output)

gcs_upload(catch_with_date,
           object_function = f,
           type = "csv",
           name = "rst/feather-river/data/feather_mark_recapture_data.csv")