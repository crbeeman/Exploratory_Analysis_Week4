#call ggplot2 library

library(ggplot2)

# bring in the 2 RDS files 

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#subset for Baltimore and LA

NEIBaltimore <- subset(NEI, fips == "24510" & type=="ON-ROAD")
NEILosAngeles <- subset(NEI, fips == "06037" & type=="ON-ROAD")

# roll up each city by year

Baltimore <- aggregate(NEIBaltimore[c("Emissions")], list(type = NEIBaltimore$type, year = NEIBaltimore$year, fips = NEIBaltimore$fips), sum)

LosAngeles <- aggregate(NEILosAngeles[c("Emissions")], list(type = NEILosAngeles$type, year = NEILosAngeles$year, fips = NEILosAngeles$fips), sum)

#combine the 2

Combined <- rbind(Baltimore, LosAngeles)

#create plot6

png("plot6.png")
g <- qplot(year, Emissions, data = Combined, color = fips, geom= "line", ylim = c(-100, 5500)) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions")) + ggtitle(expression("On Road" ~ PM[2.5] ~ "Emissions in Baltimore 24510 and Los Angeles 06037"))
print(g)
dev.off()  