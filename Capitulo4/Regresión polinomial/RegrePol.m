%RegrePol Retorna los coeficientes de una regresión polinomial
%   RegrePol( X,Y,GRADO )
%       [coefs] = RegrePol(x,y,grado)
%       coefs = coeficientes de la variable independiente
%       x = valores medidos experimentalmente
%       y = valores medidos experimentalmente
%
%   See also Ajuste mínimos cuadrados, regresión lineal
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/10 10:00 $
%   Built-in function.
function[coefs,e] = RegrePol(x,y,grado)

if ( size(x,2) != size(y,2) )
  msgID = 'RegrePol: Dimensiones distintas';
  msg = 'Los vectores que contienen las mediciones no tienen la misma longitud';
  error(msgID,msg)
endif

if ( grado < 0 )
  msgID = 'RegrePol: Grado negativo';
  msg = 'El grado del polinomio no puede ser negativo';
  error(msgID,msg)
endif

Sr = 0;
n = size(x,2); 
dimension = grado + 1;

for m = 1:dimension
  
  %Si estamos en la primera fila
  if ( m == 1 ) 
        A(m,1) = size(x,2); 
        
        %Actualizacion del vector de coefs independientes
        B(1) = sum(y);
        
        %Actualizacion de los elementos de la fila de A
        for i = 1:grado
          A(m,i+1) = sum(x.^i);
        endfor
  
  %De lo contrario
  else 
        %Actualizacion del vector de coefs independientes    
        B(m) = sum( y.*x.^(m-1) );

        %Actualizacion de los elementos de la fila de A        
        x_exps = m - 1: m + dimension - 2;%Definicion de los exponentes de x  
        for i = 1:dimension
          A(m,i) = sum( x.^x_exps(i) );
        endfor   
  endif
  
endfor

coefs = flip( Gauss_Jordan(A,B) );
imag_aprox = polyval(coefs,x);

%Calculo de la suma de residuos
for i = 1:n
  Sr = Sr + ( y(i) - imag_aprox(i) )^2;
endfor

%Calculo del error estandar de la aproximacion
e = sqrt ( Sr/(n - grado - 1) );

return
endfunction