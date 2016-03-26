
## Exploratory Data Analysis - Project 2
## Reading RDS file might take few minutes
if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
} 
if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
        
}

## Plot 2 : To find "whether total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008

subsetNEI <- NEI[NEI$fips=="24510",]

## Aggregate emissions by year. 
emissionsTotal <- aggregate(subsetNEI$Emissions,by=list(year=subsetNEI$year),FUN=sum,na.rm=TRUE)

png(file="plot2.png", width=640, height=480)

## decided to go for line graph to show trend
plot(emissionsTotal,type="o", col="red", xlab="Year", ylab="Total PM2.5 Emissions", main="Aggregated Emissions level in Baltimore City by Year")

## save the file
dev.off()
