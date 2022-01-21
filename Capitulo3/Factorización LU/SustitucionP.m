%Sustitucion  en Sistemas de ecuaciones Progresiva.
%      [x] = susttucion(C)
% C matriz [L b'] 
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/27 22:46 $
%   Built-in function.
function [x] =SustitucionP(C)
n=length(C)-1;  %longitud del vector independiente
m=n+1;      
x(1)=C(1,m)/C(1,1);     %Primer valor de solución
for i=2:n    %ciclo for para recorrer filas
   suma=C(i,m);
   for j=1:i-1    %ciclo for para recorrer columnas
     suma=suma-C(i,j)*x(j);   %Operaciones pertinentes
   end
   x(i)=suma/C(i,i);  %Hallamos la solucion con el vector independiente
  end
end
