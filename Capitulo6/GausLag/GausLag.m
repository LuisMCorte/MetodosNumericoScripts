%GausLag    Aproximaciones de una integral definida mediante el m�todo de
%           la cuadratura de Gauss-Laguerre con dos y tres puntos.
%   GausLag( FUNCION,intervalo,puntos )
%       [ I,e ] = Cuaga(funcion,intervalo,puntos)
%       I = aproximacion de la integral 
%       e = error por la integraci�n de dos puntos
%       funcion = la funci�n a tratar
%       intervalo = intervalo de integraci�n 
%       puntos = puntos para tratar la aproximaci�n 
%
%   See also Regla de Simpson, M�todo de trapecios, Gauss-Legendre,
%            Gauss-Chebyshev 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/5 14:37 $
%   Built-in function.
function[I,e] = GausLag(funcion,intervalo,puntos)

if ( puntos < 2 || puntos > 3 )
  msgID = 'GaussLag:Cantidad de puntos';
  msg = 'La  funci�n no responde a la cantidad de puntos ingresados';
  error(msgID,msg)
endif

%Desempaquetado de l�mites de integraci�n
if ( intervalo(1) != 0 || intervalo(2) != Inf )
  msgID = 'GausLag:L�mites de integraci�n incorrectos';
  msg = 'La cuadratura Gauss-Laguerre opera en integrales de 0 a Inf';
  error(msgID,msg)
endif

syms x;

%========================================================
%             Aplicaci�n de Gauss-Legendre 
%========================================================


if ( puntos == 2 )%Gauss-Laguerre en dos puntos

  %Argumentos de la funci�n
  p1 = 2 - sqrt(2);
  p2 = 2 + sqrt(2);
  
  %Calculo de la aproximaci�n
  I = 0.8536*funcion( p2 ) + 0.1464*funcion( p1 ) ;
  
  %Calculo del error
  D = diff(funcion(x),2); %Evaluar la funci�n con x simb�lica
  x = 0.5;%Darle un valor a x entre 0 e Inf
  e = 0.5 * eval(D);
   
else %Gauss-Laguerre en tres puntos

  %Argumentos de la funci�n
  p1 = 0.415774;
  p2 = 2.294280;
  p3 = 6.289945;
  
  %Calculo de la aproximaci�n
  I = 0.711093*funcion( p1 ) + 0.278517*funcion( p2 ) + 0.010389*funcion( p3 );
  
  %Calculo del error
  D = diff(funcion(x),4); %Evaluar la funci�n con x simb�lica
  x = 0.5;%Darle un valor a x entre 0 e Inf
  e = 0.1667 * eval(D);
endif

return
endfunction