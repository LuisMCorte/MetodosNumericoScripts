%Regla de Simpson 3/8.
%       simpson_threeeigths(a,b,f,n) llenar
%       [I] = simpson_threeeigths(a,b,f,n)
%       a = intervalo inferior
%       b = intervalo superior
%       f = función a tratar
%       n = número de sub intervalos
%
%   See also Simposon 1/3
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/18 16:00 $
%   Built-in function.

function [I] = simpson_threeeighths(a,b,f,n)
  
  %Captura de errores
  if isnumeric(a) ~= 1
    msgID = '(a) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(b) ~= 1
    msgID = '(b) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  if isnumeric(n) ~= 1
    msgID = '(n) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  %Método de Simpson 3/8
  n = n*3;
  h = abs(b-a)/n;
  s = a:h:b;               %Vector de Segmentos
  i = 0;  
  %Sumas
  
  sum1 = 0;
  sum2 = 0;
  sum3 = 0;
  
  while (i<n)
    sum1 = sum1 + f(s(i+1));
    sum2 = sum2 + f(s(i+2));
    sum3 = sum3 + f(s(i+3));
    i = i+3;
  endwhile
  
  %Formula regla de Simpson 3/8
  I = ((3*h)/8) * (f(a) + 3*sum1 + 3*sum2 + 2*sum3 + f(b));

endfunction

  