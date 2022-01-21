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
Determine la carga transferida a un elemento luego de 2 s si la corriente que
lo atraviesa esta dada por:
                              i(t) = 6*e^(-2t) mA  
#}
clear;
pkg load symbolic;
warning('off','all');

f = @(t) 6*e^(-2*t)*10e-3;
intervalo = [0,2];
puntos = 2;

try
  
  [I,e] = Cuaga(f,intervalo,puntos);

  fprintf('La carga transferida al elemento es de %5.6f C\n',I);
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultados analitico: 0.029450\n');
  fprintf('Error verdadero:%5.6f\n', abs(0.029450 - e )*100);

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

% Problema 2:
   
#{
Determine la carga transferida a un elemento luego de 0.6 s si la corriente que
lo atraviesa esta dada por:
                              i(t) = 5sin(4pi*t) mA  
#}

f = @(t) 5*sin(4*pi*t)*10e-3;
intervalo = [0,0.6];
puntos = 3;

try  
  
  [I,e] = Cuaga(f,intervalo,puntos);

  fprintf('La carga transferida al elemento es de %5.6f C\n',I);
  fprintf('Error de truncamiento:%5.6f\n',e);
  fprintf('Resultado analitico: 0.002749\n');
  fprintf('Error verdadero:%5.6f\n', abs(0.002749 - e ) * 100);
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch