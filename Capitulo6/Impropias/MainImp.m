% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 8/12/2021
% Descripcion: Aproxime el resultado de las siguientes integrales impropias

% Problema 1:   
#{
Use la formula de la distribución normal acumulativa para calcular 
la probabilidad de que un evento sea menor que x=1  
#}
clear;
warning('off','all');

funcion = @(t) 2.718^( (t^2)/-2 );
escalar = 0.3989;
intervalo = [-Inf,1];

try

    [I,e] = integ_imp(funcion,escalar,intervalo);

    fprintf('Aproximacion:%5.5f\n',I);
    fprintf('Error:%5.5f\n',e);
    fprintf('Calculo analítico:%5.5f\n',0.85);
    fprintf('Error verdadero:%5.5f\n',100*abs(I-0.85));

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

fprintf('==========================================\n')
clear;

% Problema 2:   
#{
La siguiente función representa la corriente que atraviesa a un capcitor.
Calcule la carga que se almacena en el elemento luego de estar conectado
por mucho tiempo.  
#}
funcion = @(t) e^(-t)*(t^(1.4));
escalar = 1;
intervalo = [0.1,Inf];

try

    [I,e] = integ_imp(funcion,escalar,intervalo);

    fprintf('Aproximacion:%5.5f\n',I);
    fprintf('Error:%5.5f\n',e);
    fprintf('Calculo analítico:%5.5f\n',1.27);
    fprintf('Error verdadero:%5.5f\n',100*abs(I-1.27));

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch