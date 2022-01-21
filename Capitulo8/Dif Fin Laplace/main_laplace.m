% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Diferencias Finitas
% Ecuacion de laplace

fprintf('Problema 1 \n')
fprintf('\n')

% Problema 1:
%   
#{
La sección transversal de una artesa con un potencial cero en los lados 
y en la parte inferior, y uno de 100 V en la parte superior. La sección
transversal se dividió en 16 cuadrados, con la estimación del potencial
en cada esquina. Se pueden determinar valores más exactos usando el método
de diferencias finitas.
#}

%Datos
frontera = [100 0 0 0];
puntos = [3 3];

try
  %Llamado de la funcion
  [resultado] = findifflaplace(frontera,puntos);
  resultado

  %Grafico
  figure(1)
  [x,y]=meshgrid(1:puntos(2)+2,1:puntos(1)+2);
  surf(x,y,resultado)
  shading flat
  title('Problema 1')
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
fprintf('\n')
%-----------------------------------------------------------------------------------


% Problema 2:
%   
#{
La figura 7.12 muestra un enrejado cuadrado dentro de un potencial irregular.
Utilizando el método de diferencias finitas encontrar el potencial al volt más
cercano, determinar el valor final en el punto c.             
#}

%Datos
frontera = [50 100 70 100];
puntos = [2 2];

try
  %Llamado de la funcion
  [resultado] = findifflaplace(frontera,puntos);
  resultado

  %Grafico
  figure(2)
  [x,y]=meshgrid(1:puntos(2)+2,1:puntos(1)+2);
  surf(x,y,resultado)
  shading flat
  title('Problema 2')
    
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

