% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 17/10/2021
% Descripcion: Emplear la regresion lineal para
% el ajuste lineal 


% Problema 1:
%   
#{
Para simplificar el modelo de un diodo, �ste se aproxima mediante un modelo 
de polarizaci�n hacia delante que consiste en una tensi�n continua DC-Vd , 
y una resistencia Rd . A continuaci�n se muestran los datos de 
corriente vs. tensi�n que se recogen para una peque�a se�al. 
#}
fprintf('Problema 1 \n')

x = [1,2,3,4,5];        %(V)Voltaje
y = [0.5,1.7,3.4,5.7,8.4];      %(I)Amperios
n= length(x);
try
  
  fprintf('La soluci�n es de la forma y = ax^b \n')
  fprintf('\n')
  
  %LLamado de la funci�n
  [x_1,y_1,y_0,error] = Reg_noLineal(x,y)
  %Grafico
  figure
  plot(x,y,"o",x,y_0)
  title('Problema 1')
  legend('Datos','y = ax^b','Location','northwest')
  xlabel('Voltaje(volts)')
  ylabel('Corriente(ampers)')
  
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
en el cuadro siguiente. Se quiere conocer la relaci�n que existe entre la luz principal de este tipo
de puentes y el canto del tablero.
#}


x = [30,30,30,30,22.5,19,22.5,18,18,17.6,20,24.5,19,15.27]; %Luz principal
y = [1.10,1.10,1.10,1.10,0.9,0.75,0.90,0.65,0.65,0.65,0.80,1.20,0.75,0.65];%Tablero
n= length(x);
try
  
  fprintf('La soluci�n es de la forma y = ax^b \n')
  fprintf('\n')
  
  %LLamado de la funci�n
  [x_1,y_1,y_0,error] = Reg_noLineal(x,y)
  %Grafico
  figure
  plot(x,y,"o",x,y_0)
  title('Problema 2')
  legend('Datos','y = ax^b','Location','northwest')
  xlabel('Luz principal(m)')
  ylabel('Centro del tablero(m)')
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
