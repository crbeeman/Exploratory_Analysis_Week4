#call ggplot2 library

library(ggplot2)

# bring in the 2 RDS files 

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#create On Road vehicle in Baltimore subset

baltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

YearlyTotal <- aggregate(Emissions ~ year, baltimore, sum)

# make plot5 graph 

png("plot5.png")
g <- ggplot(YearlyTotal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions")) +
  ggtitle("Emissions from On Road vehicles in Baltimore from 1999 to 2008")
print(g)
dev.off()

