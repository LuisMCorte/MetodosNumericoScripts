clear;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 17/10/2021
% Descripcion: Emplear el metodo Regula Falsi para la solucion de
%ecuaciones no lineales.


% Problema 1:
%   
#{
El voltaje de un capacitor tiene una respuesta subamortiguada dada por la expresión 
                   Vc(t) = 210*sqrt(2)*e^(-2*t)*sin(sqrt(2)*t) 
Esto quiere decir que experimenta un pico de voltaje para luego oscilar entre cantidades 
mínimas, hasta ser aproximadamente igual a 0. Suponga que el pico de voltaje ocurre en
t = 1.41 s. Además, luego de 4 segundos de medición su magnitud es despreciable. ¿Cuándo llegó
por primera vez a cero?  
#}

f1 = @(t) 3*e^(-t) - 5*e^(-2*t); 
a = 0.20;
b = 0.80;
tol = 0.01;
iter = 100; 

try
  tic;
  [raiz,i,e] = RegulaFalsi(f1, a, b, tol, iter);
  toc;
  %**********************************+ Muestra de la tabla de datos +********************************
  fprintf('\nLa raiz es Xr = %5.4f, dado que f(Xr) = %5.4f. Procedimiento:\n',raiz,f1 (raiz))
  fprintf('iters %5.4f\n',i)
  fprintf('err %5.4f\n',e)
  #{
  fprintf('\nIteración\t a\t      b\t            Xnew\t      Error\n');
    
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
  catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
 #{ 
  %**********************************+ Plot de la funcion+*******************************************
  %Plot general
  h = figure(1);
  t = 0:0.1:10;
  plot(t,arrayfun(f1,t),'linewidth', 4);

  hold on;

    #Leyendas del grafico
    title('Problema 1');
    xlabel ("t");
    ylabel ("Vc(t)");

    %Grafica de a,b y la raiz
    plot([a,a],[80,-20], 'linewidth', 2, 'k');
    text(a - 0.1 , 5, 'a');

    plot([b,b],[80,-20], 'linewidth', 2, 'k');
    text(b + 0.1 , 5, 'b');

    plot([raiz,raiz],[80,-20], 'linewidth', 2, 'g');
    text(raiz + 0.1 , 5, 'raiz');

    %Grafica de los ejes y modificacion de bordes
    set(gca, 'xaxislocation','origin');
    set(gca, 'yaxislocation','origin');
    set(gca, "linewidth", 3, "fontsize", 10);
    set(gca, "box", "on");

  hold off;
  %***************************************************************************************************
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch


clear;
%-----------------------------------------------------------------------------------------------------

% Problema 2:
%   
#{
La funcion de Transferencia H(s) representa la ganancia de un sistema. Esta ganancia 
depende de la frecuencia s de entrada. Se define como la razón entre la magnitud de
salida y la de entrada. H(s) = Xout(s)/Xin(s). La siguiente funcion H(s) representa
la ganancia de corriente de un sistema. Calcule la frecuencia en la que la ganancia
es nula. Tome en cuenta que la ganancia era negativa en s = 0.7Hz y luego positiva en
3Hz 
              H(s) =   ((s)(s - 2)) / ((s^2 + 6*s + 10)*(s + 5))
#}
f1 = @(s) ((s)*(s - 2)) / ((s^2 + 6*s + 10)*(s + 5));

a = 0.7;
b = 3;
tol = 0.0001;
iter = 20;

try
  
  [data,raiz] = RegulaFalsi(f1, a, b, tol, iter);
  
  %**********************************+ Muestra de la tabla de datos +********************************
  fprintf('\nLa raiz es Xr = %5.4f, dado que f(Xr) = %5.4f. Procedimiento:\n',raiz,f1 (raiz))
  fprintf('\nIteración\t a\t      b\t            Xnew\t      Error\n');
    
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
  s = 0:0.1:10;
  plot(s,arrayfun(f1,s),'linewidth',4);

  hold on;

    #Leyendas del grafico
    title('Problema 2');
    xlabel ("s");
    ylabel ("H(s)");

    %Grafica de a,b y la raiz
    plot([a,a],[0.04,-0.02], 'linewidth', 2, 'k');
    text(a - 0.1 , 0.03, 'a');

    plot([b,b],[0.04,-0.02], 'linewidth', 2, 'k');  
    text(b + 0.1 , 0.03, 'b');

    plot([raiz,raiz],[0.04,-0.02], 'linewidth', 2, 'g');
    text(raiz + 0.1 , 0.03, 'raiz');


    %Grafica de los ejes y modificacion de bordes
    set(gca, 'xaxislocation','origin');
    set(gca, 'yaxislocation','origin');
    set(gca, "linewidth", 3, "fontsize", 10);
    set(gca, "box", "on");

  hold off;
  
  %**************************************************************************************************
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 
#}

