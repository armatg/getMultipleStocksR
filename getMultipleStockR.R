

library(quantmod)
library(plyr)
symbols <- c("AMXL.MX","GFNORTEO.MX")

getSymbols("AMXL.MX")
#1
l_ply(symbols, function(sym) try(getSymbols(sym, auto.assign=FALSE))) 
symbols <- symbols[symbols %in% ls()]

#2
sym.list <- llply(symbols, get) 

#3
data <- xts()
for(i in seq_along(symbols)) {
  symbol <- symbols[i]
  data <- merge(data, get(symbol)[,paste(symbol, "Close", sep=".")])
}

data
xts()

rm(symbols)
rm(data)

stockSymbols("^MXX")$Symbol


