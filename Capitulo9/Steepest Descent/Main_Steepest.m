clear all
pkg load symbolic;
warning('off','all');
% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Optimizacion sin restricciones
% Método de búsqueda de interpolación cuadrática

fprintf('Problema 1 \n')
fprintf('\n')

% Problema 1:
%   
#{
Apply the Steepest Descent search method to minimize the following 
function: 
              f1 = (1/2)*(x^2)+ y^2+ x+(1/2)*y+3; 
#}

%Datos
syms x y
f1 = (1/2)*(x^2)+ y^2+ x+(1/2)*y+3;
x = 0;
y = 0;
max = 100;
tol = 1e-7;

try
  %Llamado de la funcion
  [X,x0,evaluado]=Steepest(f1,x,y,max,tol);
  X
  x0
  evaluado
  %Grafico
  figure(1)
  [x,y]= meshgrid(-2:0.1:2);
  z=(1/2).*(x.^2)+ y.^2+ x+(1/2).*y+3;
  surf(x,y,z);
  hold on
 [x,y]= meshgrid(-2:0.1:2);
  z= evaluado+0.*x+0.*y
  surf(x,y,z)
  plot(x0(1),x0(2),'o','LineWidth', 20)
  hold off
  
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
Apply the Steepest Descent search method to minimize the following 
function: 
             f1 = x^2+2*y^2+(1/100)*(x+y)^2;          
#}

%Datos
syms x y
f1 = x^2+2*y^2+(1/100)*(x+y)^2;
x = 1;
y = 1;
max = 100;
tol = 1e-7;

try
  %Llamado de la funcion
  [X,x0,evaluado]=Steepest(f1,x,y,max,tol);
  X
  x0
  evaluado
  %Grafico
  figure(2)
  [x,y]= meshgrid(-1:0.1:1);
  z= x.^2+2.*y.^2+(1/100).*(x+y).^2;
  surf(x,y,z);
  hold on
 [x,y]= meshgrid(-1:0.1:1);
  z= evaluado+0.*x+0.*y
  surf(x,y,z)
  plot(x0(1),x0(2),'o','LineWidth', 20)
  hold off
 catch err
  fprintf('Error: %s\n',err.message);
end_try_catch