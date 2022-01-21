%Finite split differences: Forward, Backward, Centered
%       
%       f = función a tratar
%       h = salto
%       x = punto de evaluación
%       valuer = valor real (valor analitico)       

%
%   See also Diff: Forward, Backward, Centered
%   Segunda Derivada   
%
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/15 7:30 $
%   Built-in function.

function [f_f1,f_f2,e_f,f_b1,f_b2,e_b,f_c1,f_c2,e_c] = second_diff(f,h,x,valuer)
  
  %Captura de errores
  if h == NaN
    msgID = 'Diferenciacion : Division para cero';
    msg = 'División para cero';
    error(msgID,msg)
  endif

%Forward_diff
  %Segunda derivada
  f_f1 = (f(x+(2*h)) - 2*f(x+h) + f(x)) / h^2;                        %O(h)
  f_f2 = (2*f(x) - 5*f(x+h) + 4*f(x+(2*h)) - f(x+(3*h))) / h^2;       %O(h^2)
  
  %Error
  e_f = abs((valuer - f_f2) / valuer) * 100;                      

  
%Backward_diff
  %Segunda derivada
  f_b1 = (f(x) - 2*f(x-h) + f(x-(2*h))) / h^2;                        %O(h)
  f_b2 =(2*f(x) - 5*f(x-h) + 4*f(x-(2*h)) - f(x-(3*h))) / h^2;        %O(h^2)
  
  %Error
  e_b = abs((valuer - f_b2)/valuer)*100;

  
%Centered_diff
  %Segunda derivada
  f_c1 = (f(x+h) - 2*f(x) + f(x-h))/h^2;                              %O(h)
  f_c2 = (-f(x+(2*h)) + 16*f(x+h) - 30*f(x) + 16*f(x-h) - f(x-(2*h))) / (12*h^2);
                                                                      %O(h^2)
  %Error
  e_c = abs((valuer - f_c2)/valuer) * 100;                       
  
endfunction