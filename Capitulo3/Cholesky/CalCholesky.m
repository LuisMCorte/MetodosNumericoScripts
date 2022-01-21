%CalCholesky   Retorna la descompoción Cholesky de una matriz y la solución del sistema de ecuaciones (didáctica)
%   CalCholesky( A,B )
%       [L,Lt,y,resps] = CalCholesky(A,b)
%       L = Matriz L de la descomposición Cholesky
%       Lt = Matriz Lt de la descomposición Cholesky
%       y = vector de valores auxiliares del proceso de Cholesky para resolver sistemas de ecuaciones    
%       resps = respuestas al sistema de ecuaciones    
%       A = matriz simétrica y positiva
%       b = vector de valores independientes
%
%   See also Gauss-Jorda, Eliminación de Gauss, GaussPivote, GaussSeidel
%
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/28 15:42 $
%   Built-in function.
function[L,Lt,y,resps] = CalCholesky(A,b)

[m,n] = size(A);

%**1.Verificar que la matriz sea cuadrática
if (m != size(A)(2))
  msgID = 'CalCholesky: Matriz no cuadratica';
  msg = 'La matriz no es cuadratica.';
  error(msgID,msg)
endif


%**2.Verficar la condición de simetría

%Calculo matriz transpuesta
for i = 1:1:m
  At(:,i) = A(i,:);%Cada fila de A se vuleve una columna de At
endfor

if (A != At)
  msgID = 'CalCholesky: Condición de simetría';
  msg = 'La condición de simetría no se cumple, no es posible llevar a cabo el método. A!=A^t';
  error(msgID,msg)
endif


%**3.Verficar que A sea positiva
if (Determ(A) < 0)
  msgID = 'CalCholesky: La matriz no es positiva';
  msg = 'El determinante de la matriz en menor a cero';
  error(msgID,msg)
endif


%**4. Resolver los coeficientes de la descomposición L*Lt
%L comienza con una matriz de ceros 
L = zeros(m,n);

%Proceso para encontrar L
for k = 1:n
    
  for i = 1:k
    
    if (i==k)%Proceso para un valor de la diagonal principal
      
        if (k == 1)
          sumatoria = 0;
        else
          sumatoria = - sum( L(k,1:k-1).*L(k,1:k-1) );
        endif
        
        if( A(k,i) + sumatoria < 0 )
          msgID = 'CalCholesky: Raíz imaginaria';
          msg = 'Uno de los valores diagonales de L es imaginaria';
          error(msgID,msg)
        endif
        
        L(k,i) = sqrt( A(k,i) + sumatoria );      
    
    else%Proceso para un valor fuera de la diagonal principal
    
        if (i == 1)
          sumatoria = 0;
        else
          sumatoria = -sum( L(i,1:i-1).*L(k,1:i-1) );
        endif
        
        if( L(i,i) == 0 )
          msgID = 'CalCholesky: División para cero';
          msg = 'Uno de los valores diagonales de L, es 0';
          error(msgID,msg)
        endif
        
        L(k,i) = ( A(k,i) + sumatoria ) / L(i,i);     
    endif
    
  endfor
endfor

Lt = L';

%** 5. Encontrar y de Ly = b
y = ResolverTS(L,b);

%** 6. Encontrar x de Lt*x = y
resps = ResolverTI(Lt,y);

return
endfunction