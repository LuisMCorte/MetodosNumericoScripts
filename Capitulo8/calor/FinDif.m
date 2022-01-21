%FinDif      Emplea el método de diferencias finitas para resolver
%            ecuaciones diferenciales de segundo orden con dos condiciones
%            iniciales. La ecuacion debe presentarse en la forma:
%            a*y_i-1 + b*y_i + c*y_i+1 = g(x_i)
%   FinDif(XI,YI,XF,YF,F,H,COEFS)
%       [rango] = FinDif(xi,yi,xf,yf,f,h,coefs)
%       rango = valores del rango de la solucion aproximada 
%       xi,yi = Condicion inicial y(xi) = yi
%       xf,yf = Condicion inicial y(xf) = yf
%       f = funcion g(x) 
%       h = salto 
%       coefs = coeficientes de las aproximaciones de y [a,b,c]
%   See also Metodo de diferencias finitas aplicado a problemas 
%            especificos
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/22 23:06 $
%   Built-in function.
function[T,X] = FinDif(dx,L,tmax,a,b,c,dt,CFL)
if ( dx == 0 || dt == 0 )
  msgID = 'FinDif: dx';
  msg = 'El dx no puede ser igual a 0';
  error(msgID,msg)
endif
CFL = dt/(dx^2);
X = 0:dx:L % Vector X para definir los segmentos
Nt = ceil(tmax/dt)+1; #Valor utilizado para el tiempo 
Nx = length(X);
T = zeros(Nt,Nx); %Matriz donde se registran los resultados
T(1,:)= a; T(:,1)= b; T(:,end)=c; #Definimos los valores frontera
T(1,1)= (T(1,2)+T(2,1))/2; T(1,end) = (T(1,end -1)+T(2,end))/2; # Definimos los valores de las esquinas 
for f = 2:Nt % Doble bucle para recorrer la matriz
  for c =2 :Nx-1
    T(f,c)= T(f-1,c) + CFL*(T(f-1,c+1) -2*T(f-1,c)+T(f-1,c-1)); #Ecuacion de transferencia de calor aplicando diferencias finitas
  endfor
endfor

return
endfunction