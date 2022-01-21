% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Sistemas de EDO's
% Metodo del Heun's

fprintf('Problema 1 \n')
fprintf('\n')

% Problema 1:
%   
#{
En un circuito electrico con corrientes i1=y(1) y i2=y(2), con un resistor y 
capacitor, estan gobernadas por el sistema de ecuaciones diferenciales:
                   dy1/dt = 1.2y1 - 0.6y1y2,        y1(0)=2
                   dy2/dt = -0.8y2 + 0.3y1y2,       y2(0)=1
Con paso h = 0.5 resolver este sistema para 0<t<20
#}

%Datos
x0 = 0;
xf = 20;
y0 = [2;1];
f = @(x,y) [1.2*y(1)-0.6*y(1)*y(2);-0.8*y(2)+0.3*y(1)*y(2)];
h = 0.5;

%Solucion Analitica
ts = [0 20];
[t,ysol] = ode45(@prueba,ts,y0);

try
    
    %Llamado de la funcion
    [xn,y] = heunEDOs(f,x0,xf,y0,ne=2,h);
    
    fprintf('Intervalo        y1       y2 \n ')
    [xn.' y.'] %traspusta del vector y la matriz con resultados
    
    %error
    error1 = abs((ysol(end,1)-y(1,end))/ysol(end,1))*10;
    fprintf('El error para y1 es %d \n' , error1);
    error2 = abs((ysol(end,end)-y(end,end))/ysol(end,end))*10;
    fprintf('El error para y2 es %d \n' , error2);
    

    %Grafico 
    figure(1)
    plot(xn,y(1,:),'b--o',xn,y(2,:),'k--o',t,ysol,'g')
    legend('y1','y2','Analitico')
    title('Problema 1')


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
Se tiene el siguiente sistema de ecuaciones diferenciales que gobiernan las 
corrientes de un circuito electrico:
                       dy1/dt = y1 + 2sin(3y2),      y1(0)=.1
                       dy2/dt = y1 - 2y2,            y2(0)=0.1
Usando el metodo Heun's con paso de h = 0.1 resolver este sistema para 0<t<7
#}

%Datos

x0 = 0;
xf = 7; 
y0 = [0.1;0.1];
f = @(x,y) [y(1)+2*sin(3*y(2));y(1)-2*y(2)];
h = 0.5;


%Solucion Analitica
ts1 = [0 7];
[t1,ys] = ode45(@Prueba1,ts1,y0);



try
    
    %Llamado de la funcion
    [xn,y] = heunEDOs(f,x0,xf,y0,ne=2,h);
    fprintf('Intervalo        y1         y2 \n ')
    [xn.' y.'] %traspusta del vector y la matriz con resultados
    
    %error
    error1 = abs((ys(end,1)-y(1,end))/ys(end,1))*10;
    fprintf('El error para y1 es %d \n' , error1);
    error2 = abs((ys(end,end)-y(end,end))/ys(end,end))*10;
    fprintf('El error para y2 es %d \n' , error2);

    %Grafico
    figure(2)
    plot(xn,y(1,:),'b--o',xn,y(2,:),'k--o',t1,ys,'g')
    legend('y1','y2','Analitico')
    title('Problema 2')


catch err
  fprintf('Error: %s\n',err.message);
end_try_catch