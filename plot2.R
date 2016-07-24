NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510", ]
totalPM25yr <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png")
plot(names(totalPM25yr), totalPM25yr, type = "l", xlab="Year", 
ylab= expression("Total" ~ PM[2.5] ~ "Emissions"), 
main=expression("Baltimore" ~ PM[2.5] ~ "Emissions by Year"), 
col = "blue")
dev.off()    
