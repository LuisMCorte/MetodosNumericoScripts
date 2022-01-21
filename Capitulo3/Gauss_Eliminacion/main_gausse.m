% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 20/10/2021
% Descripcion: Emplear el metodo de Gauss para la solucion de
% sistemas de ecuacioneslineales.


% Problema 1:
%   
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
#}


%Datos:
%Matriz de Coeficientes y vector independiente

fprintf('Matriz y vector a resolver(Matriz Aumentada)\n')

A = [55,-20,0,0;
    -20,55,25,0;
    0,-25,37,-4;
    -25,0,-4,29]

b = [0;-10;0;100]

%LLamado de la funcion eliminacion para obtener la matriz triangular inferior
fprintf('Matriz triangular inferior\n')
[A,b] = eliminacion(A,b)

%Matriz triangular inferior y vector independiente
An = A;
bn = b;

%LLamado de la funcion sustitucion para obtener los valores de respuesta
fprintf('Los valores de corriente [I1 I2 I3 I4] respectivamente son:\n')
[x] = sustitucion(An,bn)


%------------------------------------------------------------------------------
fprintf('----------------------------------------------------------------------')
clear;

% Problema 2:
%   
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo. 
#}

A = [0.14, -0.005, 0, 0;
     -0.005, 0.012, -0.005, 0;
     0, -0.005, 0.007, -0.001;
     0, 0,  -0.001, 0.002
      ]

b = [2;0;0;0]

%LLamado de la funcion eliminacion para obtener la matriz triangular inferior
fprintf('Matriz triangular inferior\n')
[A,b] = eliminacion(A,b)

%Matriz triangular inferior y vector independiente
An = A;
bn = b;

%LLamado de la funcion sustitucion para obtener los valores de respuesta
fprintf('Los valores de corriente [V1 V2 V3 V4] respectivamente son:\n')
[x] = sustitucion(An,bn)












 

  