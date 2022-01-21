% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 18/11/2021
% Descripcion: Emplear los splines cuadraticos 

% Problema 1:
%   
#{
Para calcular el flujo de electrones por un conductor a través del tiempo
#}
%Datos:
%Función y f'' 
  f = @(x) 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
  fe= -0,60
  a = 0
  b = 0.8
try
  [error,sum]=Metodo_Trapecio(f,fe,a,b);
  error
  sum
end_try_catch

fprintf('-------------------------------------------------------------------\n')
clear all
% Problema 2:
%   
#{
Queremos saber cuanta es la energia del circuito
#}
%Datos:
%Matriz de Coeficientes y vector independiente

x=[2,4.25,5.25,7.81]
y=[7.2,7.1,6,5]
try
  [Coeficientes,l,n] = Spline_Cuad(x,y);
  Coeficientes
  figure(2)
  j=1;
  hold on;
  for i=1:n
    curve=@(l) Coeficientes(j)*(l.^2) + Coeficientes(j+1)*l + Coeficientes(j+2);
    ezplot(curve,[x(i),x(i+1)]);
    hndl=get(gca,'Children');
    set(hndl,'LineWidth',2);
    hold on
    j=j+3;
  end
  scatter(x,y,50,'r','filled')
  grid on;
  xlim([min(x)-2 max(x)+2]);
  ylim([min(y)-2 max(y)+2]);
  xlabel('Resistencia');
  ylabel('Temperatura');
  title('Spline Cuadrática')
end_try_catch

