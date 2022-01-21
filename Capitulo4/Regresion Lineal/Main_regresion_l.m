% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 17/10/2021
% Descripcion: Emplear la regresion lineal para
% el ajuste lineal 


% Problema 1:
%   
#{
Para simplificar el modelo de un diodo, éste se aproxima mediante un modelo 
de polarización hacia delante que consiste en una tensión continua DC-Vd , 
y una resistencia Rd . A continuación se muestran los datos de 
corriente vs. tensión que se recogen para una pequeña señal. 
#}
fprintf('Problema 1 \n')

x = [0.6,0.7,0.8,0.9,1,1.1];        %(V)Voltaje
y = [0.01,0.05,0.20,0.70,2,4];      %(I)Amperios


try
  
  fprintf('La solución es de la forma y = a0 + a1*x + e \n')
  fprintf('\n')
  
  %LLamado de la función
  [interseccion,pendiente,y0,epsilon] = reglineal(x,y)

  %Grafico
  figure
  plot(x,y,"o",'LineWidth',3,x,y0,'LineWidth',3)
  title('Modelo de un diodo','FontSize',18)
  legend('Datos','y = a1*x + a0','Location','northwest','FontSize',26)
  xlabel('Voltaje(volts)','FontSize',20)
  ylabel('Corriente(ampers)','FontSize',20)
  
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


x = [30,30,30,30,22.5,19,22.5,18,18,17.6,20,24.5,19,15.27]; %Luz principal
y = [1.10,1.10,1.10,1.10,0.9,0.75,0.90,0.65,0.65,0.65,0.80,1.20,0.75,0.65];%Tablero

try
  
  fprintf('La solución es de la forma y = a0 + a1*x + e \n')
  fprintf('\n')
  
  %LLamado de la función
  [interseccion,pendiente,y0,epsilon] = reglineal(x,y)

  %Grafico
  figure
  plot(x,y,"o",'LineWidth',3,x,y0,'LineWidth',3)
  title('Relación de luz y tablero','FontSize',18)
  legend('Datos','y = a1*x + a0','Location','northwest','FontSize',26)
  xlabel('Luz principal(m)','FontSize',20)
  ylabel('Centro del tablero(m)','FontSize',20)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

