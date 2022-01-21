%Sustitucion   Sistemas de ecuaciones Regresiva.
%      [x] = susttucion(C)
% C matriz [L b'] 
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/27 22:46 $
%   Built-in function.
function [x]=SustitucionR(C)
n=length(C)-1;  %longitud del vector independiente
n=length(C)-1;
m=n+1;
x(n)=C(n,m)/C(n,n);     %Primer valor de solución
for i=n-1:-1:1    %ciclo for para recorrer filas
  suma=C(i,m);
  for j=i+1:n   %ciclo for para recorrer columnas
   suma=suma-C(i,j)*x(j);   %Operaciones pertinentes
  end
   x(i)=suma/C(i,i);  %Hallamos la solucion con el vector independiente
end
