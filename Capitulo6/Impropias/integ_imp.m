%integ_imp  Aproxima el resultado de una integral impropia mediante la regla
%           de Simpson 1/3 y la formula de Gauss-Legendre
%   integ_imp(FUNCION ,ESCAL ,INTERVALO)
%       [I,e] = integ_imp(funcion ,escal ,intervalo)
%       I = aproximacion de la integral 
%       e = error por la integración de dos puntos
%       funcion = la función a tratar
%       intervalo = intervalo de integración 
%
%   See also Regla de Simpson, Método de trapecios, Gauss-Legendre,
%            Gauss-Chebyshev 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/8 23:06 $
%   Built-in function.

function [I,e] = integ_imp(funcion ,escal ,intervalo)
    
##Verificación de límites
if ( intervalo(1) >= intervalo(2) )
    msgID = 'integ_imp:El límite inferior es mayor al superior';
    msg = 'Límites inválidos';
    error(msgID,msg)
endif

if ( intervalo(1)== 0 || intervalo(2) == 0 )
    msgID = 'integ_imp:Existe un límite igual a 0';
    msg = 'Límites inválidos';
    error(msgID,msg)
endif

li = intervalo(1);
ls = intervalo(2);
    
##Integrar dependiendo de los límites
if ( li == -Inf && ls == Inf )
    
    #Valor usado para partir la integral
    valp = 1; 
    
    #Integrar desde -Inf hasta valp
    [I1,e1] = GLimp(funcion,[-1/2,0]);
    I2 = simpson_onethird(-2,valp,funcion,8);
    
    #Integrar desde valp hasta +Inf
    [I3,e2] = GLimp(funcion,[0,1/valp]);
    
    #Calcular la integral
    I = escal*( I1 + I2 + I3 );
    e = e1 + e2;
    
elseif ( li == -Inf && ls > 0 )
    
    #Definir un valor de particion
    valp = -2;
    
    #Integrar desde -Inf hasta valp
    [I1,e] = GLimp(funcion,[1/valp,0]);
    
    #Integrar desde valp hasta ls
    I2 = simpson_onethird(valp,ls,funcion,8);
    
    #Calcular la integral
    I = escal*( I1 + I2 );
    
elseif ( li == -Inf && ls < 0 )
    
    #Integrar desde -Inf hasta ls
    [I1,e] = GLimp(funcion,[1/ls,0]);
    
    #Calculo de la integral
    I = escal*(I1)
    
elseif ( li < 0 && ls == Inf)
    
    #Definir un valor de particion
    valp = 1;
    
    if (li == valp)
        valp+=1;
    endif

    #Calcular integral desde li hasta valp
    I1 = simpson_onethird(li,valp,funcion,8);

    #Calcular integral desde valp hasta +Inf
    [I2,e] = GLimp(funcion,[0,1/valp]);
    
    #Calculo de la integral
    I = escal*( I1 + I2 );
    
else
    
    #Integrar desde -Inf hasta ls
    [I1,e] = GLimp(funcion,[0,1/li]);
    
    #Calculo de la integral
    I = escal*(I1)
    
endif
    
return
endfunction
