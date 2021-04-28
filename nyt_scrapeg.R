
library(jsonlite)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)


##code adapted from Heather Geiger

setwd("C:/Users/Jack Karstens/Documents/PLSC 497")


NYTIMES_KEY <- ("PRBP9pLaQoJsErAvkJh6fSNaH2eCy9vA")

term <- "facebook"
begin_date <- "20200101"
end_date <- "20200401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2020 <- vector("list",length=5)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame() 
  pages_2020[[i+1]] <- nytSearch 
  Sys.sleep(10) #I was getting errors more often when I waited only 1 second between calls. 5 seconds seems to work better.
}
facebook_2020_articles <- rbind_pages(pages_2020)
summary(facebook_2020_articles)


term <- "facebook"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=5)

for(i in 0:5){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
facebook_2021_articles <- rbind_pages(pages_2021)





#####in-class practice: 


### save the results of two different queries from the date range jan 1 2021 - APril 1 2021
save(facebook_2020_articles, file = "nyt1.Rdata")
save(facebook_2021_articles, file = "nyt2.Rdata")

### calculate the proportion of the headlines from each search term assigned to a given section name
mean(facebook_2020_articles)


## create a combined dfm with the text of all of the lead paragraphs
leaddfm <- data.frame(facebook_2021_articles, facebook_2020_articles)

## calculate the average Flesch Reading Ease score (hint: use code form descriptive_2.R) for the lead paragraphs from each search term. Which is higher?
readability(leaddfm, order.by.readability = TRUE)
