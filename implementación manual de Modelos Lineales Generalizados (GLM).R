# ejemplo con regresion Poisson

#---------usando la identica---------------------#

y<-c(2,3,6,7,8,9,10,12,15)
x<-c(-1,-1,0,0,0,0,1,1,1)

plot(x,y,pch=16)

#B<-matrix(c(7,5))  # valores iniciales
B<-coef(lm(y~x))
B=c(7,5)
X<-cbind(rep(1,length(x)),x)

control<-1
while(control>0.001){
  Bant<-B
  #X%*%B
  W<-diag(1/as.vector(X%*%B))
  J<-t(X)%*%W%*%X
  z<-as.matrix(y)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  print(B)
  control<-max(abs(B-Bant))
}

Jinv<-solve(J)

# intervalos 
c(B[2]-1.96*sqrt(Jinv[2,2]),B[2]+1.96*sqrt(Jinv[2,2]))



# para probar

a=summary(glm(y~x,family = poisson(link="identity")));a


# otra forma obtener los intervalos 

ee=1.0891667 # std,error del anova
Za2=qnorm(0.05/2,lower.tail = FALSE)
li= 4.935301-Za2*ee
ls= 4.935301+Za2*ee
c(li,ls)


#------- usando el enlace logaritmico--------------------#

y<-c(2,3,6,7,8,9,10,12,15)
x<-c(-1,-1,0,0,0,0,1,1,1)

plot(x,y,pch=16)

#B<-matrix(c(7,5))  # valores iniciales
B<-coef(lm(y~x))
B=c(7,5)
X<-cbind(rep(1,length(x)),x)



mui=function(etai,mi){
  exp(etai) 
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,m)
  Bant<-B
  #X%*%B
  W=diag(as.vector(mu))
  J<-t(X)%*%W%*%X
  z=eta+((y/exp(eta))-1)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}


# para probar

a=summary(glm(y~x,family = poisson(link="log")));a


# otra forma obtener los intervalos 

ee=0.1787 # std,error del anova
Za2=qnorm(0.05/2,lower.tail = FALSE)
li= 0.6698-Za2*ee
ls= 0.6698+Za2*ee
c(li,ls)


#-----------poisson con raiz de mu------------------------------------------------

B<-coef(lm(y~x))
X<-cbind(rep(1,length(x)),x)

mui=function(etai,mi){
  (etai)^2  
}

control<-1
niter=0
while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta)
  Bant<-B
  W<-diag(4,length(x))
  J<-t(X)%*%W%*%X
  z=eta+(y-mu)*(1/(2*eta))
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(z)
} 

#con la funcion glm para verificar 
modp=glm(y~x,family=poisson(link = "sqrt"))
summary(modp)



#-------  EXPONENCIAL--------------#

y=c(65, 156, 100, 134, 16, 108, 121, 4, 39, 143, 56, 26, 22, 1, 1, 5, 65) 
x=c(3.36, 2.88, 3.63, 3.41, 3.78, 4.02, 4.00, 4.23, 3.73, 3.85, 3.97, 4.51, 4.54, 5.00, 5.00, 4.72, 5.00)

plot(x,y)
abline(lm(x~y),col='red')
plot(x,log(y))
abline(lm(x~log(y)),col='red')

B<-matrix(coef(lm(log(y)~x)),ncol=1)
B
X<-cbind(rep(1,length(x)),x);X


eta=X%*%B
Bant<-B
#X%*%B
W=diag(1,length(x))
J<-t(X)%*%W%*%X
z=eta+y/exp(eta)-1
#t(X)%*%W%*%z
B<-solve(J)%*%t(X)%*%W%*%z
( control<-max(abs(B-Bant)) )
print(B)

# usando while 

B<-matrix(coef(lm(log(y)~x)),ncol=1)
B
X<-cbind(rep(1,length(x)),x);X
control<-1
niter=0
while(control>0.001){
  eta=X%*%B
  Bant<-B
  #X%*%B
  W=diag(1,length(x))
  J<-t(X)%*%W%*%X
  z=eta+y/exp(eta)-1
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
  cat("Itera",niter,'\n')
  niter=niter+1
}


mexp=glm(y~x,family=Gamma(link = "log"))
summary(mexp,dispersion = 1) 







# BINOMIAL

# logistica

dosis=c(10.2,  7.7,  5.1,  3.8,  2.6,  0.0)
m=c(50, 49, 46, 48, 50, 49)
y=c(44, 42, 24, 16,  6,  0)

B<-matrix(coef(lm(I(y/m)~dosis)),ncol=1)
B
X<-cbind(rep(1,length(dosis)),dosis);X

mui=function(etai,mi){
  mi*exp(etai)/(1+exp(etai))  
}

eta=X%*%B
mu=mui(eta,m)
Bant<-B
#X%*%B
W=diag( as.vector(mu*(m-mu)/m) )
J<-t(X)%*%W%*%X
z=eta+(y-mu)*(m/(mu*(m-mu)))
#t(X)%*%W%*%z
B<-solve(J)%*%t(X)%*%W%*%z
( control<-max(abs(B-Bant)) )
print(B)

# con while
B<-matrix(coef(lm(I(y/m)~dosis)),ncol=1)
B
X<-cbind(rep(1,length(dosis)),dosis);X
control<-1
niter=0
while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,m)
  Bant<-B
  #X%*%B
  W=diag( as.vector(mu*(m-mu)/m) )
  J<-t(X)%*%W%*%X
  z=eta+(y-mu)*(m/(mu*(m-mu)))
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(W)
}

# matriz de varianzas y covarianzas 
vc=solve(J)
# errores estándar estimados de los B 
eeB=sqrt(diag(vc));eeB
# estadísticos t
B/eeB 

# valores ajustados 
par(mar = c(3, 3, 0.5, 0.5), oma = rep.int(0, 4), mgp = c(2, 1, 0))
yg=m*ilogit(X%*%B)
plot(y~dosis,ylim=c(0,50))
points(dosis,yg,col='red')


mod1=glm(cbind(y,m-y)~dosis,family=binomial(link="logit"))
summary(mod1)



# probit

dosis=c(10.2,  7.7,  5.1,  3.8,  2.6,  0.0)
m=c(50, 49, 46, 48, 50, 49)
y=c(44, 42, 24, 16,  6,  0)


# con while
B<-matrix(coef(lm(I(y/m)~dosis)),ncol=1)
B
X<-cbind(rep(1,length(dosis)),dosis);X


mui=function(etai,mi){
  mi*pnorm(etai)
}

control<-1
niter=0



while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,m)
  Bant<-B
  #X%*%B
  W=diag(as.vector((m*dnorm(eta)^2)/(pnorm(eta)*(1-pnorm(eta)))))
  J<-t(X)%*%W%*%X
  z=eta+(y-mu)*(1/(m*dnorm(eta)))
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}



mod1=glm(cbind(y,m-y)~dosis,family=binomial(link="probit"))
summary(mod1)




#----Binomial con complemento  log log--------- 

mui=function(etai,mi){
  mi*((-exp(-exp(etai)))+1)  
}


B=c(-1.369,0.149)
X<-cbind(rep(1,length(dosis)),dosis);X
control<-1
niter=0
while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,m)
  Bant<-B
  #X%*%B
  W=diag( as.vector(((-m+mu)*log(1-(mu/m)))^2/((mu*(m-mu))/m)) )
  J<-t(X)%*%W%*%X
  z=eta+(y-mu)*(-1/((m-mu)*log(1-(mu/m))))
  #t(X)%%W%%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
} 


mod3=glm(cbind(y,m-y)~dosis,family=binomial(link="cloglog"))
summary(mod3)






# Normal

# ---con la identidad---#

diam=c(9.26,8.12,9.01,8.57,7.48)
peso=c(0.414,0.25,0.34,0.35,0.37)
s=var(peso)

summary(glm(diam ~ peso, family = gaussian(link="identity")))


#B<-matrix(c(7,5))  # valores iniciales
B<-coef(lm(diam~peso))

X<-cbind(rep(1,length(peso)),peso)

mui=function(etai,s){
  etai
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,s)
  Bant<-B
  #X%*%B
  W=diag(1/s,length(peso))
  J<-t(X)%*%W%*%X
  z=as.matrix(diam)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}



#--- con la logaritmica---#

B<-coef(lm(diam~peso))

X<-cbind(rep(1,length(peso)),peso)

mui=function(etai,s){
  exp(etai) 
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,s)
  Bant<-B
  #X%*%B
  W=diag(as.vector(mu^2/s))
  J<-t(X)%*%W%*%X
  z=eta+((diam/exp(eta))-1)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}



summary(glm(diam ~ peso, family = gaussian(link="log")))




#gamma

y=c(65, 156, 100, 134) 
x=c(3.36, 2.88, 3.63, 3.41)


# logaritmica

B<-coef(lm(y~x))

X<-cbind(rep(1,length(x)),x)

mui=function(etai){
  exp(etai)
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta)
  Bant<-B
  #X%*%B
  W=diag(1,length(x))
  J<-t(X)%*%W%*%X
  z=eta+((y/exp(eta))-1)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}


summary(glm(y~x,family=Gamma(link = "log")))





# reciproca

B<-coef(lm(1/y~x))
B
X<-cbind(rep(1,length(x)),x);X

mui=function(etai){
  1/etai
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta)
  Bant<-B
  #X%*%B
  W=diag(as.vector(mu^2))
  J<-t(X)%*%W%*%X
  z=eta+(y-(1/eta))*(-eta^2)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}


summary(glm(y~x,family=Gamma(link = "inverse")))




# Id�ntica
# La identica de la gamma es la misma de la exponencial ya que se asume alfa 1

B<-coef(lm(y~x))
B
X<-cbind(rep(1,length(x)),x);X

mui=function(etai){
  etai
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta)
  Bant<-B
  #X%*%B
  W=diag(as.vector(1/mu^2))
  J<-t(X)%*%W%*%X
  z=as.matrix(y)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}





#Normal inversa

y=c(9.26,8.12,9.01,8.57)
x=c(0.414,0.25,0.34,0.35)
s=var(x)

B<-coef(lm(1/y~x))
B
X<-cbind(rep(1,length(x)),x);X

mui=function(etai,s){
  etai
}

control<-1
niter=0

while(control>0.001){
  cat("Iteración ",niter,'\n') 
  niter=niter+1
  eta=X%*%B
  mu=mui(eta,s)
  Bant<-B
  #X%*%B
  W=diag(as.vector(1/s))
  J<-t(X)%*%W%*%X
  z=eta+(yi-)*(2*mu)
  #t(X)%*%W%*%z
  B<-solve(J)%*%t(X)%*%W%*%z
  ( control<-max(abs(B-Bant)) )
  print(B)
}


summary(glm(y~x,family=inverse.gaussian(link = "1/mu^2")))







###############################otro punto 
y=scan()
10.3	7.7	9.9	5.4	9.2	8.5
10.9	9.2	9.4	12.3	8.5	8.5

n<-length(y)
theta<-6.58 ;theta # valor inicial
control<-1
itera<-0
while(control>0.001){
  thetam1<-theta
  itera<-itera+1
  U<-n-2*sum((exp(-(y-theta)))/(1+exp(-(y-theta))))
  Up<--2*sum((exp(-(y-theta)))/((1+exp(-(y-theta)))^2)) 
  
  theta<-theta-U/Up # Newton Raphson
  control<-abs(theta-thetam1)
  cat("Iteracion ",itera,"\n")
  cat("theta= ",thetam1,"\n")
  cat("U*10^6= ",U*10^6,"\n")
  cat("Up*10^6= ",Up*10^6,"\n")
  cat("U/Up= ",U/Up,"\n")
  if(itera==1){tabla42=data.frame(theta=thetam1,U106=U*10^6,Up106=Up*10^6)
  }else{tabla42=rbind(tabla42,c(thetam1,U*10^6,Up*10^6))}
  cat("\n")
}

#Manual
n<-length(y)
theta<-6.58 ;theta # valor inicial
control<-1
U<-n-2*sum((exp(-(y-theta)))/(1+exp(-(y-theta))))
Up<--2*sum((exp(-(y-theta)))/((1+exp(-(y-theta)))^2)) 

thetan<-theta-U/Up;thetan # Newton Raphson
control<-(abs(theta-thetan))>0.001;control
theta=thetan;theta
theta=9.186343


#### otro punto_____________________- 
n<-length(y)
theta<-1/mean(y);theta # valor inicial
control<-1
itera<-0
while(control>0.001){
  thetam1<-theta
  itera<-itera+1
  U<-(n/((1-theta)*log(1-theta)))+(1/theta)*sum(y)
  Up<- ((n*(log(1-theta)-1))/(((1-theta)*log(1-theta))^2))-(1/theta^2)*sum(y)
  
  
  theta<-theta-U/Up # Newton Raphson
  control<-abs(theta-thetam1)
  cat("Iteracion ",itera,"\n")
  cat("theta= ",thetam1,"\n")
  cat("U*10^6= ",U*10^6,"\n")
  cat("Up*10^6= ",Up*10^6,"\n")
  cat("U/Up= ",U/Up,"\n")
  if(itera==1){tabla42=data.frame(theta=thetam1,U106=U*10^6,Up106=Up*10^6)
  }else{tabla42=rbind(tabla42,c(thetam1,U*10^6,Up*10^6))}
  cat("\n")
}

#############################
n<-length(y)
theta<-1/mean(y);theta  # valor inicial
control<-1
U<-(n/((1-theta)*log(1-theta)))+(1/theta)*sum(y)
Up<- ((n*(log(1-theta)-1))/(((1-theta)*log(1-theta))^2))-(1/theta^2)*sum(y)

thetan<-theta-U/Up;thetan # Newton Raphson
control<-(abs(theta-thetan))>0.001;control
theta=thetan;theta
theta=0.253158


