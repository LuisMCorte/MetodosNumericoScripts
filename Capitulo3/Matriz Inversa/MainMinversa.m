% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 3/11/2021
% Descripcion: Hallar la matriz inversa: 
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
#}
%Datos:
%Matriz de Coeficientes y vector independiente

fprintf('Matriz a resolver \n')

y =[3,6,2,4;
    2,7,5,3;
    6,2,4,3;
    5,7,3,2]
b =[3;4;5;6]
try
  
  [x] = MInversa(y);
  fprintf("Los valores son:\n")
  disp(x(:,5:8)*b)
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 


%------------------------------------------------------------------------------
fprintf('----------------------------------------------------------------------\n')
clear;

% Problema 2:
%   
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo. 
#}
y = [0.14, -0.005, 0, 0;
     -0.005, 0.012, -0.005, 0;
     0, -0.005, 0.007, -0.001;
     0, 0,  -0.001, 0.002
      ]
b = [2;0;0;0];
try
  
  [x] = MInversa(y);
  fprintf("Los valores son:\n")
  disp(x(:,5:8)*b)
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 
