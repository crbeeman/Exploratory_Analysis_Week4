
library(ggplot2)


NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510", ]
typePM25year <- aggregate(Emissions ~ year + type, baltimore, sum)


png("plot3.png") 
g <- ggplot(typePM25year, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions")) + ggtitle("Emissions in Baltimore 1999 to 2008")
print(g)
dev.off()