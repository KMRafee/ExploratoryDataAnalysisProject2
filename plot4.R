
## Exploratory Data Analysis - Project 2
## Reading RDS file might take few minutes
## library(ggplot2)

if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
} 
if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
        
} 
if (!exists("NEISCC")) {
        NEISCC <- merge(NEI,SCC, by="SCC")
}

## Plot 4 : To find "Whether across the United States, how the emissions 
## from coal combustion-related sources changed from 1999-2008?

# fetch all records with Short.Name (SCC) Coal
coalRecords  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)

subsetNEISCC <- NEISCC[coalRecords, ]


## Aggregate emissions by year. Since emission values are in millions diving it by 
emissionsTotal <- aggregate(subsetNEISCC$Emissions,by=list(year=subsetNEISCC$year), FUN=sum,na.rm=TRUE)

png("plot4.png", width=640, height=480)


## decided to go for line graph to show trend
plot(emissionsTotal,type="o", col="red", xlab="Year", ylab="Total PM2.5 Emissions", main="Emissions from coal combustion-related sources")

## save the file
dev.off()