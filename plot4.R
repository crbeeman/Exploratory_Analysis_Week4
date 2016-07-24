#call ggplot2 library

library(ggplot2)

# bring in the 2 RDS files 

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

SCCcoal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC, ]

#make plot4 

png("plot4.png")
g <- ggplot(NEIcoal, aes(x = factor(year), y = Emissions, fill =type))
g <- g + geom_bar(stat= "identity", width = .5) + xlab("Year") +ylab(expression("Coal" ~ PM[2.5] ~ "Emissions")) + ggtitle(expression("Total Coal" ~ PM[2.5] ~ "Emissions from 1999 - 2008"))
print(g)
dev.off()