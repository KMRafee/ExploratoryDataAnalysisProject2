
## Exploratory Data Analysis - Project 2
## Reading RDS file might take few minutes
library(ggplot2)

if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
        
} 
if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
        
}

## Plot 5 : To compare whether Emissions from motor vehicle sources in Baltimore City
## to that with emissions from motor vehicle sources in Los Angeles County, 
## California (fips == "06037"). 


subsetNEI <- NEI[NEI$fips=="24510",]


## Aggregate emissions by year. 
emissionsTotal <- aggregate(subsetNEI$Emissions,by=list(year=subsetNEI$year,fips=subsetNEI$fips, type=subsetNEI$type),FUN=sum,na.rm=TRUE)

png(file="plot5.png", width=1040, height=640)

gg <- ggplot(emissionsTotal,aes(x=year,y=x),as.table=T)
gg <- gg + geom_line(aes(color=fips))
gg <- gg + facet_wrap(~type,nrow=2,ncol=2,scales="free_y")
gg <- gg + theme(legend.position="none") ## scale_colour_discrete(name="City", breaks=c("24510"), labels=c("Baltimore"))
gg <- gg +labs(x="Year")
gg <- gg +labs(y="PM2.5 Emissions")
gg <- gg +labs(title = "Emissions from motor vehicle sources - Baltimore City")

print(gg)

## save the file
dev.off()