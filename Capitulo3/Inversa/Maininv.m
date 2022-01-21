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

x =[3,6,2,4;
    2,7,5,3;
    6,2,4,3;
    5,7,3,2]

%Llamado de la función 
[x] = inv(x);
  



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
x = [0.14, -0.005, 0, 0;
     -0.005, 0.012, -0.005, 0;
     0, -0.005, 0.007, -0.001;
     0, 0,  -0.001, 0.002
      ]


%Llamado de la función 
[x] = inv(x);
  

