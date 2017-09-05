#!/usr/bin/Rscript --vanilla --slave
rm(list=ls())
gc()
library(data.table)
library(RODBC)
channl<-odbcDriverConnect('DRIVER=SQL Server;SERVER=rds52ifa6rl2r3w7z2z0o.sqlserver.rds.aliyuncs.com,3433;
                          DATABASE=secco_db;
                          UID=secco;
                          PWD=SECCO_ivocmn')
mydata <- sqlQuery(channl,'select * from s_historyData order by time desc')
gas <- data.table(mydata)
ts <- gas[,.SD[1],by=c('panId','shortId')]
tt <- ts[,c('panId','shortId','time','gasFlow')]  #最新信息

mydata <- sqlQuery(channl,'select * from s_historyData order by time desc')