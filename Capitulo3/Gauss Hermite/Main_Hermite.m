% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 1/12/2021
% Descripcion: Emplear la diferenciacion numerica para 
%resolver los siguientes problemas.


% Problema 1:
   
#{
Determine la carga transferida a un elemento luego de dejarla prendida indefinidamente si la corriente que
lo atraviesa esta dada por:

#}
clear;
pkg load symbolic;
warning('off','all');

f = @(t) 1/(1+t^2);
puntos = 2;

try
  
  [I,e] = Cuadratura_Hermite(f,puntos);

  fprintf('La carga transferida al elemento es de %5.6f C\n',I);
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultados analitico: 1.34\n');
  fprintf('Error verdadero:%5.6f\n', abs(1.34 - I )*100);

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

% Problema 2:
   
#{
Determine la carga transferida a un elemento luego de dejarla prendida indefinidamente  si la corriente que
lo atraviesa esta dada por:

#}

f = @(t) t^2;
puntos = 3;

try  
  
  [I,e] = Cuadratura_Hermite(f,puntos);

  fprintf('La carga transferida al elemento es de %5.6f C\n',I);
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultado analitico: 0.89\n');
  fprintf('Error verdadero:%5.6f\n', abs(0.89 - I ) * 100);
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch