
## Exploratory Data Analysis - Project 2
## Reading RDS file might take few minutes
if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
} 

if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
        
}

## Plot 1 : To find "whether total emissions PM2.5 decreased in the United States 
# from 1999 to 2008? 


## Aggregate emissions by year. Since emission values are in millions diving it by 
## 100000 for easy readable y-axis plotting
emissionsTotal <- aggregate(NEI$Emissions/100000,by=list(year=NEI$year),FUN=sum,na.rm=TRUE)

png(file="plot1.png",width=640, height=480)

## decided to go for line graph to show trend
plot(emissionsTotal,type="o", xlab="years", ylab="Total PM2.5 Emissions(in '000000)", main="Aggregated Emissions level by Year")

## save the file
dev.off()


