%runge_kutta Aproxima la solucion a una EDO de la forma f' = f(x,y) en un
%            intervalo [x0,fi]
%   runge_kutta( F,H,X0,Y0,FI,MODO )
%       [ rango ] = runge_kutta( f, h, x0, y0, fi, modo )
%       rango = Valores del eje y de la solucion a la EDO
%       f = Funcion de dos variables tal que f' = f(x,y)
%       h = salto en el intervalo del dominio
%       x0 = valor inicial de x
%       y0 = valor inicial de y
%       fi = final del itervalo en el que esta definido la funcion solucion
%       modo = Formula a aplicar del metodo de runge_kutta
%   See also Euler, Punto medio  
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/15 12:12 $
%   Built-in function.
function[rango] = runge_kutta( f, h, x0, y0, fi, modo)

if (h == 0)
    msgID = 'runge_kutta: Salto h = 0 no esta permitido'
    msg = 'h no puede ser cero'
    error(msgID,msg)
endif

if (x0 == fi || fi < x0)
    msgID = 'El final del intervalo para la muestra de la ecuacion es igual o menor a x0'
    msg = 'fi tiene que ser diferente y mayor a x0'
    error(msgID,msg)
endif


#Definicion del dominio
dom = x0 : h : fi;

#Definicion inicial del rango
rango = [y0];


#=============================================================
#           Aplicacion del metodo en funcion del modo
#=============================================================

switch modo
    
    case{'HEUN'}
    
        for i = 1 : size(dom,2) - 1

            #Calculo de k1
            k1 = f( dom(i) , rango(i));
            
            #Calculo de k2
            k2 = f( dom(i) + h , rango(i) + k1*h );
            
            #Calculo del siguiente valor del rango
            rango(i+1) = rango(i) + ( (1/2)*k1 + (1/2)*k2 )*h;

        endfor
    
    case{'TO'}
        
        for i = 1 : size(dom,2) - 1

            #Calculo de k1
            k1 = f( dom(i) , rango(i));
            
            #Calculo de k2
            k2 = f( dom(i) + 0.5*h , rango(i) + 0.5*k1*h );
            
            #Calculo de k3
            k3 = f( dom(i) + h , rango(i) - k1*h + 2*k2*h );
            
            #Calculo del siguiente valor del rango
            rango(i+1) = rango(i) + (1/6)*( k1 + 4*k2 + k3 )*h;

        endfor
    
endswitch
return
endfunction