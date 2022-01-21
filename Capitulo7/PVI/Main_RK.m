% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 15/12/2021
% Descripcion: Aproxime la solución a la ecuación diferencial mediante el método
% de Runge-Kutta

%Problema 1
#{
La solucion de la siguiente ecuacion diferencial representa la posicion de una
carga. Suponga que en t=0 la carga se encontraba a 0.5 m del punto de referencia.                        
#}

clc;clear;

f = @(x,y) y - x^2 + 1;
f_exacta = @(x) x^2 + 2*x + 1 -(1/2)*e^x; 
h = 0.1;
x0 = 0;
y0 = 0.5;
final_intervalo = 5;
dom = x0:h:final_intervalo;
try
    
    #Calculo del rango aproximado y exacto para su grafica y comparacion
    y_aprox = runge_kutta(f,h,x0,y0,final_intervalo,'TO');
    y_exac = arrayfun(f_exacta,dom);
    
    #=========================================================
    #             Generación de la tabla de valores
    #=========================================================
    n = size(y_aprox,2);
   
    fprintf('X\t   Y_aprox\t   Y_exac\t   Error*100 \n');
    fprintf('====================================================\n')
    
    for i = 1:n
           
        #Calculo del error por iteracion
        et = abs( (y_exac(i) - y_aprox(i) )/y_exac(i) )*100;
        
        #Muestra de la fila de resultados
        fprintf('%5.2f\t   %5.3f\t   %5.3f\t   %5.3f\n',dom(i),y_aprox(i),y_exac(i),et);
    
    endfor
    
    #=========================================================
    #                Grafica de la funcion solucion
    #=========================================================
    
    #Plot de la aproximacion
    figure(1);
    plot(dom, y_aprox, 'linewidth',2,'rs');
  
    hold on;
        
        #Plot de la solucion exacta
        plot(dom, y_exac, 'linewidth',2,'k');

        #Edicion de la grafica
        axis([x0 final_intervalo])
        title('Problema 1: Posicion de una carga')
        legend('Sol. aprox', 'Sol. exacta');
        xl = xlabel('tiempo [s]');
        yl = ylabel('Posicion [m]');
        set(gca,'fontsize',15);
        set(xl,'fontweight','bold');
        set(yl,'fontweight','bold');
        grid on;
    hold off;
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch


fprintf('\n')
fprintf('=========Problema 2===========\n')
fprintf('\n')



%Problema 2
#{
La solucion de la siguiente ecuacion diferencial representa la posicion de una
carga. Suponga que en t=0 la carga se encontraba a -1 m (El valor negativo se
debe a la direccion de la carga) del punto de referencia.                        
#}

f = @(x,y) 10 - x;
f_exacta =  @(x) 10*x - (x^2)/2 -1;
h = 0.1;
x0 = 0;
y0 = -1;
final_intervalo = 5;
dom = x0:h:final_intervalo;
try
    
    #Calculo del rango aproximado y exacto para su grafica y comparacion
    y_aprox = runge_kutta(f,h,x0,y0,final_intervalo,'HEUN');
    y_exac = arrayfun(f_exacta,dom);
    
    #=========================================================
    #             Generación de la tabla de valores
    #=========================================================
    n = size(y_aprox,2);
   
    fprintf('X\t   Y_aprox\t   Y_exac\t   Error*100 \n');
    fprintf('====================================================\n')
    
    for i = 1:n
           
        #Calculo del error por iteracion
        et = abs( (y_exac(i) - y_aprox(i) )/y_exac(i) )*100;
        
        #Muestra de la fila de resultados
        fprintf('%5.2f\t   %5.3f\t   %5.3f\t   %5.3f\n',dom(i),y_aprox(i),y_exac(i),et);
    
    endfor
    
    #=========================================================
    #                Grafica de la funcion solucion
    #=========================================================
    
    #Plot de la aproximacion
    figure(2);
    plot(dom, y_aprox, 'linewidth',2,'rs');
  
    hold on;
        
        #Plot de la solucion exacta
        plot(dom, y_exac, 'linewidth',2,'k');

        #Edicion de la grafica
        axis([x0 final_intervalo])
        title('Problema 2: Posicion de una carga')
        legend('Sol. aprox', 'Sol. exacta');
        xl = xlabel('tiempo [s]');
        yl = ylabel('Posicion [m]');
        set(gca,'fontsize',15);
        set(xl,'fontweight','bold');
        set(yl,'fontweight','bold');
        grid on;
    hold off;
    
catch error
  fprintf('Error: %s\n',error.message);
end_try_catch