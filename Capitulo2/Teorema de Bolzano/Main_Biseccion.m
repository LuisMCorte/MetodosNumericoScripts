% Autores:Pablo Bermeo
%         Pablo Cardenas
%         Luis Miguel Corte
%         Ronald Criollo
%
% Fecha:11/10/2021
% Descripcion: Programa que encuentra la raiz de una funcion, f(x) = 0, usando el Metodo de biseccion.
%
% Problema :
%   
%   Encuentre la raíz de la función y = -4*(x^3) + 3*(x^2) + 5 en el intervalo [-1.5, 1.5] con un maximo de 20 iteraciones y un error minimo del 1%.
f1 = @(x) 210*sqrt(2)*e^(-2*x)*sin(sqrt(2)*x);
a = 1.4;
b = 3;

tic;
[raiz, error, iters] = EncontrarRaiz(a, b, f1);
toc;

disp(raiz)
disp(error)
disp(iters)