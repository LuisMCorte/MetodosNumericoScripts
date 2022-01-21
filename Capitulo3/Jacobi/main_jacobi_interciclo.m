% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 20/11/2021
% Descripcion: Emplear el metodo iterativo de Jacobi para
% la solucion de sistemas lineales de ecuaciones

%--------------------Problemas 1------------------------

A = [55 -20 0 0;-20 55 25 0;0 -25 37 -4;-25 0 -4 29];
b = [0;-10;0;100];
fprintf('Soluciones:\n');
n = length(b);
maxit = 1000;
x0 = rand(n,1);
tol = 1e-6; 
try
  tic;
  x = Jacobi1(A,b,tol,maxit,x0)
  toc;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch  

%--------------------Problemas 2------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')

A = [0.14 -0.005 0 0;-0.005 0.012 -0.005 0;0 -0.005 0.007 -0.001;0 0 -0.001 0.002];
b = [2;0;0;100];
fprintf('Soluciones:\n');
n = length(b);
maxit = 1000;
x0 = rand(n,1);
tol = 1e-6; 
try
  tic;
  x = Jacobi1(A,b,tol,maxit,x0)
  toc;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

%--------------------Problemas 3------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 3 \n')

A = [0.7460 -0.4516 0.0100 -0.0080;0.4516 0.7460 0.0080 0.0100;0.0100 -0.0080 0.7787 -0.5205;0.0080 0.0100 0.5205 0.7787];
b = [120;0;-60.00;-103.9];
fprintf('Soluciones:\n');
n = length(b);
maxit = 1000;
x0 = rand(n,1);
tol = 1e-6; 
try
  tic;
  x = Jacobi1(A,b,tol,maxit,x0)
  toc;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

%--------------------Problemas 4------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 4 \n')

A = [-111/100 1/10 1/100;1/10 111/10 1/100;1/100 1/100 -102/100];
b = [-3;0;1];
fprintf('Soluciones:\n');
n = length(b);
maxit = 1000;
x0 = rand(n,1);
tol = 1e-6; 
try
  tic;
  x = Jacobi1(A,b,tol,maxit,x0)
  toc;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

