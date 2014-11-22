

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


symbols <- c("ALFAA.MX","ALPEKA.MX","ALSEA.MX","AMXL.MX","AC.MX","BOLSAA.MX",
             "CEMEXCPO.MX","KOFL.MX","GENTERA.MX","LIVEPOLC-1.MX","ICA.MX",
             "FEMSAUBD.MX","LABB.MX","GRUMAB.MX","GAPB.MX","ASURB.MX","BIMBOA.MX",
             "CHDRAUIB.MX","ELEKTRA.MX","GFNORTEO.MX","GFINBURO.MX","SANMEXB.MX",
             "GMEXICOB.MX","TLEVISACPO.MX","ICHB.MX","PE&OLES.MX","KIMBERA.MX",
             "MEXCHEM.MX","OHLMEX.MX","WALMEXV.MX","COMERCIUBC.MX","GFREGIOO.MX",
             "GSANBORB-1.MX","IENOVA.MX","PINFRA.MX")

#BORRAR LOS OBJETOS DE PRECIOS 
for(i in seq_along(symbols)) {
  rm(symbols[i])
}



