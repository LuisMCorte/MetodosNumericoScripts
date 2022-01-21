% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Optimizacion sin restricciones
% Método de búsqueda de interpolación cuadrática
clear all
syms x1 x2

fprintf('Problema 1 \n')
fprintf('\n')

% Problema 1:
%   
#{
Apply the conjugate gradient method to minimize the function
             f = x1 - x2 + 2*(x1^2) + 2*x1*x2 + x2^2;
with a starting point [0 0] 
#}

%Datos
f = x1 - x2 + 2*(x1^2) + 2*x1*x2 + x2^2;
x = [0;0];


try
  %Llamado de la funcion
  [PuntoMinimo,error] = conj_grad(f,x)

  
  %Evalucacion de los puntos minimos en la funcion
  res = PuntoMinimo;
  ValorFuncionMinimo = double(subs(f, [x1,x2], [res(1),res(2)]))
  
  
  %Grafico
  figure(1)
  subplot(1,2,1)
  [X,Y] = meshgrid(-2:.2:2);                                
   Z = X - Y + 2.*(X.^2) + 2.*X.*Y + Y.^2;
   surf(X,Y,Z)
   xlabel('Eje x'), ylabel('Eje y'), zlabel('Eje z')
   title('Superficie 1','FontSize',20)
   
   grid on
   str1 = num2str('* Punto minimo',0);
   text(-1,1.50,-1.25,str1,'Color','black','FontSize',20,'Rotation',90)
   
   subplot(1,2,2)
   id = contour(X,Y,Z,10);
   clabel(id)
   colormap(hsv)
   xlabel('Eje x'), ylabel('Eje y'), zlabel('Eje z')
   title('Curvas de Nivel 1','FontSize',20)
   axis equal

   grid on
   str1 = num2str('* Punto minimo',0);
   text(-1,1.50,-1.25,str1,'Color','black','FontSize',18)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

clear all;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
fprintf('\n')


%-----------------------------------------------------------------------------------
syms x1 x2
% Problema 2:
%   
#{
Apply the conjugate gradient method to minimize the function
             x1^2 + 2*(x2^2) - 4*x1 - 2*x1*x2;
with a starting point [1 1]            
#}

%Datos
f = 4*(x1^2) + 6*(x2^2) - 8*x1*x2;

x = [1;1];

try
  %Llamado de la funcion
  [PuntoMinimo,error] = conj_grad(f,x)
  
  %Evalucacion de los puntos minimos en la funcion
  res = PuntoMinimo;
  ValorFuncionMinimo = double(subs(f, [x1,x2], [res(1),res(2)]))
  
  %Grafico
   figure(2)
   subplot(1,2,1)
   [X,Y] = meshgrid(-2:.2:2);                                
   Z = 4.*X.^2 + 6.*Y.^2 - 10.*X.*Y;
   surf(X,Y,Z)
   xlabel('Eje x'), ylabel('Eje y'), zlabel('Eje z')
   title('Superficie 2','FontSize',20)
   
   grid on
   str1 = num2str('* Punto minimo',0);
   text(-1,-1,2,str1,'Color','black','FontSize',20,'Rotation',90)
   
   subplot(1,2,2)
   id = contour(X,Y,Z,10);
   clabel(id)
   colormap(hsv)
   xlabel('Eje x'), ylabel('Eje y'), zlabel('Eje z')
   title('Curvas de Nivel 2','FontSize',20)
   axis equal

   grid on
   str1 = num2str('* Punto minimo',0);
   text(-1,-1,2,str1,'Color','black','FontSize',18)
  
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch








