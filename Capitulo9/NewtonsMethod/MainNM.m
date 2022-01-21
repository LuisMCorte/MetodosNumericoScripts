clear;clc;
pkg load symbolic;
warning('off','all');

syms x y;#Declarar a 'x' y 'y' como variables simbolicas

#====================================================
#                    Problema 1
#====================================================
#{
Optimizar la funcion 8*(x^2) - 4*x*y + 5*(y^2) mediante el metodo de Newton
Suponga que la funcion 8*(x^2) - 4*x*y + 5*(y^2) representa la energia que alimenta 
a un sistema. Esta energia en funcion de la resistencia interna del sistema
y del tiempo de alimentacion. Obtenga los valores de resistencia y tiempo
que minimizan la energia 
#}
f = 8*(x^2) - 4*x*y + 5*(y^2); #Definir la funcion a optimizar
initialPoint = [5 ; 2];        #Definir el punto inicial para la iteracion
tol = 0.001;                   #Definir el valor de tolerancia
maxiter = 10;                  #Definir la cantidad maxima de iteraciones

#Calculo de la optimizacion
[pmin,pminEvaluado] = NewtonM(f,initialPoint,tol,maxiter)
pminEvaluado = double(pminEvaluado * 1);

#Plot de la respuesta
figure(1)
[x,y]= meshgrid(-2:0.1:2);
s = 8.*(x.^2) - 4.*x.*y + 5.*(y.^2);
surf(x,y,s);

hold on
    [x,y] = meshgrid(-2:0.1:2);
    s = pminEvaluado + 0.*x + 0.*y;
    surf(x,y,s);
hold off;

clear;
syms x y;
#====================================================
#                    Ejercicio 2
#====================================================
#{
Optimizar la funcion x^2 + 2*(y^2) - 4*x - 2*x*y mediante el metodo de Newton
Suponga que la funcion 8*(x^2) - 4*x*y + 5*(y^2) representa la energia que alimenta 
a un sistema. Esta energia en funcion de la resistencia interna del sistema
y del tiempo de alimentacion. Obtenga los valores de resistencia y tiempo
que minimizan la energia 
#}
f = x^2 + 2*(y^2) - 4*x - 2*x*y; #Definir la funcion a optimizar
initialPoint = [1 ; 3];          #Definir el punto inicial para la iteracion
tol = 0.001;                     #Definir el valor de tolerancia
maxiter = 10;                    #Definir la cantidad maxima de iteraciones


[pmin,pminEvaluado] = NewtonM(f,initialPoint,tol,maxiter)
pminEvaluado = double(pminEvaluado * 1);

#Plot de la respuesta
figure(2)
[x,y]= meshgrid(-1:0.1:6);
s = x.^2 + 2.*(y.^2) - 4.*x - 2.*x.*y;
surf(x,y,s);

hold on;
    [x,y] = meshgrid(-1:0.1:6);
    s = pminEvaluado + 0.*x + 0.*y;
    surf(x,y,s);
hold off;