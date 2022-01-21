%Regresion lineal ajuste de curvas de relaciones no lineales 
%       reglineal(x,y) llenar
%       [x_1,y_1,y_00,epsilon] = Reg_noLineal(x,y)
%       x = vector de datos
%       y = vector de datos
%
%   See also regresion lineal
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 20:00 $
%   Built-in function.
function [x_1,y_1,y_0,epsilon] = Reg_noLineal(x,y)
  
  n= length (x); %medida vector de datos
  m = length(y);
  %Captura de errores
  if n ~= m
    msgID = 'Reg_noLineal : Datos incorrectos';
    msg = 'Los datos fueron mal ingresados';
    error(msgID,msg)
  endif
  
  x_1=[];
  y_1=[];
  y_0 = [];
  epsilon = 0;
  for i=1:n
    if x(i) <= 0
      msgID = 'Reg_noLineal : Datos incorrectos';
      msg = 'Existe un 0 en el vector x';
      error(msgID,msg)
    endif
    if y(i) <= 0
      msgID = 'Reg_noLineal : Datos incorrectos';
      msg = 'Existe un 0 en el vector y';
      error(msgID,msg)
    endif
    %Transformacion de los vectores en sus logaritmos
    x_1=[x_1,log10(x(i))];
    y_1=[y_1,log10(y(i))];
  endfor
  [log_a,pendiente] = reglineal(x_1,y_1) %Ajuste por regresión lineal
   a_transf =10^ log_a %Transformamos de vuelta el ajuste
  for i=1:n
    y_0 = [y_0,(a_transf*(x(i)^(pendiente)))]; %Nuevos valores del vector y para el ajuste de curva
  endfor
  %Criterio de regresión error valor absoluto
  for i=1:n
    epsilon = (epsilon + (y(i)-y_0(i)))^2;
  endfor
endfunction
