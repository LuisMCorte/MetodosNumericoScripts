clear;clc;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 04/01/2022
% Descripcion: Optimize las siguientes funciones mediante 
%la busqueda de la seccion dorada

%Problema 1
#{
Un sistema eléctrico ha estado recibiendo energía continuamente. Mediante optimización,
encuentre el momento t en el que la energía susminitrada fue mínima en los 5 primeros 
segundos. La función que modela la transferencia de energía es f = x^3 + 5*(x^2) + 4*x + 6
#}

intervalo = [0,5];               #Intervalo para buscar el minimo
tol = 0.001;                      #Tolerancia del metodo
maxiter = 100;                    #Cantidad maxima de iteraciones
f = @(x) x^2*cos(x); #Funcion a optimizar
x = intervalo(1):0.1:intervalo(2);

try
    
    #Calculo del minimo/maximo
    [data,xm,fm] = goldenSec(intervalo,tol,maxiter,f);
    disp(data)
    
    #Plot de resultados
    figure(1);
    plot( x, arrayfun(f,x),'k','linewidth',1.1 );
    
    hold on;
        plot(xm,fm,'r+','linewidth',2);
        xlabel('t');
        ylabel('J');
        legend('Funcion','P minimo')
    hold off;
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch       

fprintf('\n');
%Problema 2
#{
Un sistema eléctrico ha estado recibiendo energía continuamente. Mediante optimización,
encuentre el momento t en el que la energía susminitrada fue mínima en los 2 primeros 
segundos. La función que modela la transferencia de energía es f = x^3 + 5*(x^2) + 4*x + 6
#}

intervalo = [0,2];               #Intervalo para buscar el minimo
tol = 0.001;                      #Tolerancia del metodo
maxiter = 100;                    #Cantidad maxima de iteraciones
f = @(x) x^2 -3*x + 1; #Funcion a optimizar
x = intervalo(1):0.1:intervalo(2);

try
    
    #Calculo del minimo/maximo
    [data,xm,fm] = goldenSec(intervalo,tol,maxiter,f);
    disp(data)
    
    #Plot de resultados
    figure(2);
    plot( x, arrayfun(f,x),'k','linewidth',1.1 );
    
    hold on;
        plot(xm,fm,'r+','linewidth',2);
        xlabel('t')
        ylabel('J')
        legend('Funcion','P minimo')
    hold off;
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch       