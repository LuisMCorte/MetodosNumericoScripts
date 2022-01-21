% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Ecuaciones Diferenciales
% Metodo del Punto Medio


fprintf('Problema 1 \n')
fprintf('\n')

% Problema 1:
%   
#{
La ecuacion simplificada de Kirchof para el circuito es la siguiente:
                 dy/dx = y*(x^2) -1.1*y
obtenga y traze la corriente y desde x=0 hasta x=1 con saltos de 0.1, 0.25, 0.5
#}

%Datos
f = @(x,y) y*(x.^2) - 1.1*y;
x = 0;
xfinal = 1;
y0 = 1;
lista = [0.1 0.25 0.5];
e1 = ([~,y1] = midpoint(f,x,lista(1),xfinal,y0))(end);
e2 = ([~,y2] = midpoint(f,x,lista(2),xfinal,y0))(end);
e3 = ([~,y3] = midpoint(f,x,lista(3),xfinal,y0))(end);

try
  
  %Presentacion de datos con diferentes saltos
  fprintf('Resultados con diferentes valores de h\n')
  fprintf('\n')
  for i = [0.1 0.25 0.5]
    %Llamado de la funcion
    fprintf('Para h = %d \n' , i)
    [yout] = midpoint(f,x,i,xfinal,y0)
  endfor
  
  %Solucion analitica
  listasolu = [];
  for i = 0:0.1:1
    v = e^((i^3)/3 - 1.1*i);
    listasolu = [listasolu,v];
  endfor
  
  %error
  fprintf('Error\n')
  a = [abs((listasolu(end)-e1)/(listasolu(end)))*100 
  abs((listasolu(end)-e2)/(listasolu(end)))*100 
  abs((listasolu(end)-e3)/(listasolu(end)))*100];
  for i=1:3
    fprintf('El error para h = %d es %d \n' , lista(i),a(i));
  endfor
  
  %Grafico
  figure(1)
  
  [~,y1] = midpoint(f,x,lista(1),xfinal,y0);
  [~,y2] = midpoint(f,x,lista(2),xfinal,y0);
  [~,y3] = midpoint(f,x,lista(3),xfinal,y0);
  plot(0:lista(1):1,y1,'r','LineWidth',2,
       0:lista(2):1,y2,'b','LineWidth',2,
       0:lista(3):1,y3,'y','LineWidth',2,
       0:0.1:1,listasolu,'k','LineWidth',2)
  legend('0.1','0.25','0.5','analitica','FontSize',26)
  title('Corriente en circuito','FontSize',20)

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
Una fuente de alimentación basada en un rectificador requiere un condensador
para almacenar temporalmente la energía cuando la forma de onda rectificada
de la fuente de CA cae por debajo de la tensión objetivo.Para dimensionar 
adecuadamente este condensador hay que resolver una ecuación diferencial 
ordinaria de primer orden. Para una fuente de alimentación concreta particular,
con un condensador de 0.5F , la ecuación diferencial ordinaria que hay que 
resolver es:       
                   dy/dx = 4*e.^(0.8*x) - 0.5*y, y(0)=2
                   
Utilizando el método del midpoint, encontrar la tensión a través del 
condensador en 0<x<4s, Utilice los tamaño del paso 0.25 y 0.5.                
#}

%Datos
f = @(x,y) 4*e.^(0.8*x) - 0.5*y;
x = 0;
xfinal = 4;
y0 = 2;
lista = [0.25 0.5];
e1 = ([~,y1] = midpoint(f,x,lista(1),xfinal,y0))(end);
e2 = ([~,y2] = midpoint(f,x,lista(2),xfinal,y0))(end);


%Solucion analitica
listasol = [];
for i = 0:0.1:4
  v = (e.^(-0.5*i))/13 * (40*e.^(1.3*i)-14);
  listasol = [listasol,v];
endfor


try  
  %Presentacion de datos con diferentes saltos
  fprintf('Resultados con diferentes valores de h\n')
  fprintf('\n')
  for i = [0.25 0.5]
    %Llamado de la funcion
    fprintf('Para h = %d \n' , i)
    [yout] = midpoint(f,x,i,xfinal,y0)
  endfor
  
  %Solucion analitica
  listasol = [];
  for i = 0:0.1:4
    v = (e.^(-0.5*i))/13 * (40*e.^(1.3*i)-14);
    listasol = [listasol,v];
  endfor
  
  %error
  fprintf('Error\n')
  a = [abs((listasol(end)-e1)/(listasol(end)))*100 
  abs((listasol(end)-e2)/(listasol(end)))*100];
  for i=1:2
    fprintf('El error para h = %d es %d \n' , lista(i),a(i));
  endfor

  
  %Grafico
  figure(2)
  [~,y1] = midpoint(f,x,lista(1),xfinal,y0);
  [~,y2] = midpoint(f,x,lista(2),xfinal,y0);
  plot(0:lista(1):4,y1,'b','LineWidth',2,
       0:lista(2):4,y2,'g','LineWidth',2,
       0:0.1:4,listasol,'k','LineWidth',2)
  legend('0.25','0.5','analitica','FontSize',26)
  title('Tensión en condensador','FontSize',20)

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch



