%Gauss Chebyshev
%       chebyshev(f) llenar
%       [I] = chebyshev(f,n)
%       f = función a tratar
%       n = número de segmentos
%
%   See also Cuadratura de Gauss
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/02 16:00 $
%   Built-in function.

function [I] = chebyshev(f,n)
  
  %Captura de errores
  if isnumeric(n) ~= 1
    msgID = '(a) debe ser un valor númerico';
    msg = 'Númeron invalido';
    error(msgID,msg)
  endif
  
  %z_i = cos(((2i+1)*pi)/(2*n+2)
  
  if n == 1
  
    %Para n=1 
    a0 = f(-sqrt(2)/2);         %z0
    a1 = f(sqrt(2)/2);          %z1
    I = (pi/2)*(a0 + a1);      %aproximación
  
  elseif n == 2
    %Para n=2
    b0 = f(-sqrt(3)/2);         %z0
    b1 = f(0);                  %z1
    b2 = f(sqrt(3)/2);          %z2
    I = (pi/3)*(b0+b1+b2);     %aproximación
  
  elseif n == 3
    %Para n=3
    c0 = f(0.92387);            %z0
    c1 = f(0.38268);            %z1
    c2 = f(-0.382683);          %z2
    c3 = f(-0.923879);          %z3
    I =(pi/4)*(c0+c1+c2+c3);  %aproximacion
    
  else
    %Para n=4 
    d0 = f(0.951056);           %z0
    d1 = f(0.587785);           %z1
    d2 = f(0);                  %z2
    d3 = f(-0.587785);          %z3
    d4 = f(-0.951056);          %z4
    I =(pi/5)*(d0+d1+d2+d3+d4);   %aproximacion
    
  endif 
endfunction
    
    
  
   
  
  
  
  
  