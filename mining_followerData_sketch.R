# R-script for extracting non-commercial accounts from follower data by searching for the use of 1st person pronouns in the user's account description.
# Author: Mario Ezekiel H. (@m_ezkiel)

library(twitteR); library(dplyr)

UChicagoLawApps_followerList <- read.csv("~/Documents/r_scripts/twitter_followerList Data/UChicagoLawApps_followerList.csv", stringsAsFactors=FALSE)

chiLaw <- tbl_df(UChicagoLawApps_followerList); rm(UChicagoLawApps_followerList)

summary(chiLaw)
order(chiLaw$statusesCount, decreasing = TRUE) -> statusIndex
chiLaw_byStatuses <- chiLaw[statusIndex, ]

summary(chiLaw_byStatuses$statusesCount) -> sC.summary
IQR(chiLaw_byStatuses$statusesCount) * 2.5 -> outIndex
View(chiLaw_byStatuses[which(chiLaw_byStatuses$statusesCount > outIndex), ])

# Find individual (non-commercial) accounts that follow Chicago Law
grep("I ", chiLaw$description) -> meIndex
chiLaw[meIndex, ] -> chiLaw.meIndex
View(chiLaw.meIndex[which(chiLaw.meIndex$protected == TRUE), ])
