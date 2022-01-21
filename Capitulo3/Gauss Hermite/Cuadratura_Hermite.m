%Cuaga    Aproximaciones de una integral definida mediante el método de
%         la cuadratura de Gauss Hermite con dos y tres puntos.
%   Cuaga( FUNCION,DP,TP )
%       [ idp,itp,edp,etp ] = Cuaga(funcion,dp,tp)
%       I = aproximacion de la integral 
%       e = error por la integración de dos puntos
%       funcion = la función a tratar
%       intervalo = intervalo de integración 
%       puntos = puntos para tratar la aproximación 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/1 11:09 $
%   Built-in function.
function[I,error] = Cuadratura_Hermite(funcion,puntos)

%========================================================
%             Desempaquetado de datos 
%========================================================

if ( puntos < 2 || puntos > 3 )
  msgID = 'Cuaga:Cantidad de puntos';
  msg = 'Usted ha ingresado una cantidad de puntos inaccesible';
  error(msgID,msg)
endif

%Desempaquetado de l?mites de integraci?n
n = puntos-1;
syms x;

%========================================================
%             Aplicación de Gauss-Hermite
%========================================================
if ( puntos == 1 )%Gauss Hermite en un punto

  %Argumentos de la función
  w1 = sqrt(pi)/2
  z1 = -(sqrt(2))/2
  z2 = -z1
  %Calculo de la aproximación
  I = w1*funcion(z1) + w1*funcion(z2)   
 %Calculo de error
 e = (sqrt(pi)*factorial(2))/(2^(2)*factorial(4));
 deriv = diff(funcion(x),4);
 x = 2;
 error = e*eval(deriv);
 
else %Gauss Hermite en tres puntos

  %Argumentos de la función
  w1 = sqrt(pi)/6;
  w2 = 2*(sqrt(pi)/3);
  z1=-sqrt(6)/2;
  z2=0;
  z3 = -z1;
  %Calculo de la aproximación
  I = w1 *funcion(z1) + w2*funcion(z2) + w1*funcion(z3);
  %Calculo del error
 e = (sqrt(pi)*factorial(3))/(2^(2)*factorial(6));
 deriv = diff(funcion(x),6);
 x = 2;
 error = e*eval(deriv)
endif
return
endfunction