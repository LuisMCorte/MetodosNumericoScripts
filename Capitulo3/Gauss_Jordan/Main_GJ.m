% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 21/10/2021
% Descripcion: Emplear el metodo de Gauss_Jordan para la solucion de
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


A = [55,-20,0,0;
    -20,55,25,0;
    0,-25,37,-4;
    -25,0,-4,29];

b = [0;-10;0;100];

try
  
  [matrixTI, matrixTS, bTI, bTS, vals] = Gauss_Jordan(A,b);
  
  fprintf('Matriz triangular inferior:\n')
  disp(matrixTI);
  fprintf('coefs:\n');
  disp(bTI);
  
  fprintf('Matriz triangular superior:\n')
  fprintf('coefs:\n');
  disp(matrixTS);
  disp(bTS);
  
  fprintf('Valores de las variables:\n');
  disp(vals);
  
error
  fprintf('Error: %s \n',error.message);
end_try_catch

fprintf('-------------------------------------------------------------------\n')
% Problema 2:
%   
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo.
#}


%Datos:
%Matriz de Coeficientes y vector independiente

%fprintf('Matriz y vector a resolver(Matriz Aumentada)\n')

A = [0.14, -0.005, 0, 0;
     -0.005, 0.012, -0.005, 0;
     0, -0.005, 0.007, -0.001;
     0, 0,  -0.001, 0.002
      ];

b = [2;0;0;0];

try
  
  [matrixTI, matrixTS, bTI, bTS, vals] = Gauss_Jordan(A,b);
  
  fprintf('Matriz triangular inferior:\n')
  disp(matrixTI);
  fprintf('coefs:\n');
  disp(bTI);
  
  fprintf('Matriz triangular superior:\n')
  fprintf('coefs:\n');
  disp(matrixTS);
  disp(bTS);
  
  fprintf('Valores de las variables:\n');
  disp(vals);
  
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

