% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 1/11/2021
% Descripcion: Emplear el metodo de Gauss-Seidel para la solucion de
% sistemas de ecuaciones lineales.


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
try
  
  A = [6,2,3;-1,4,-2;0,-1,3];
  B = [1,2,3];

  [data,resps] = GaussSeidel(A,B,100,0.00001);

  %**********************+ Generacion de la respuesta y tabla de iteraciones+************************
  fprintf('Proceso:\n');
  fprintf('\nIteración\tI1_k\t    I2_k\t      I3_k\n');

  [n,m] = size(data);
  for i = 1:n%Impresión del número de fila. El número de cada fila representa cada iteración
    
      fprintf('%5.d\t',i);#Impresión del numero de iteración como si tomar 5 espacios de caracteres
    
      for j = 1:m
        #La primera, segunda y tercera columna de cada fila representa Xa, Xb y el error. Limitación de los valores a 4 decimales
        fprintf('%10.4f\t',data(i,j)); 
      endfor
    
      fprintf('\n');#Generación de un nuevo renglón
  endfor
  
  fprintf('Las respuestas son:\n');
  disp(resps);
  %**************************************************************************************************
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
  
  A = [7,1,-2;-3,-5,1;2,2,-6];
  B = [5,-20,-8];

  [data,resps] = GaussSeidel(A,B,100,0.01);

  %**********************+ Generacion de la respuesta y tabla de iteraciones+************************
  fprintf('Proceso:\n');
  fprintf('\nIteración\tV1_k\t    V2_k\t      V3_k\n');

  [n,m] = size(data);
  for i = 1:n%Impresión del número de fila. El número de cada fila representa cada iteración
    
      fprintf('%5.d\t',i);#Impresión del numero de iteración como si tomar 5 espacios de caracteres
    
      for j = 1:m
        #La primera, segunda y tercera columna de cada fila representa Xa, Xb y el error. Limitación de los valores a 4 decimales
        fprintf('%10.4f\t',data(i,j)); 
      endfor
    
      fprintf('\n');#Generación de un nuevo renglón
  endfor
  
  fprintf('Las respuestas son:\n');
  disp(resps);
  %**************************************************************************************************
catch error
  fprintf('Error: %s \n',error.message);
end_try_catch