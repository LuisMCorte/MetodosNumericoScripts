% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 1/11/2021
% Descripcion: Emplear el metodo de Descomposición Cholesky para la solucion de
% sistemas de ecuaciones lineales.


% Problema 1:
%   
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
#}

try
  A = [4,-1,0,2 ; -1,4,-1,0 ; 0,-1,4,1 ; 2,0,1,3]
  B = [6,3,16,12];
  [L,Lt,y,resps] = CalCholesky(A,B);
  
  fprintf('La matriz ha sido descompuesta en L * Lt, tal que:\n')
  fprintf('L =\n')
  disp(L)
  fprintf('Lt =\n')
  disp(Lt)
  fprintf('Luego de resolver L|b, obtenemos que:\n')
  fprintf('y =\n')
  disp(y)
  fprintf('Para encontrar los valores de I1,I2 e I3, resolvemos Lt|y:\n')
  disp(resps)
  
catch error
  fprintf('Error: %s \n',error.message);
end_try_catch

fprintf('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/**/*/*/*/*/*/*/*/*/*/\n')

% Problema 2:
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo.
#}

%Datos:
%Matriz de Coeficientes y vector independiente

try
  A = [1,-1,1 ; -1,5,-5 ; 1,-5,6]
  b = [3,14,11];
  [L,Lt,y,resps] = CalCholesky(A,B);
  
  fprintf('La matriz ha sido descompuesta en L * Lt, tal que:\n')
  fprintf('L =\n')
  disp(L)
  fprintf('Lt =\n')
  disp(Lt)
  fprintf('Luego de resolver L|b, obtenemos que:\n')
  fprintf('y =\n')
  disp(y)
  fprintf('Para encontrar los valores de V1,V2 y V3, resolvemos Lt|y:\n')
  disp(resps)
  
catch error
  fprintf('Error: %s \n',error.message);
end_try_catch