% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 02/12/2021
% Descripcion: Emplear los splines cuadraticos 

% Problema 1:
%   
#{
Para calcular el flujo de electrones por un conductor a través del tiempo, se tiene que calcular  la integral de la corriente
a traves del tiempo, la fórmula que nos da el problema es 3x^3_6x^2 en un intervalo de tiempo de 0 a 5 segundos con 5 intervalos, 
asuma que la carga inicial es 0.
#}


%Datos:
%Funcion, Intervalos, y Error de Truncamiento
  f = @(x) x^3-6*x^2+11*x-6
  fe= -9;
  a = 1.3;
  b = 1.8;
  n=6;
try 
  [error,sum,x,y]=Metodo_Trapecio(f,fe,b,a,n);
  error
  fprintf('\nEl flujo aproximado es: %8.4f\n',sum); %Mostramos el resultado final
  
end_try_catch
 figure(1)
  hold on
  xlabel("Eje X")
  ylabel("Eje y")
  bar(x,y)
  title("método del trapecio")
  plot(x,y,"r", "LineWidth",3)
  hold off

fprintf('-------------------------------------------------------------------\n')
clear all
% Problema 2:
%   
#{
Queremos saber cuanta es la energia del circuito en un tiempo de 0s a 5s con 7 intervalos 
se nos da la ecuación de la potencia: 3x^3-6x^2.  
#}
%Datos:
%Funcion, Intervalos, y Error de Truncamiento
  f = @(x) 3*x^3-6*x^2
  fe= 33;
  a = 0;
  b = 5;
  n=7;
try
  [error,sum,x,y]=Metodo_Trapecio(f,fe,b,a,n);
  error
  fprintf('\nLa energia aproximada es: %8.4f\n',sum); %Mostramos el resultado final
end_try_catch
  figure(2)
  hold on
  xlabel("Eje X")
  ylabel("Eje y")
  bar(x,y)
  title("método del trapecio")
  plot(x,y,"r", "LineWidth",3)
  hold off


