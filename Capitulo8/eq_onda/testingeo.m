clear;clc;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 2/01/2022
% Descripcion: Aproxime el resultado de las siguientes ecuaciones de onda
%mediante el metodo de diferencas finitas

% Problema 1:   
#{
Suponga una onda de longitud 1. Resuelva la ecuacion de onda suponiendo que 
alpha = 1, dx = 0.1, dt = 0.1, La posiicion inicial y final es 0. Su velocidad
inicial es 0. La forma de la onda obedece a sin(p*x)
#}

#Definir parametros iniciales
alpha = 4;              #Escalar alpha de la ecuacion de onda
L  = 1;                 #Longitud de la cuerda
dx = 0.1;               #Longitud de las divisiones 
dt = 0.1;               #Saltos en el tiempo
pos_ini = pos_fin = 0;  #Posicion inicial y final
Vin = 0;                #Velocidad inicial 
forma = @(x) sin(pi*x); #Forma de la cuerda en t=0 para todo x

try
    u_vals = we_solver(alpha,L,dx,dt,pos_ini,pos_fin,Vin,forma);

    figure(1);
    
    hold on;
    dom = pos_ini:dx:L;
    for r = 1:length(dom) - 1
      plot(dom,u_vals(:,r))
    endfor
    
    #Edición de la gráfica
    title('Problema 1')
    legend('C=4')    
    hold off;

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch

% Problema 2:   
#{
Suponga una onda de longitud 1. Resuelva la ecuacion de onda suponiendo que 
alpha = 6, dx = 0.1, dt = 0.1, La posiicion inicial y final es 0. Su velocidad
inicial es 0. La forma de la onda obedece a x^2
#}
#Definir parametros iniciales
alpha = 6;              #Escalar alpha de la ecuacion de onda
L  = 1;                 #Longitud de la cuerda
dx = 0.1;               #Longitud de las divisiones 
dt = 0.1;               #Saltos en el tiempo
pos_ini = pos_fin = 0;  #Posicion inicial y final
Vin = 0;                #Velocidad inicial 
forma = @(x) x*cos(x); #Forma de la cuerda en t=0 para todo x
try
    u_vals = we_solver(alpha,L,dx,dt,pos_ini,pos_fin,Vin,forma);

    figure(2);
    hold on;
        
        dom = pos_ini:dx:L;
        
        for r = 1:length(dom) - 1
          plot(dom,u_vals(:,r))        endfor
        
        #Edición de la gráfica
        title('Problema 2')
        legend('C=6')
            
    hold off;
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch
