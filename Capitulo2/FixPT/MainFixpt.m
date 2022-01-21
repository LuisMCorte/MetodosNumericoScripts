% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 13/10/2021
% Descripcion: Emplear el metodo del punto fijo para la solucion de
%ecuaciones no lineales.


% Problema 1:
%   
#{
El voltaje de un capacitor tiene una respuesta subamortiguada dada por la expresión 
                   Vc(t) = 210*sqrt(2)*e^(-2*x)*sin(sqrt(2)*x) 
Esto quiere decir que experimenta un pico de voltaje para luego oscilar entre cantidades 
mínimas, hasta ser aproximadamente igual a 0. Suponga que la magnitud del voltaje es 
despreciable luego de la primera oscilación (que comienza en t ~ 2.2s) ¿cuándo sucede esto?
Cálcule el resultado con una precisión de 0.001. 
#}

clear;

#Datos:
f1 = @(x) 20*e^(-4*x)*cos(50*x); 
g1 = @(x) 20*e^(-4*x)*cos(50*x) + x; 
Xinicial_1 = 0.050;
tol_1 = 0.01;
maxiter_1 = 100;

try
  %Evaluacion de los datos en el metodo
  [ raiz,i,e ] = PuntoFijo( g1, Xinicial_1, tol_1, maxiter_1);

  
  %**********************+ Generacion de la respuesta y tabla de iteraciones+************************
  fprintf('\nLa raiz es Xr = %5.4f, dado que f(Xr) = %5.4f. Procedimiento:\n',raiz,f1(raiz))
  fprintf('iters %5.4f\n',i)
  fprintf('err %5.4f\n',e)
  #{
  fprintf('\nIteración\t Xo\t      Xnew\t      Error\n');

  [n,m] = size(data);
  for i = 1:n%Impresión del número de fila. El número de cada fila representa cada iteración
    
      fprintf('%5.d\t',i);#Impresión del numero de iteración como si tomar 5 espacios de caracteres
    
      for j = 1:m
        #La primera, segunda y tercera columna de cada fila representa Xa, Xb y el error. Limitación de los valores a 4 decimales
        fprintf('%10.4f\t',data(i,j)); 
      endfor
    
      fprintf('\n');#Generación de un nuevo renglón
  endfor
  %**************************************************************************************************
  #}
  #{
  %**********************+ Plot de la funcion+************************
  h = figure(1);
  x = 0:0.1:10;#Dominio para graficar la funcion
  plot (x, arrayfun(f1,x), 'linewidth', 2);
  title('Problema 1')

  hold on;
  plot([raiz,raiz], [80,-20],'k', 'linewidth', 2);
  text (raiz  , 5, "Raiz");

  plot([Xinicial_1,Xinicial_1], [80,-20],'g-', 'linewidth',2);
  text(Xinicial_1 + 0.001 , 5, "X inicial");

  legend ("Vc(t)");
  xlabel ("t");
  ylabel ("Vc(t)");


  set(gca, "linewidth", 3, "fontsize", 10);

  set(gca, "xaxislocation", "origin", "xlim", [0 10]);

  set(gca, "yaxislocation", "origin", "ylim", [f1(0) f1(10)]);

  set(gca, "box", "on");

  hold off;
  #}
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch
%********************************************************************************************

#{
%--------------------------------------------------------------------------------------------
% Problema 2:
%   
#{
La funcion de Transferencia H(s) representa la ganancia de un sistema. Esta ganancia 
depende de la frecuencia s de entrada. Se define como la razón entre la magnitud de
salida y la de entrada. H(s) = Xout(s)/Xin(s). La siguiente funcion H(s) representa
la ganancia de corriente de un sistema. Calcule la frecuencia en la que la ganancia
es nula.
              H(s) =   ((s)(s - 2)) / ((s^2 + 6*s + 10)*(s + 5))
#}
clear;

#Datos:
f1 = @(x) ( (x)*(x - 2) ) / ( (x^2 + 6*x + 10)*(x + 5) ); 
g1 = @(x) ( (x)*(x - 2) ) / ( (x^2 + 6*x + 10)*(x + 5) ) + x;
Xinicial_1 = 3;
tol_1 = 0.001;
maxiter_1 = 150;

try
  %Evaluacion de los datos en el metodo
  [ data,raiz ] = PuntoFijo( g1, Xinicial_1, tol_1, maxiter_1);


  %**********************+ Generacion de la respuesta y tabla de iteraciones+************************
  fprintf('\nLa raiz es Xr = %5.4f, dado que f(Xr) = %5.4f. Procedimiento:\n',raiz,f1 (raiz))
  fprintf('\nIteración\t Xo\t      Xnew\t      Error\n');
    
  [n,m] = size(data);
  for i = 1:n%Impresión del número de fila. El número de cada fila representa cada iteración
    
      fprintf('%5.d\t',i);#Impresión del numero de iteración como si tomar 5 espacios de caracteres
    
      for j = 1:m
        #La primera, segunda y tercera columna de cada fila representa Xa, Xb y el error. Limitación de los valores a 4 decimales
        fprintf('%10.4f\t',data(i,j)); 
      endfor
    
      fprintf('\n');#Generación de un nuevo renglón
  endfor
  
  %**************************************************************************************************

  %**********************************+ Plot de la funcion+*******************************************
  h = figure(2);
  x = 0:0.1:50;#Dominio para graficar la funcion
  plot (x, arrayfun(f1,x), 'linewidth', 2);
  title('Problema 2')

  hold on;
  plot([raiz,raiz], [0.04,-0.04],'k:');
  text (raiz  , 5, "Raiz");

  plot([Xinicial_1,Xinicial_1], [0.04,-0.04],'g-');
  text(Xinicial_1 + 0.001 , 5, "X inicial");

  legend ("H(s)");
  xlabel ("s");
  ylabel ("H(s)");


  set(gca, "linewidth", 3, "fontsize", 10);

  set(gca, "xaxislocation", "origin", "xlim", [0 50]);

  #set(gca, "yaxislocation", "origin", "ylim", [f1(0) f1(10)]);

  set(gca, "box", "on");

  hold off;

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
%********************************************************************************************
#}


