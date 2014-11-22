

library(quantmod)
library(plyr)


#1
#l_ply(symbols, function(sym) try(getSymbols(sym))) 

for(i in seq_along(symbols)) {
  getSymbols(symbols[i], from="2012-01-01")
}


summary(symbols)




symbols <- symbols[symbols %in% ls()]

#2
sym.list <- llply(symbols, get) 

#3


data <- xts()

data <- merge(data, index(AMXL.MX))

for(i in seq_along(symbols)) {
  symbol <- symbols[i]
  data <- merge(data, get(symbol)[,paste(symbol, "Adjusted", sep=".")])
}

data


summary(data)

write.csv(data, file="data2.csv")


xts()

rm(symbols)
rm(data)

stockSymbols("^MXX")$Symbol

#BORRAR LOS OBJETOS DE PRECIOS 
for(i in seq_along(symbols)) {
  rm(symbols[i])
}

symbols <- c("AC.MX",
"ALFAA.MX",
"ALPEKA.MX",
"ALSEA.MX",
"AMXL.MX",
"ASURB.MX",
"BIMBOA.MX",
"BOLSAA.MX",
"CEMEXCPO.MX",
"CHDRAUIB.MX",
"COMERCIUBC.MX",
"ELEKTRA.MX",
"FEMSAUBD.MX",
"GAPB.MX",
"GENTERA.MX",
"GFINBURO.MX",
"GFNORTEO.MX",
"GFREGIOO.MX",
"GMEXICOB.MX",
"GRUMAB.MX",
"GSANBORB-1.MX",
"ICA.MX",
"ICHB.MX",
"IENOVA.MX",
"KIMBERA.MX",
"KOFL.MX",
"LABB.MX",
"LIVEPOLC-1.MX",
"MEXCHEM.MX",
"OHLMEX.MX",
"PE&OLES.MX",
"PINFRA.MX",
"SANMEXB.MX",
"TLEVISACPO.MX",
"WALMEXV.MX")



