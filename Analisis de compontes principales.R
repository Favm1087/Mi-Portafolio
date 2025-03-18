datos = read.csv2("C:/Users/fernando/Documents/nacidos_vivos_editada.csv", header= T, dec = ".")
base.D=datos[,c(3:4,10,17:18,22,27)]
base.D2=na.omit(base.D)


################## ETAPA 2  ##############################
# resumen estadistico
resumen=data.frame(promedio=apply(base.D2,2,mean),varianza=apply(base.D2,2, var),maximo=apply(base.D2,2,max),minimo=apply(base.D2,2,min));resumen


### ********grafico nacimiento por años ####

library(ggplot2)
library(scales)
library(tidyverse)
# nacidos por años
datos %>% count(AÑO)
datos_año=datos %>% count(AÑO) %>% mutate(prop=n/sum(n))

# grafico con ggplot
ggplot(datos_año,aes(AÑO,n))+
  geom_bar(stat = "identity",fill="steelblue")+
  geom_text(aes(label=comma((n))),
            vjust=-0.3)+
  labs(x="Años",y="Numero de nacimientos",title = "Numero de nacidos por años")


## *******grafico nacimientos por comuna********## 

# nacidos por comunas 

datos%>%count(COMUNA)
datos_comuna=datos %>% count(COMUNA) %>% mutate(prop=n/sum(n))

# grafico conggplot
ggplot(datos_comuna,aes(COMUNA,n))+
  geom_bar(stat = "identity",fill="chocolate3")+
  geom_text(aes(label=comma((n))),
            vjust=-0.3)+
  labs(x="COMUNA",y="Numero de nacimientos",title = "Numero de nacidos por comuna")+
  coord_flip()


## *******grafico nacimientos por tipo de parto ********## 


#proporciom nacidos por tipo de parto##

datos_parto=datos %>% count(TIPO.PARTO) %>% mutate(prop=n/sum(n))

barra_p=datos_parto%>%arrange(desc(prop))%>%mutate(TIPO.PARTO=
                                                     factor(TIPO.PARTO,level=TIPO.PARTO))%>%
  ggplot(aes(TIPO.PARTO,prop))+
  geom_bar(stat = "identity",fill="bisque4")


barra_p+
  geom_text(aes(label=percent((prop))),
            vjust=-0.3)+
  labs(x="Tipo de parto",y="Numero de nacimientos",title = "proporcion de numero de nacidos   por tipo de parto")+
  scale_y_continuous(label = percent )+theme_classic()


#### graficos de cajas 

edad_padre=base.D2$EDAD.PADRE
edad_madre=base.D2$EDAD.MADRE
edades=data.frame(edad_madre,edad_padre)


Conf2mas1 = matrix(c(1:3, 3), nrow=2, byrow=F)
layout(Conf2mas1)
layout.show(3)

boxplot(base.D2,col="red",main="grafico 4")
boxplot(edades,col=blues9,main="grafico 5")
boxplot(base.D2$NUMERO.HIJOS.NACIDOS.VIVOS,base.D2$NUMERO.EMBARAZOS,col="chocolate3",main="grafico 6")



############# ETAPA 3 ###########################


sapply(base.D2, var)

## obtenemos la matriz de correlaciones ##

library(corrplot)
corrplot.mixed(cor(base.D2),lower = "ellipse",upper = "number",order="hclust")


library(psych)
corr.test(base.D2)

## examinamos el determinante de la matriz ##

cor=cor(base.D2)
det(cor)


## *** test de normalidad de shapiro wilk ***##

Conf3x2 = matrix(c(1:6), nrow=2, byrow=TRUE)
layout(Conf3x2)
layout.show(6)
qqnorm(base.D2$PESO,main = "PESO")
qqnorm(base.D2$TALLA,main = "TALLA")
qqnorm(base.D2$GESTACION,main = "GESTACION")
qqnorm(base.D2$NUMERO.HIJOS.NACIDOS.VIVOS,main = "N.H.N.vivos")
qqnorm(base.D2$NUMERO.EMBARAZOS,main = "N.embarazos")
qqnorm(base.D2$EDAD.PADRE,main = "edad.padre")



## 3 *** test de esfericidad de bartlett***#

library(psych)
cortest.bartlett(base.D2)



############################ ETAPA 4 ################################

## tipo de ACP a utilizar  ##

library(FactoMineR)
acp1=PCA(base.D2,scale.unit = T,ncp = 7,graph = T)
acp2=PCA(base.D2,scale.unit = T,ncp = 7,graph = T,quanti.sup = c(4,5))


# numero de componentes a retener ##

library(factoextra)
get_eigenvalue(acp2)

fviz_eig(acp2)

## analisis de resultados ##

vari=get_pca_var(acp2)
vari$coord # peso de las dimensiones 

fviz_pca_var(acp2,col.var = "black",axes = c(1,2))

vari$cos2 # examinamos los cosenos cuadrados

fviz_pca_var(acp2,col.var ="cos2",gradient.cols=c("#00AFBB","#E7B800","#FC4E07"),repel = TRUE)

vari$cor


# contribuciones de las variables #
vari$contrib

fviz_pca_var(acp2,col.var ="contrib",gradient.cols=c("#00AFBB","#E7B800","#FC4E07"),repel = TRUE,axes = c(1,2))



# analisis de puntos individuos
ind=get_pca_ind(acp2)

fviz_pca_ind(acp2,col.ind ="cos2",gradient.cols=c("#00AFBB","#E7B800","#FC4E07"),repel = TRUE)
