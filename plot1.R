library(utils)

NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

totalPM25yr <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png")
plot(names(totalPM25yr), totalPM25yr, type="l", xlab = "Year", ylab = expression
     ("Total" ~ PM[2.5] ~"Emissions"), main = expression("US" ~ 
     PM[2.5] ~ "Emissions by Year"), col="Purple")
dev.off()



