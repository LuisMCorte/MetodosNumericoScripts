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
Apply the quadratic interpolation search method to minimize the following 
function: 
             f = @(x) e.^(-2*x)
on the pints [-5 2.4946 5] 
#}

%Datos
f = @(x) e.^(-2*x) + x.^2;
x0 = -5;
x1 = 2.4946;
x2 = 5;


try
  %Llamado de la funcion
  [Minimumpoint,Minimumfunctionvalue,Error,Iteracions]=search_quadratic(f,x0,x1,x2)
  
  
  %Grafico
  figure(1)
  xgraf = x0:0.1:x2; 
  plot(xgraf,f(xgraf),'LineWidth',2);
  xlim([-2 5])
  ylim([0 20])
  xlabel('x');
  ylabel('f(x)');
  title('Temperatura en una resistencia','FontSize',15)
  legend('Función','Location','northwest');
  
  %grid on
  str1 = num2str('O',0);
  text(Minimumpoint,Minimumfunctionvalue,str1,'Color','red','FontSize',20)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

clear all;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
fprintf('\n')


%-----------------------------------------------------------------------------------

% Problema 2:
%   
#{
Apply the quadratic interpolation search method to minimize the following 
function: 
             f = 2*sin(x) - 0.1*x^2
on the pints [1 2 3]            
#}

%Datos
f = @(x) 2*sin(x) - 0.1*x.^2;
x0 = 1;
x1 = 2;
x2 = 3;

try
  %Llamado de la funcion
  [Minimumpoint,Minimumfunctionvalue,Error,Iteracions]=search_quadratic(f,x0,x1,x2)
  
  
  %Grafico
  figure(2)
  xgraf = x0:0.1:x2; 
  plot(xgraf,f(xgraf),'LineWidth',2);
  xlim([x0 x2])
  ylim([0 2])
  xlabel('x');
  ylabel('f(x)');
  title('Trayectoria de un conductor','FontSize',15)
  legend('Función','FontSize',10);
  
  %grid on
  str1 = num2str('O',0);
  text(Minimumpoint,Minimumfunctionvalue,str1,'Color','red','FontSize',20)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch