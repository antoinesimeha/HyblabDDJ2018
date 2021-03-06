data = read.csv('../raw/CAPEBPaysDelaLoire_2014-2017.csv', header=TRUE, sep=";", encoding ="UTF-8")
attach(data)
data$Code.postal

getAttYear <- function(y, l_atr){
  l_atr = c(l_atr, "X..Date")
  return(subset(data, X..Date == y, select = l_atr))
}

data$X..Date = as.numeric(substring(data$X..Date, 7, 10))
annee = unique(data$X..Date)
annee
table(data$D�veloppement.durable)

DD = table(subset(data, data$X..Date == 2016,select = c("intercommunalite.2017_EPCI", "D�veloppement.durable")))
colnames(DD)[1] = "Pas de r�ponse"
DD
write.csv(file="D�veloppement_durable2016.csv",x=DD,quote = FALSE,fileEncoding ="UTF-8")
data$Inter
data$March�s.publics

MP = table(subset(data, data$X..Date == 2017,select = c("intercommunalite.2017_EPCI","March�s.publics")))
colnames(MP)[1] = "Pas de r�ponse"
MP
write.csv(file="March�s_publics2017.csv",x=MP, quote = FALSE,fileEncoding ="UTF-8")

data$Zone.intervention
ZI = aggregate( Zone.intervention ~ intercommunalite.2017_EPCI, getAttYear(2017, c("intercommunalite.2017_EPCI", "Zone.intervention")), mean)
ZI[,1] = as.numeric(ZI[,1])
ZI[,2] = as.numeric(ZI[,2])
zi = matrix(nrow = nrow(ZI), ncol=2)
zi[,1] = as.numeric(ZI[,1])
zi[,2] = as.numeric(ZI[,2])
colnames(zi) = c("Epci", "Zone intervention moyenne")
zi
write.csv(file="Zone_intervention2017.csv",x=ZI,row.names=FALSE, quote = FALSE,fileEncoding ="UTF-8")

AC = table(subset(data, data$X..Date == 2017,select = c("intercommunalite.2017_EPCI","Activit�")))
AC
write.csv(file="Activit�2017.csv",x=AC,quote = FALSE,fileEncoding ="UTF-8")

data$intercommunalite.2017_EPCI

contrats = aggregate( cbind(CDD,CDI,Apprentis,Int�rimaires) ~ intercommunalite.2017_EPCI + X..Date,subset(data,select = c("intercommunalite.2017_EPCI", "X..Date","CDD", "CDI")), FUN=sum)
write.csv(file="Contrats_2014-2017.csv",x=contrats,row.names=FALSE, quote = FALSE,fileEncoding ="UTF-8")

data$CA.r�alis�

AC = table(subset(data,select = c("intercommunalite.2017_EPCI","X..Date","CA.r�alis�")))
AC

write.csv(file="CA_2014-2017.csv",x=AC, quote = FALSE,fileEncoding ="UTF-8")
