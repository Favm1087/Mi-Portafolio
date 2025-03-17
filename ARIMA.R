#*********************************************************#
#                       Librerias a usar                  #
#*********************************************************#

library(dynlm)
library(forecast)
library(tseries)
library(dplyr)
library(xts)
library(ggfortify)
library(TSA)
library(readxl)
library(RcmdrMisc)
library(ggplot2)
library(ggfortify)

#*********************************************#
# Paso 0. Lectura y preparación de los datos  #
#*********************************************#


vari=xts(Variacion$Variacion, order.by = as.Date(Variacion$Fecha))

start(vari)
end(vari)


#Limpiar la serie
vari.c=tsclean(vari)
plot(vari.c)


#************************************************#
#   Paso 1: Análisis exploratorio de datos       #
#************************************************#

#***** 1.1 Análisis preliminar de la serie *****#

plot(vari)
lines(vari.c,col="red")



ggseasonplot(vari.c, year.labels=TRUE, year.labels.left=TRUE) +
  ylab("Miles") +xlab("Mes")+
  ggtitle("Grafico de estacionalidad: variacion")

ggseasonplot(vari.c, polar=TRUE) +
  ylab("Miles") +
  ggtitle("Grafico polar de estacionalidad: Cantidad de pasajeros")




# PASO 1. Identificar el mejor modelo
#------------------------------------

s=numSummary(Variacion[,'Variacion'],groups=Variacion$Fecha,
             statistic=c('mean','sd','cv','quantiles'), quantiles=c(0.2,0.5,0.8))


plot(log(s$table[,5]),log(s$table[,6]-s$table[,4]),xlab = "Nivel",ylab = "Dispersion",col="red")



#***** 1.2 Verificación de condiciones iniciales *****#

# ACF
acf(vari.c, main='',type = "correlation")

# PACF
pacf(vari.c, main='', lag.max=20)

# Prueba de estacionariedad
adf.test (vari.c)
pp.test(vari.c)
kpss.test(vari.c)
acf(vari.c, main='',type = "correlation")

# Estabilizar varianza
vari.var=log(vari.c)
par(mfrow=c(2,1))
plot(vari.c,   main='Serie depurada')
plot(vari.var,   main ="Logaritmo natural de la Serie depurada")
par(mfrow=c(1,1))

adf.test (vari.var)

# Diferenciación

# Prueba para determinar el orden d de la diferenciación
d=ndiffs(vari.c)
d


#************************************************#
#   Paso 2: Estimación del modelo ARIMA          #
#************************************************#

#***** 2.1 Validación cruzada  *****#
# 90%-10%

n=length(vari.c)
p.training=0.99

n.training=round(n*p.training,0)
n.test=n-n.training

training=vari.c[1:n.training]
test=vari.c[(n.training+1):n]


#***** 2.2 Selección del orden del modelo y estimación *****#

#A) Selección manual
d1=ndiffs(training)
d1

UVR4=diff(training,differences = d1)

acf(UVR4[!is.na(UVR4),], main='',type = "correlation")
pacf(UVR4[!is.na(UVR4),], main='', lag.max=20)

#¿Cuáles son los modelos ARIMA candidatos?
orden=eacf(UVR4[!is.na(UVR4),], ar.max = 10, ma.max = 10)
orden$eacf

#ARIMA(1,1,2)
m1=arima(training,order=c(1,1,2))
m1

m2=arima(training,order=c(1,1,3))
m2


#A) Selección automática

arima1= auto.arima(training) 
arima1

#************************************************#
#   Paso 3: Diagnóstico del modelo ARIMA         #
#************************************************#
ei=arima1$residuals

plot(ei, col="Blue")

checkresiduals(arima1) 
ggtsdiag(arima1)

# Centrados en cero
t.test(ei) # ES necesario que mis errores sean ruido blanco 

# Prueba de Ljung-Box
m =log(7310)
Box.test(ei, lag=9, type='Ljung')
Box.test(ei, lag=9, type='Box-Pierce')

#Estacionariedd
adf.test(ei) # usamos esta ya que no hay mucha variacion no hay picos muy altos 
pp.test(ei)
kpss.test(ei)



#************************************************#
#   Paso 4: Pronóstico del modelo ARIMA          #
#************************************************#

pronost=forecast(arima1,h=n.test)
pronost
autoplot(pronost)

pronost$residuals
pronost$fitted
pronost$mean

accuracy(arima1)

accuracy(pronost$mean, test)




