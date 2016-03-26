
## Exploratory Data Analysis - Project 2
## Reading RDS file might take few minutes
library(ggplot2)

if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
} 
if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
        
}

## Plot 3 : To find "Whether four types of sources indicated by the type 
## (point, nonpoint, onroad, nonroad) variable, which of these four sources 
## have seen decreases in emissions from 1999-2008 for Baltimore City

subsetNEI <- NEI[NEI$fips=="24510",]

## Aggregate emissions by year and type
emissionsTotal <- aggregate(subsetNEI$Emissions,by=list(year=subsetNEI$year,type=subsetNEI$type),FUN=sum,na.rm=TRUE)

png("plot3.png", width=640, height=480)
g <- ggplot(emissionsTotal, aes(year, x, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression("Total PM[2.5] Emissions")) +
        ggtitle("Total Emissions in Baltimore City by Type from 1999 to 2008")
print(g)

dev.off()
