% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Integración
% Regla de Simpson 3/8

% Problema 1:
%   
#{
La distancia vertical en metros recorrida por un cohete desde
 t = 8 hasta t = 30 segundos viene dada por

            f = 2000*log(140000/(140000 - 2100*x))-9.8*x
            a = -2.15
            b = 2.9

Utiliza la regla de los 3/8 segmentos múltiples de Simpson con seis segmentos
para estimar la distancia vertical. 
#}
fprintf('Problema 1 \n')

%Datos 
a = 8;
b = 30;
f = @(x) 2000*log(140000/(140000 - (2100*x)))-9.8*x;
n = 6;
v_analitico = 11061;

try
  
  %Llamado de la funcion
  [I] = simpson_threeeighths(a,b,f,n)
  %Calculo del error
  error = abs((v_analitico - I)/v_analitico)*100
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch



clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
%-----------------------------------------------------------------------------------------------------

% Problema 2:
%   
#{
La visión humana tiene la notable capacidad de inferir formas 3D a partir de 
imágenes 2D. La pregunta interesante es: ¿podemos reproducir algunas de estas 
capacidades en un ordenador? Sí, se puede hacer y para ello, se requiere la 
integración de campos vectoriales. Es necesario integrar la siguiente integral.

                  f = sqrt(x)*sin(x)

#}

%Datos 
a = 1;
b = 3;
f = @(x) sqrt(x)*sin(x);
n = 8;
v_analitico = 2.05363;

try
  
  %Llamado de la funcion
  [I] = simpson_threeeighths(a,b,f,n)
  %Calculo del error
  error = abs((v_analitico - I)/v_analitico)*100
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
