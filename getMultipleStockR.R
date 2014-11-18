

library(quantmod)
library(plyr)
symbols <- c("AMXL.MX","GFNORTEO.MX", "ALFAA.MX")

getSymbols("ICA.MX")

#1
#l_ply(symbols, function(sym) try(getSymbols(sym))) 

for(i in seq_along(symbols)) {
  getSymbols(symbols[i], from="2009-01-01")
}


symbols <- symbols[symbols %in% ls()]

#2
sym.list <- llply(symbols, get) 

#3
data <- xts()
for(i in seq_along(symbols)) {
  symbol <- symbols[i]
  data <- merge(data, get(symbol)[,paste(symbol, "Adjusted", sep=".")])
}

data

data[2]

summary(data)

write.csv(data, file="data.csv")


xts()

rm(symbols)
rm(data)

stockSymbols("^MXX")$Symbol

