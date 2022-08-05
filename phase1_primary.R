# Phase 1 Data
library(dplyr)
library(ggplot2)
library(tidyverse)
library(stringr)
library(multcompView)

#data from desktop
Sildata <- read.csv("/Users/jackhoward/Desktop/Switch Tracking - Silique_Data.csv", header = TRUE)

#tidying up to get group and replicate
Sildata <-
  Sildata %>%
  separate(Silique_ID, c("Group", "Replicate"), sep = "[S]")

Sildata$Replicate <- gsub("_", replacement = "", Sildata$Replicate)

Sildata <-
  Sildata %>%
  select("Group", "Replicate", "Length", "Present", "Bilateral", "present.length") %>%
  rename(Seed_Density = present.length) 

#filtering for only bilateral siliques 
Sildata <-
  Sildata %>%
  filter(Bilateral == "Y")


#filter for just double mutants
DM <-
  Sildata %>%
  filter(grepl("^D", Group))

#box and whisker of all the D12 flowering comparisons

DM %>%
  ggplot(aes(x = Group, y = Seed_Density)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)


#filter for just controls
CNTR <-
  Sildata %>%
  filter(grepl("^C", Group))

#box and whisker of all the D12 flowering comparisons

CNTR %>%
  ggplot(aes(x = Group, y = Seed_Density)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)


#filter for just msh1
MSH <-
  Sildata %>%
  filter(grepl("^M", Group))

#box and whisker of all the D12 flowering comparisons

MSH %>%
  ggplot(aes(x = Group, y = Seed_Density)) +
  geom_boxplot() +
  geom_jitter(width = 0.1)


#filter for just HDA6
HDA <-
  Sildata %>%
  filter(grepl("^H", Group))

#box and whisker of all the D12 flowering comparisons

HDA %>%
  ggplot(aes(x = Group, y = Seed_Density)) +
  geom_boxplot()+
  geom_jitter(width = 0.1)

