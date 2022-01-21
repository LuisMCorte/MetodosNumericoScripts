function[pminimo,pminEvaluado] = NewtonM(f,initialPoint,tol,maxiter)
pkg load symbolic;

if ( tol <= 0 || maxiter <= 0 )
  msgID = 'NewtonM:Valores de iteraciones o iteraciones maximas';
  msg = 'La tolerancia o maximos de iteraciones son negativas';
  error(msgID,msg)
endif

grad = gradient(f);  #Calculo del gradiente
hess = hessian(f);   #Calculo del inverso del hessiano

i = 0;
while (1)
    
    #Reasignación de valores x,y,z
    x = initialPoint(1,1);
    y = initialPoint(2,1);
    
    if ( size(initialPoint,1) == 3 )
        z = initialPoint(3,1);
    endif
    
    #Calculo del nuevo punto que optimiza la funcion
    newPoint = initialPoint - inv( hess ) * eval(grad); 
    
    #Proceso de evalucion de la norma del gradiente en newPoint
    x = newPoint(1,1);
    y = newPoint(2,1);
    
    if ( size(initialPoint,1) == 3 )
        z = newPoint(3,1);
    endif
    
    normNewGrad = norm( eval( grad ) );
       
    #Criterios para la detencion del metodo
    i+=1;
    if (  normNewGrad < tol  )
        pminimo = newPoint;
        break;
    endif
    
    if ( i == maxiter )
        msgID = 'NewtonM:Iteraciones';
        msg = 'Cantidad alta de iteraciones. Probablemente el metodo diverge';
        error(msgID,msg)
        break;
    endif
    
    #Actualizacion del punto
    initialPoint = newPoint;
    
endwhile

#Calculo del valor en z del punto que optimiza la funcion
x = pminimo(1,1);
Y = pminimo(2,1);
pminEvaluado = eval( f );

return
endfunction