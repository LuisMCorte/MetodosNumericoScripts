% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Interpolacion
% polinomial de Newton

% Problema 1:
%   
#{
Para simplificar el modelo de un diodo, éste se aproxima mediante un modelo 
de polarización hacia delante que consiste en una tensión continua DC-Vd , 
y una resistencia Rd . A continuación se muestran los datos de 
corriente vs. tensión que se recogen para una pequeña señal. 
#}
fprintf('Problema 1 \n')

x = [0,10,15,20,22.5,30];        %(V)Voltaje
y = [0,227.04,362.78,517.35,602.97,901.67];      %(I)Amperios
n = length(x);
try 
  
  %Llamado de la funcion
  [coeficientes] = interpolacion(x,y)
  
  %Datos para graficar
  x0 = 0:0.1:35;      %Rango de la grafica   

  y0 = coeficientes(n) * ones(size(x0));
  for i=(n-1):(-1):1
    y0 = coeficientes(i) + y0.*(x0-x(i));
  end

  %Grafico
  figure(1);
  plot(x0, y0, '-','LineWidth',3, x, y, 'o','LineWidth',3);
  title('Modelo de un diodo','FontSize',20)
  legend('Interpolacion','Datos','Location','northwest','FontSize',26)
  xlabel('Voltaje(vatios)','FontSize',16)
  ylabel('Amperios(A)','FontSize',16)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
%-----------------------------------------------------------------------------------------------------

% Problema 2:
%   
#{
Se dispone de una muestra de 14 puentes losa postesados macizos. Los resultados se muestran
en el cuadro siguiente. Se quiere conocer la relación que existe entre la luz principal de este tipo
de puentes y el canto del tablero.
#}

x = [0 1 2 3 4 5];        %(V)Voltaje
y = [1 e e^2 e^3 e^4 e^5];      %(I)Amperios
n = length(x);
try 
  
  %Llamado de la funcion
  [coeficientes] = interpolacion(x,y)
  
  %Datos para graficar
  x0 = 0:0.1:6;  %Rango de la grafica   

  y0 = coeficientes(n)*ones(size(x0));    %Matriz x0 * 1
  for i=(n-1):(-1):1
    y0 = coeficientes(i) + y0.*(x0-x(i));
  end
 
  %Grafico
  figure(2);
  plot(x0, y0, '-','LineWidth',3, x, y, 'o','LineWidth',3);
  title('Relación luz y tableroro','FontSize',20)
  legend('Interpolacion','Datos','Location','northwest','FontSize',26)
  xlabel('Luz principal(m)','FontSize',16)
  ylabel('Centro del tablero(m)','FontSize',16)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch