%PuntoFijo    Raices de ecuaciones (did�ctica).
%   PuntoFijo( FUNCION, XO, ERROR, ITER )
%       [ data,Xr ] = PuntoFijo( funcion, Xo, error, iter)
%       Xr = raiz de la funci�n
%       data = Matriz con el registro de cada iteracion
%       funcion = la funci�n a tratar
%       Xo = Valor incial para continuar el proceso
%       error = error minimo
%       iter = n�mero m�ximo de iteraciones
%
%   See also Biseccion, Metodo de la secante, Newton-Raphson 
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/12 13:02 $
%   Built-in function.

function[ Xr,i,e ] = PuntoFijo( g, Xo, tol =0.01, iter = 1000)

%_______Definicion de datos iniciales__________
i = 1; %Contador de iteraciones


%______Bucle que lleva a cabo el metodo_________
while 1
  
  %Calculo de la nueva raiz
  Xnew = g(Xo);
    
  e = abs( Xnew - Xo );
  
  if (i >= iter)
    msgID = 'Punto Fijo:iteraciones';
    msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
    error(msgID,msg)
  endif
  
 %Determinar si el programa alcanz� el valor minimo de error
  
 if (e <= tol)
    Xr = Xnew;
    break;
  else
    Xo = Xnew;%De lo contrario, Xnew se vuelve el nuevo valor inicial Xo
    i += 1;
  endif
  
endwhile
return
endfunction