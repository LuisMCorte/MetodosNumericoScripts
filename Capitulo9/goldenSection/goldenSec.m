%goldenSec    Aplica el metodo de busqueda de la seccion dorada para optimizar
%             una funcion
%   goldenSec(INTERVALO,TOL,MAXITER,F)
%       [data,xm,fm] = goldenSec(intervalo,tol,maxiter,f)
%       data = datos provenientes de cada iteracion 
%       xm,fm = valor x y f(x) minimio/maximo
%       intervalo = intervalo en el que realizar la optimizacion 
%       tol = error minimo  
%       maxiter = cantidad maxima de iteraciones
%       f = funcion a tratar
%   See also Diferentes metodos de optimizacion
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/01/04 23:06 $
%   Built-in function.
function [data,xm,fm] = goldenSec(intervalo,tol,maxiter,f)

if ( intervalo(1) == intervalo(2) )
  msgID = 'goldenSec:Los limites de los intervalos no pueden ser iguales';
  msg = 'Limites del intervalo';
  error(msgID,msg)
endif

if ( tol < 0 || maxiter < 0 )
  msgID = 'goldenSec:Valores de iteraciones o iteraciones maximas';
  msg = 'La tolerancia o maximos de iteraciones son negativas';
  error(msgID,msg)
endif

#Desempaquetado de datos
r = 0.3820;
a = intervalo(1);
b = intervalo(2);
i = 0;

#Bucle de reducción del intervalo
while (1)
    
    #Calculo de nuevos x1,x2 para cada iteracion
    x1 = a + r*( b - a );
    x2 = b - r*( b - a );    
        
    #Calculo de f(x1) y f(x2)
    fx1 = f(x1);
    fx2 = f(x2);
    
    i += 1; #Aumento de iteraciones
    e = abs( fx1 - fx2); #Calculo del error
    
    #Aniadir los datos
    data(i,1:6) = [ i,x1,x2,fx1,fx2,e ];
    
    #Reduccion del intervalo 
    if ( fx1 > fx2 )
        #Reduccion por la izquierda
        a = x1;
    else
        #Reduccion por la derecha
        b = x2;
    endif
    
    #Capturar la cantidad maxima de iteraciones
    if ( i == maxiter )
        msgID = 'goldenSec:Maximo de iteraciones';
        msg = 'Probablemente el metodo diverge';
        error(msgID,msg)
    endif
    
    #Decidir la finalizacion del bucle
    if ( e <= tol)
        xm = (x1 + x2)/2;
        fm = f(xm);
        break;
    endif
    
endwhile       

return
endfunction