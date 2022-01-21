clear;clc;
pkg load symbolic;
##f = ( x - 4 )^2 + ( y - 3 )^2 + 4*( z + 5 )^2; #Definir la funcion a optimizar


##syms x y;                      #Definir 'x' y 'y' simbolicas

#f = 8*(x^2) - 4*x*y + 5*(y^2); #Definir la funcion a optimizar
#initialPoint = [5 ; 2];          #Definir el punto inicial para la iteracion

#Testing gradient
##x = 5 ; y = 2;
##grad = eval( gradient(f) );
##

#Testing hess
##hess = inv( hessian(f) );

#Testing de la formula usada para generar un nuevo punto
##newPoint = initialPoint - hess*grad;
tx = ty = linspace (-8, 8, 41)';
[xx, yy] = meshgrid (tx, ty);
r = sqrt (xx .^ 2 + yy .^ 2) + eps;
tz = sin (r) ./ r;
mesh (tx, ty, tz);


syms x y z;#Declarar a 'x' y 'y' como variables simbolicas
#====================================================
#                    Ejercicio 1
#====================================================
f = sin( sqrt( x^2 + y^2 ) ) / sqrt( x^2 + y^2 ); #Definir la funcion a optimizar
initialPoint = [0 ; 0];    #Definir el punto inicial para la iteracion
tol = 0.001;                   #Definir el valor de tolerancia
maxiter = 10;                 #Definir la cantidad maxima de iteraciones

#Calculo de la optimizacion
pmin = NewtonM(f,initialPoint,tol,maxiter);
