% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 5/12/2021
% Descripcion: Emplear la aproximación de Gauss-Laguerre para resolver los
%siguientes problemas.


% Problema 1:
   
#{
La transformada de Laplace permite resolver ecuaciones diferenciales. El factor
de decaimiento de la función está dado por e^(-st). Calcule la transformada de 
Laplace de f(t) = cos(4t) con s = 1. 
#}
clear;
pkg load symbolic;
warning('off','all');

f = @(t) t^2;
intervalo = [0,Inf];
puntos = 3;

try
  
  [I,e] = GausLag(f,intervalo,puntos);

  fprintf('Aproximación: %5.6f \n',I );
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultados analitico: 2\n');
  fprintf('Error verdadero:%5.6f\n', abs( 2 - I )*100);

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

% Problema 2:
   
#{
La transformada de Laplace permite resolver ecuaciones diferenciales. El factor
de decaimiento de la función está dado por e^(-st). Calcule la transformada de 
Laplace de f(t) = t^2 con s = 1. 
#}

f = @(t) 1*t;
intervalo = [0,Inf];
puntos = 3;

try  
  
  [I,e] = GausLag(f,intervalo,puntos);

  fprintf('Aproximación: %5.6f \n',I );
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultado analitico: 1\n');
  fprintf('Error verdadero:%5.6f\n', abs(1 - I ) * 100);
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch