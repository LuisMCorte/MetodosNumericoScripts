clc;clear;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 22/12/2021
% Descripcion: Aproxime el resultado de las siguientes ecuaciones diferenciales
%mediante el metodo de diferencas finitas

% Problema 1:   
#{
Resolver la ecuacion de calor unidimensional  con las siguientes condiciones iniciales
            T(x,0) = 20°F 0<x<L
            T(0,t) = 100°F t>0
            T(1,t) = 100°F  t>0
            dx = 0.25
            L = 1ft
            tmax = 1h
            dt = 0.02
#}
dx = 0.25;
L=1;
tmax = 1;
#Valores frontera
a = 20;
b = 100;
c = 100;
dt = 0.02; #delta tiempo
try 
    
    #Calculo del rango
    [calor,X] = FinDif(dx,L,tmax,a,b,c,dt);
    calor
    figure(1)
    plot(X,calor), grid on
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch


% Problema 2:   
#{
Resolver la ecuacion de calor unidimensional  con las siguientes condiciones iniciales
            T(x,0) = 40°F 0<x<L
            T(0,t) = 100°F t>0
            T(1,t) = 100°F  t>0
            dx = 0.40
            L = 2ft
            tmax = 1h
            dt = 0.02
#}
dx = 0.40;
L=2;
tmax = 1;
#Valores frontera
a = 40;
b = 100;
c = 100;
dt = 0.02; #delta tiempo
try 
    
    #Calculo del rango
    [calor,X] = FinDif(dx,L,tmax,a,b,c,dt);
    calor
    figure(2)
    plot(X,calor), grid on
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch