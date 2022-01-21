%Regla de Simpson 1/3.
%       simpson_onethird(a,b,f,n) llenar
%       [y] = simpson_onethird(a,b,f,n)
%       a = intervalo inferior
%       b = intervalo superior
%       f = función a tratar
%       n = número de sub intervalos
%
%   See also Metodo del trapecio
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/18 16:00 $
%   Built-in function.

function [I] = simpson_onethird(a,b,f,n)
  
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
  
  %Método de Simpson 1/3
  h = abs(b-a)/n;          %Salto(paso)
  s = a:h:b;               %Vector de Segmentos
  
  %Variables
  i = 2;
  j = 3;
  so = 0;
  se = 0;
  
  %suma de terminos impares
  while(i <= n)
    so = so + f(s(i));    
    i = i+2;
  endwhile
  sumodd = 4*so;
  
  %suma de termino pares
  while j <= (n-1)
    se = se + f(s(j));
    j = j+2;
  endwhile
  sumeven = 2*se;
  
  %Formula regla de Simpson 1/3
  I = (b-a)*((f(a)+ sumodd + sumeven + f(b)) /(3*n));
  
endfunction
   
