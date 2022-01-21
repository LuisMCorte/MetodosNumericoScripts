%Método de punto medio.
%       midpoint(f,x,h,xfinal,y0) llenar
%       [yout,yi] = midpoint(f,x,h,xfinal,y0)
%       f = función a tratar
%       x = inicio del intervalo
%       h = salto
%       n = final del intervalo
%       y0 = condicion inicial  
%
%   See also Metodo de Euler
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/10 11:00 $
%   Built-in function.

function [yout,yi] = midpoint(f,x,h,xfinal,y0)
  
  %Captura de errores
  if isnumeric(x) ~= 1
    msgID = '(x) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(h) ~= 1
    msgID = '(h) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif

  if isnumeric(xfinal) ~= 1
    msgID = '(xfinal) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif  
  
  if isnumeric(y0) ~= 1
    msgID = '(yo) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  %Variables
  y = y0;
  yout = y;                        %Columna de salida
  yi = y;                          %Vector de salida
  
  %Midpoint
  for i = x : h : xfinal - h
    s1 = f(i,y);                   %pendiente punto inicial 
    s2 = f(i+h/2, y+h*s1/2);       %nueva pendiente
    y = y + h*s2;                  %nuevo valor de y               
    yout = [yout; y];              
    yi =  [yi, y]; 
  endfor
endfunction
