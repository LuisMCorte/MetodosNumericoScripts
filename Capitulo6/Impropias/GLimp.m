%GLimp       Aproxima una integral impropia mediante la formula de 
%            Gauss-Legendre y el teorema 22.33. Los límites permitidos
%            son -Inf a -A, A o +Inf
%   integ_imp(FUNCION ,ESCAL ,INTERVALO)
%       [I,e] = integ_imp(funcion ,escal ,intervalo)
%       I = aproximacion de la integral 
%       e = error por la integración de dos puntos
%       funcion = la función a tratar
%       intervalo = intervalo de integración 
%
%   See also Regla de Simpson, Método de trapecios, Gauss-Legendre,
%            Gauss-Chebyshev 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/8 23:06 $
%   Built-in function.
function[I,e] = GLimp(funcion,intervalo)

if ( intervalo(1) >= intervalo(2) )
    msgID = 'GLimp:El límite inferior es mayor al superior';
    msg = 'Límites inválidos';
    error(msgID,msg)
endif

li = intervalo(1);
ls = intervalo(2);
syms x;

%Calculo de los coeficientes para el remplazo de variable x = C1 + C2u
C1 = (ls + li)/2;
C2 = (ls - li)/2;

%Argumentos de la función
p1 = C1 + C2*(-0.774596669);
p2 = C1 + C2*(0.0);
p3 = C1 + C2*(0.774596669);

%Calcul de la aproximacion
I = C2 * ( 0.5555556*(1/(p1)^2)*funcion( 1/p1 ) + 0.8888889*(1/(p2)^2)*funcion( 1/p2 ) + 0.5555556*(1/(p3)^2)*funcion( 1/p3 ));

%Calculo del error
x = C1 + C2*x;
D = diff( (1/(x)^2)*funcion(1/x) ,8); %Evaluar la función con x simbólica
x = 0.5;%Darle un valor a x
e = 6.3492e-05 * eval(D);
return
endfunction