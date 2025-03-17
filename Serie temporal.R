library(tseries)
library(forecast)
library(readxl)
library(RcmdrMisc)
library(ggplot2)
library(ggfortify)


#------------ #
# Maiz blanco #
#------------ #
yt=ts(base3$Maiz.blanco, start=2005,frequency=12)
yt

end(yt)
# Limpiar la serie
yt.c=tsclean(yt)



autoplot(yt)



                  #-------- Analisis preliminar de las series------#

#Analisis de Tendencia
#---------------------


numSummary(base3[,'Maiz.blanco'],groups=base3$Año,
           statistic=c('mean','sd','cv','quantiles'), quantiles=c(0.25,0.5,0.75))

ggplot(base3, aes(x=as.factor(Año), y=Maiz.blanco, fill=as.factor(Año))) + 
  geom_boxplot(alpha=0.7) +
  theme(legend.position="none")+xlab('Año')
  



#Analisis de Estacionalidad
#--------------------------------


ggseasonplot(yt.c, year.labels=TRUE, year.labels.left=TRUE) +
  ylab("Miles") +xlab("Mes")+
  ggtitle("Grafico de estacionalidad: Maiz blanco")


ggseasonplot(yt.c, polar=TRUE) +
  ylab("Miles") +
  ggtitle("Grafico polar de estacionalidad:  Precio del Maiz blanco")


ggsubseriesplot(yt) +
  ylab("Miles") +xlab("Mes")+
  ggtitle("Grafico de estacionalidad: precio del maiz blanco")


boxplot(yt.c~base3$Mes,xlab="Mes", ylab = "precio del maiz blanco" )





# PASO 1. Identificar el mejor modelo
#------------------------------------

s=numSummary(base3[,'Maiz.blanco'],groups=base3$Año,
             statistic=c('mean','sd','cv','quantiles'), quantiles=c(0.2,0.5,0.8))


plot(log(s$table[,5]),log(s$table[,6]-s$table[,4]),xlab = "Nivel",ylab = "Dispersion",col="red",main = "Grafico3: Nivel de la serie de tiempo")



# como la serie que esta en rojo se suaviza , entonces es mejor usar la serie limpia
plot(yt,main="Grafico 4 : Series de tiempo vs Años")
lines(yt.c,col="red")
legend(2005, 1, legend=c(" original ", "limpia"),
       col=c("blue", "red"), lty=1:2, cex=0.7)



# PASO 2. Dividir el conjunto de datos 90%-10%
#---------------------------------------------

n=length(yt.c)
n.test=19   # datos de prueba
n.training=n-n.test

training= ts(yt.c[1:n.training], start=c(2005,1), frequency = 12)
test=ts(yt.c[(n.training+1):n],  start=c(2019,7), frequency = 12)

# PASO 2. Dividir el conjunto de datos 80%-20%
#---------------------------------------------

n2=length(yt.c)
n.test2=39   # datos de prueba
n.training2=n2-n.test2

training2= ts(yt.c[1:n.training2], start=c(2005,1), frequency = 12)
test2=ts(yt.c[(n.training2+1):n],  start=c(2017,11), frequency = 12)




# PASO 3. Descomponer la serie 
#-----------------------------

desc.me=decompose(training,"additive")
desc.me2=decompose(training2,"additive")



autoplot(desc.me) + labs(title="Grafico 5:Descomposición aditiva de la serie de tiempo.",
                        subtitle = "Datos de entrenamiento y de prueba 90%-10%" ,
                        caption= "Creación propia")



autoplot(desc.me2) + labs(title="Grafico 6:Descomposición aditiva de la serie de tiempo.",
                         subtitle = "Datos de entrenamiento y de prueba 80%-20%" ,
                         caption= "Creación propia")



# PASO 4. Ajustar el modelo 
#-------------------------- 

# 90%-10%

St=desc.me$seasonal
Tt=desc.me$trend
Et=desc.me$random

yt.e=St+Tt+Et

y.real=desc.me$x


# 80%-20%

St2=desc.me2$seasonal
Tt2=desc.me2$trend
Et2=desc.me2$random

yt.e2=St2+Tt2+Et2

y.real2=desc.me2$x



par(mfrow = c(1, 2))

plot(y.real, ylab='precio de maiz blanco', col='blue', xlab='Años',
     sub = "Precio de maíz blanco vs Año, n.test=19",type="l")
lines(yt.e, col='red', lty=2) 
legend(2010, 0.4, legend=c("Real", "Estimado"),
       col=c("blue", "red"), lty=1:2, cex=0.7) 
title("Grafico 7:Grafico comparativo 
      n.test=19 y n.test=39") 


plot(y.real2, ylab='precio del maiz blanco', col='blue', xlab='Años',
     sub = "Precio de maíz blanco vs Año, n.test=39")
lines(yt.e2, col='red', lty=2)
legend(2010, 0.38, legend=c("Real", "Estimado"),
       col=c("blue", "red"), lty=1:2, cex=0.7)






# PASO 5. evaluacion del modelo 
#------------------------------ 

#P1: Ajustar la tendencia de la serie

model=lm(Maiz.blanco~t, data=base3[1:n.training,])
model

#--------------------------------------------------

model2=lm(Maiz.blanco~t, data=base3[1:n.training2,])
model2



#P2: Obtener los pronosticos de la tendencia para los datos de prueba

prueba=base3[(n.training+1):n,]
Tt.e=predict(model,prueba)

#------------------------------------------------
prueba2=base3[(n.training2+1):n,]
Tt.e2=predict(model2,prueba2)



#P3: Obtener los pronosticos de la variable de interes en los 
#    horizontes considerando el tipo de modelo

St.e=desc.me$figure

yt.est=c( Tt.e[1:6]+St.e[7:12],
          Tt.e[7:18]+St.e,
          Tt.e[19]+St.e[1] )


y.real=yt.c[(n.training+1):n]


accuracy(y.real,yt.est)


#----------------------------------------------

St.e2=desc.me2$figure

yt.est2=c(
  Tt.e2[1:2]+St.e2[11:12],
  Tt.e2[3:14]+St.e2,
  Tt.e2[15:26]+St.e2,
  Tt.e2[27:38]+St.e2,
  Tt.e2[39]+St.e2[1])

y.real2=yt.c[(n.training2+1):n]
accuracy(y.real2,yt.est2)



plot(y.real, ylab='precio del maiz', col='blue', type='l', xlab='Mes',ylim = c(0.4,0.8))
lines(yt.est, col='red', lty=2)
legend(1, 0.8, legend=c("Real", "Estimado"),
       col=c("blue", "red"), lty=1:2, cex=0.7)









