# Ivy tweets linguistic analysis sketch
# 

library(dplyr)

# import data, then...

chicago <- read.csv("~/Documents/Data/Ivy League tweets/chicagoBoothTweets.csv")
sipa <- read.csv("~/Documents/Data/Ivy League tweets/columbiaSIPATweets.csv")
darden <- read.csv("~/Documents/Data/Ivy League tweets/dardenMBATweets.csv")
kellogg <- read.csv("~/Documents/Data/Ivy League tweets/kelloggTweets.csv")
stanford <- read.csv("~/Documents/Data/Ivy League tweets/stanfordTweets.csv")
wharton <- read.csv("~/Documents/Data/Ivy League tweets/whartonTweets.csv")

# Without chicago b/c they muddy up the mix with their automation
tweets <- rbind(chicago, sipa, darden, kellogg, stanford, wharton)

# Explore common tweet beginnings from academic b-school accounts
firstWords <- sort(table(tweets$V1))

# Subset based common beginnings
# Repeated tweets are likely indicators of the use of an automated tweet scheduler, or pre-approved database of sm messages.
how_tweets <- tweets[which(tweets$V1 == "How"), ]
why_tweets <- tweets[which(tweets$V1 == "Why"), ]
the_tweets <- tweets[which(tweets$V1 == "The"), ]
what_tweets <- tweets[which(tweets$V1 == "What"), ]
is_tweets <- tweets[which(tweets$V1 == "Is"), ]
we_re_tweets <- tweets[which(tweets$V1 == "We're"), ]
can_tweets <- tweets[which(tweets$V1 == "Can"), ]
when_tweets <- tweets[which(tweets$V1 == "When"), ]
a_tweets <- tweets[which(tweets$V1 == "A"), ]
have_tweets <- tweets[which(tweets$V1 == "Have"), ]
