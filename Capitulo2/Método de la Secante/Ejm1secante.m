function Ejm1secante()
    fun = @(x) 2.5 - (1/x);
    x0 = 0.1;  x1 = 0.6;
    
    %Grafico de la funcion
    ezplot("2.5-1/x",[-5 5 -2 2])
    grid on
    
    [solucion,iteraciones] = Secante(fun,x0,x1);
    if iteraciones > 0  
        fprintf('Numero de iteraciones:', 2 + iteraciones);
        fprintf('La solcion es:', solucion)
    else
        fprintf('Abort execution.\n')
    end
    
    %Impresion en pantalla de la raíz en la función
    str1 = num2str('*RAIZ',0);
    text(solucion,0,str1,'Color','red')
end

