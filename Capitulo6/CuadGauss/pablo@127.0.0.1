%Cuaga    Aproximaciones de una integral definida mediante el método de
%         la cuadratura de Gauss con dos y tres puntos.
%   Cuaga( FUNCION,DP,TP )
%       [ idp,itp,edp,etp ] = Cuaga(funcion,dp,tp)
%       I = aproximacion de la integral 
%       e = error por la integración de dos puntos
%       funcion = la función a tratar
%       intervalo = intervalo de integración 
%       puntos = puntos para tratar la aproximación 
%
%   See also Regla de Simpson, Método de trapecios 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/1 11:09 $
%   Built-in function.
function[I,e] = Cuaga(funcion,intervalo,puntos)

%========================================================
%             Desempaquetado de datos 
%========================================================

if ( puntos < 2 || puntos > 3 )
  msgID = 'Cuaga:Cantidad de puntos';
  msg = 'Usted ha ingresado una cantidad de puntos inaccesible';
  error(msgID,msg)
endif

%Desempaquetado de límites de integración
li = intervalo(1);
ls = intervalo(2);
syms x;

%========================================================
%             Aplicación de Gauss-Legendre 
%========================================================

%Calculo de los coeficientes para el remplazo de variable x = C1 + C2u
C1 = (ls + li)/2;
C2 = (ls - li)/2;


if ( puntos == 2 )%Gauss Legendre en dos puntos

  %Argumentos de la función
  p1 = 1/sqrt(3);
  p2 = -p1;
  
  %Calculo de la aproximación
  I = C2 * ( funcion( C1 + C2*(p1) ) + funcion( C1 + C2*(p2) ) );
  
  %Calculo del error
  D = diff(funcion(C1 + C2*x),4); %Evaluar la función con x simbólica
  x = 0.5;%Darle un valor a x
  e = 7.4074e-03 * eval(D);
   
else %Gauss Legendre en tres puntos

  %Argumentos de la función
  p1 = -0.774596669;
  p2 = 0.0;
  p3 = -p1;
  
  %Calculo de la aproximación
  I = C2 * ( 0.5555556*funcion( C1 + C2*(p1) ) + 0.8888889*funcion( C1 + C2*(p2) ) + 0.5555556*funcion( C1 + C2*(p3) ) );
  
  %Calculo del error
  D = diff(funcion(C1 + C2*x),8); %Evaluar la función con x simbólica
  x = 0.9;%Darle un valor a x
  e = 6.3492e-05 * eval(D); 
endif

return
endfunction