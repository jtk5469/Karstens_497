##### R Task


## Pick your favorite celebrity who has a Twitter account. 
#elon musk
?rtweet

## find the most recent tweet the celebrity liked
emlike <- get_favorites("elonmusk", n = 1)
View(emlike)
##Download their 500 most recent tweets. 
#Calculate which one got the most ``likes"

emtweet <- get_timeline("elonmusk", n = 500)
View(emtweet)

#
### Create a DFM from the text of these tweets
library(quanteda)
elondfm <- dfm(emtweet$text)

### After removing stopwords, what word did the celebrity tweet most often?
elondfm <- featnames(dfm(elondfm, select = stopwords("english")))
sentences <- scan(elondfm, "character")
elonfreq <- strsplit(sentences, " ")
words <- table(unlist(elonfreq))

cbind(names(words), as.integer(words))

#Elon musk tweeted the word "against" the most. 