#read in the big balacera file (roughly 90mb)
balacera <- read.csv(file="~/Desktop/ccs/balacera/bigBalacera.csv", as.is=T, head=T)

#helper function to simplify head(rev(sort(table))) 
rst <- function(data){
	rev(sort(table(data)))
}

hrst <- function(data){
	head(rev(sort(table(data))))
}

#frequency table of top 'balacera' tweet creation times
hrst(balacera$created_at_seconds)

#histogram of creation times
hist(balacera$created_at_seconds, breaks=1000, xlab="Time of Creation", main="Histogram of 'Balacera' Tweet Creation Times")

h <- hist(balacera$created_at_seconds, breaks=1000, xlab="Time of Creation", main="Histogram of 'Balacera' Tweet Creation Times")

plot(diff(h$counts), type="l")

##################### not the right way to do it #####################
#tweets per second
tps <- rst(balacera$created_at_seconds)

#make the frequency into a data frame
tps.df <- as.data.frame(tps)

#all the tweets that are over two tweets per second
over.two.tps <- tps[unlist(tps.df) > 2, ]

##################### the right way to do it #####################

avg.tps <- mean(table(tps))

#freq table of creation times
ct <- table(balacera$created_at_seconds)

#all the times when tweets/sec is greater than the average
gta.tps <- as.data.frame(ct)[unlist(ct) > avg.tps,]

##################################################################


ct <- table(balacera$created_at_seconds)
ones <- as.data.frame(ct)[unlist(ct) == 1,] 

25850/29013
[1] 0.8909799