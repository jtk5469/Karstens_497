# Descriptive practice


#1. Write two sentences. Save each as a seperate object in R. 

require(quanteda)

sent1 <- ("What is this thing")
sent2 <- ("I'm not sure")

#2. Combine them into a corpus
sentcorp <- Corpus(sent1,sent2)

#3. Make this corpus into a dfm with all pre-processing options at their defaults.
sentdfm <- data.frame(sentcorp)

#4. Now save a second dfm, this time with stopwords removed.
sentdfm2 <- data.frame(sentdfm, remove = stopwords("english"))

#5. Calculate the TTR for each of these dfms (use textstat_lexdiv). Which is higher?
textstat_lexdiv(sentdfm2)
textstat_lexdiv(sentdfm)
#6. Calculate the Manhattan distance between the two sentences you've constructed (by hand!)


