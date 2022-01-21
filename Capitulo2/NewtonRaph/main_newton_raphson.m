% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 20/10/2021
% Descripcion: Métodos para hallar
% raices de ecuaciones no lineales

%-------------------Problema 1--------------------------
f = @(x) 210*sqrt(2)*e^(-2*x)*sin(sqrt(2)*x);
dx = @(x) e^(-2*x)*(210*sqrt(4)*cos(sqrt(2)*x) - 420*sqrt(2)*sin(sqrt(2)*x));
x0 = 2.2;
tic;  
[iteraciones,solucion,error] = Newton(f,dx,x0)
if iteraciones > 0
  fprintf('Numero de iteraciones: %d\n',iteraciones);
  fprintf('La solución es: %f\n', solucion)
  %fprintf('El error es: %f\n', error)
else
  fprintf('Error')
endif
toc;


%--------------------Problemas 2------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')

f = @(x) (x*(x-2))/((x^2+6*x+10)*(x+5));
dx = @(x) (x*(4*x^2 - x^3 + 62*x + 100)-100)/((x+5)^2*(x*(x+6)+10)^2);
x0 = 3;
tic;  
[iteraciones,solucion,error] = Newton(f,dx,x0)
if iteraciones > 0
  fprintf('Numero de iteraciones: %d\n',iteraciones);
  fprintf('La solución es: %f\n', solucion)
  %fprintf('El error es: %f\n', error)
else
  fprintf('Error')
endif
toc;

%--------------------Problemas 3------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 3 \n')

f = @(x) 3*e^(-x)-5*e^(-2*x);
dx = @(x) -3*e^(-x)+10*e^(-2*x);
x0 = 1;
tic;  
[iteraciones,solucion,error] = Newton(f,dx,x0)
if iteraciones > 0
  fprintf('Numero de iteraciones: %d\n',iteraciones);
  fprintf('La solución es: %f\n', solucion)
  %fprintf('El error es: %f\n', error)
else
  fprintf('Error')
endif
toc;



%--------------------Problemas 4------------------------
clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 4 \n')

f = @(x) 20*e^(-4*x)*cos(50*x);
dx = @(x) e^(-4*x)*(-1000*sin(50*x)-80*cos(50*x));
x0 = 1.5;
tic;  
[iteraciones,solucion,error] = Newton(f,dx,x0)
if iteraciones > 0
  fprintf('Numero de iteraciones: %d\n',iteraciones);
  fprintf('La solución es: %f\n', solucion)
  %fprintf('El error es: %f\n', error)
else
  fprintf('Error')
endif
toc;