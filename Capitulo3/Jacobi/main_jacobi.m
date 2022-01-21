
% Autores: Pablo Bermeo
%          Pablo Cardenas
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 30/10/2021
% Descripcion: Emplear el metodo iterativo de Jacobi para
% la solucion de sistemas lineales de ecuaciones


% Problema 1:
clear all;
%   
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes:
#}
fprintf('Metodo de Jacobi\n');
fprintf('--------------------Problema 1-------------------\n')

%Datos
fprintf('Matriz y vector a resolver(Matriz Aumentada)\n')
A = [4,2,3; 3,-5,2; -2,3,8];
b = [8;-14;27];
fprintf('Soluciones:\n');
n = length(b);
x = rand(n,1);    %Generamos valores iniciales aleatorios

%Llamado de la funcion principal
try
  [x,error,it] = jacobi(A,b,x)
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

%Comprabacion de la correcta implemetaci{on del metodo de Jacobi
fprintf('Se usa la funcion linsolve para comprobacion\n');
fprintf('Funcion de Octave\n');
x = linsolve(A,b)          

%---------------------------------------------------------------

fprintf('--------------------Problema 2-------------------\n')

clear;
% Problema 2:
%   
#{
Para inferir la forma de la superficie de un objeto a partir de imágenes 
tomadas de una superficie desde tres direcciones diferentes direcciones, 
hay que resolver el siguiente conjunto de ecuaciones.Los valores del lado 
derecho son las intensidades de luz del centro de las imágenes, mientras 
que la matriz de coeficientes depende de las direcciones de las fuentes 
de luz con respecto a la cámara. Las incógnitas son las intensidades 
incidentes que determinarán la forma del objeto.
Encuentra los valores de x1 , x2 , y x3 utilizando el metodo de Jacobi.            
#}

%Datos
fprintf('Matriz y vector a resolver(Matriz Aumentada)\n')
A = [4,1,2,-1;3,6,-1,2;2,-1,5,-3;4,1,-3,-8];
b = [2;-1;3;2];
fprintf('Soluciones:\n');
n = length(b);
x = rand(n,1);    %Generamos valores iniciales aleatorios

%Llamado de la funcion principal
try
  [x,error,it] = jacobi(A,b,x)
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

%Comprabacion de la correcta implemetaci{on del metodo de Jacobi
fprintf('Se usa la funcion linsolve para comprobacion\n');
fprintf('Funcion de Octave\n');
x = linsolve(A,b)

















  



