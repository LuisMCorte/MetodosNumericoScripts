%Regresion lineal ajuste de curvas 
%       reglineal(x,y) llenar
%       [a0,a1,y0,epsilon] = reglineal(x,y)
%       x = vector de datos
%       y = vector de datos
%
%   See also regresion lineal
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/08 16:00 $
%   Built-in function.

function [a0,a1,y0,epsilon] = reglineal(x,y)
   
  a = length(x);             %Número de datos ingresados
  a0 = length(y);
  
  %Captura de errores
  if a ~= a0
    msgID = 'Regresión Lineal : Datos incorrectos';
    msg = 'Los datos fueron mal ingresados';
    error(msgID,msg)
  endif
  
  %Variables
  sumx =0; 
  sumy =0;
  sumxy =0;
  sumx2 =0;
  y0 = [];
  coef_re = 0;
  epsilon = 0;
  
  %Ciclo iterativo para el calculo de sumatorias
  for i=1:a 
    sumx = sumx + x(i)  ;                            %Sumatoria del vector x
    sumy = sumy + y(i)  ;                            %Sumatoria del vector y
    sumxy = sumxy + (x(i)*y(i));                     %Suma total del producto
                                                     %de las sumatorias de los
                                                     %vectores x, y
    sumx2 = sumx2 + (x(i)^2);                        %Sumatoria del vector x^2
  endfor
  
  %Calculo de resultados
  a1 =((a*sumxy)-(sumx*sumy))/((a*sumx2)-(sumx)^2);  %Calculamos de la pendiente
  
  %Captura de errores (Division para cero)
  if ((a*sumx2)-(sumx)^2) == 0
    msgID = 'Regresión Lineal : División para cero';
    msg = 'Error: Los datos fueron mal ingresados';                              
    error(msgID,msg)
  endif
  
  a0 = (sumy/a) - (a1 * (sumx/a));                   %Calculamos la interseccion 
                                                     %con el eje y 
  
  %Valores de ajuste lineal
  for i=1:a
    y0 = [y0,(x(i)*a1)+a0];
  endfor
  
  %Criterio de regresión error valor absoluto
  for i=1:a
    epsilon = (abs(epsilon + (y(i)-y0(i))))^2;
  endfor
  
end