% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 1/12/2021
% Descripcion: Emplear la diferenciacion numerica para 
%resolver los siguientes problemas.


% Problema 1:
   
#{
En un circuito electrico con corrientes i1=y(1) y i2=y(2), con un resistor y 
capacitor, estan gobernadas por el sistema de ecuaciones diferenciales:
                   dy1/dt = -0.5*y1,        y1(0)=4
                   dy2/dt = 4-0.3y2-0.1y1,       y2(0)=6
Con paso h = 0.5 resolver este sistema para 0<t<2

#}
clear;
pkg load symbolic;
warning('off','all');
f_1= @(x,v) (-0.5)*x
f_2 = @(x,v) 4 - (0.3)*v - (0.1)*x
h = 0.5;
a_1 = 4; #y1 inicial
a_2 = 6; #y2 inicial
b = 0; #t inicial
c = 2;  #t final
try
  
 [error_global,error_local,y_1,y_2,t] = S_Euller(f_1,f_2,h,a_1,a_2,b,c);
 error_global
 y_1
 y_2
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch
%Resultado Analítico
y0 = [4;6];
ts1 = b:h:c;
[t1,ys] = ode45(@Prueba1,ts1,y0);
ys
%Grafico
figure(1)
    plot(t,y_1,'g--',t,y_2,'b--',t,ys,'r')
    legend('y1','y2','Analitico')
% Problema 2:
   
#{
Se tiene el siguiente sistema de ecuaciones diferenciales que gobiernan las 
corrientes de un circuito electrico:
                       dy1/dt = 3y1 -2y2,      y1(0)=3
                       dy2/dt = 5y1 -4y2,            y2(0)=0.6
Usando el metodo Heun's con paso de h = 0.2 resolver este sistema para 0<t<2

#}
f_1= @(x,v) (3)*x - (2)*v
f_2 = @(x,v) (5)*x - (4)*v
h = 0.2;
a_1 = 3; #y1 inicial
a_2 = 6; #y2 inicial
b = 0; #t inicial
c = 2;  #t final
try
  
 [error_global,error_local,y_1,y_2,t] = S_Euller(f_1,f_2,h,a_1,a_2,b,c);
 error_global
 y_1
 y_2
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch
%Resultado Analítico
y_0 = [3;6];
ts = b:h:c;
[t1,ysol] = ode45(@prueba,ts,y_0);
ysol
%Grafico
figure(2)
    plot(t,y_1,'g--',t,y_2,'b--',t,ysol,'r')
    legend('y1','y2','Analitico')