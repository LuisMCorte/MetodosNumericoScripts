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
function[rango] = FinDif(xi,yi,xf,yf,f,p,h,coefs)

if ( xi == xf )
  msgID = 'FinDif:Limites de integracion';
  msg = 'Los valores de los limites no coinciden';
  error(msgID,msg)
endif

if ( p <= 0 || h <= 0  )
  msgID = 'FinDif:Error en las particiones';
  msg = 'Una particion de cero o salto h de cero, no es aceptado';
  error(msgID,msg)
endif

if ( length(coefs) != 3 )
  msgID = 'FinDif:Cantidad de coeficientes';
  msg = 'Se necesitan de 3 coeficientes';
  error(msgID,msg)
endif

n = p - 1; #Variable usada para conocer la cantidad de y's a calcular
#Definicion del dominio
x = xi:h:xf;
A = zeros(n + 2);


#Aniadir los valores iniciales a A y b
A(1,1) = A(n+2,n+2) = 1;
b(1) = yi;
b(n+2) = yf;

#Iterar las variables y_i...
for i = 2:n+1
    A(i,i-1:i+1) = coefs;
    b(i) = f( x(i) );
endfor
disp(A);
disp(b');
#Calculo del rango
rango = inv(A) * b';

return
endfunction