clc;clear;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 22/12/2021
% Descripcion: Aproxime el resultado de las siguientes ecuaciones diferenciales
%mediante el metodo de diferencas finitas

% Problema 1:   
#{
Suponga que una carga electrica se mueve a aceleracion constante. En tanto, su
movimiento cumple con la ecuacion y'' = a. La carga comienza su recorrido desde
el origen y luego de 80 segundos se encuentra a 80 m. Suponga que su aceleracion
es de 0.5 m/s^2. Resuelva la funcion de posicion.
#}
#Condiciones iniciales
xi = 0;
xf = 50;
yi = 0;
yf = 80;

#Definir la cantidad de particiones p y longitud de intervalos h
p = 20;   
h = (xf - xi)/p; 
dom = xi:h:xf;
#funcion g(x)
f = @(x) -0.5*(h^2);
y_e = @(x) -0.25*(x^2) + 14.10*x;

#Coeficientes de las aproximaciones de y
coefs = [1 -2 1];
try 
    
    #Calculo del rango
    rango = FinDif(xi,yi,xf,yf,f,p,h,coefs);
    rango_ex = arrayfun(y_e,xi:h:xf);

    #Plot de la solucion
    figure(1);
    plot(xi:h:xf,rango,'linewidth',2,'r');

    hold on;
        
        #Plot de la solucion exacta
        plot(xi:h:xf,rango_ex,'linewidth',2,'k--')
        
        #Edicion de la grafica
        title('Problema 1: Posicion de una carga')
        legend('Sol. aprox','Sol.exac');
        xl = xlabel('tiempo [s]');
        yl = ylabel('Posicion [m]');
        set(gca,'fontsize',15);
        set(xl,'fontweight','bold');
        set(yl,'fontweight','bold');
        grid on;

    hold off;
    
    #Impresion de los valores aproximados y analiticos
    fprintf('X\t   Y_aprox\t   Y_exac\t   Error*100 \n');
    fprintf('====================================================\n')
    m = length(dom);
    
    for i = 1:m
           
        #Calculo del error por iteracion
        et = abs( (rango_ex(i) - rango(i) )/rango_ex(i) )*100;
        
        #Muestra de la fila de resultados
        fprintf('%5.2f\t   %5.3f\t   %5.3f\t   %5.3f\n',dom(i),rango(i),rango_ex(i),et);
    
    endfor

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch


% Problema 2:   
#{
Para entender mejor el fenómeno transitorio en una máquina síncrona, se parte del estudio del comportamiento 
transitorio de un circuito RL. Dado un circuito RL, la ecuación diferencial del circuito es y'' - 10*y = 0.
Las condiciones iniciales en t = 0, I = 0 y en t = 1s, i = 1mA. Encuentre la funcion que represente a la corriente 
desde t=0 hasta t=1.
#}
#Condiciones iniciales
xi = 0;
xf = 1;
yi = 0;
yf = 1;

#Definir la cantidad de particiones p y longitud de intervalos h
p = 10;   
h = (xf - xi)/p; 
dom = xi:h:xf;
#funcion g(x)
f = @(x) 0;
y_e = @(x) 0.042*e^(sqrt(10)*x) - 0.042*e^(-sqrt(10)*x) ;

#Coeficientes de las aproximaciones de y
coefs = [1 -2.1 1];

try 
    
    #Calculo del rango
    rango = FinDif(xi,yi,xf,yf,f,p,h,coefs);
    rango_ex = arrayfun(y_e,xi:h:xf);
    rango1 = FinDif(xi,yi,xf,yf,f,p/2,2*h,coefs);

    #Plot de la solucion
    figure(2);
    plot(xi:h:xf,rango,'linewidth',2,'r');

    hold on;
        
        #Plot de la solucion exacta
        plot(xi:h:xf,rango_ex,'linewidth',2,'k--')
        
        
        #Edicion de la grafica
        title('Problema 2: Posicion de una carga')
        legend('Sol. aprox','Sol. exac');
        xl = xlabel('tiempo [s]');
        yl = ylabel('Posicion [m]');
        set(gca,'fontsize',15);
        set(xl,'fontweight','bold');
        set(yl,'fontweight','bold');
        grid on;

    hold off;
    
    #Impresion de los valores aproximados y analiticos
    fprintf('X\t   Y_aprox\t   Y_exac\t   Error*100 \n');
    fprintf('====================================================\n')
    m = length(dom);
    
    for i = 1:m
           
        #Calculo del error por iteracion
        et = abs( (rango_ex(i) - rango(i) )/rango_ex(i) )*100;
        
        #Muestra de la fila de resultados
        fprintf('%5.2f\t   %5.3f\t   %5.3f\t   %5.3f\n',dom(i),rango(i),rango_ex(i),et);
    
    endfor

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch