function[data, resps] = GaussSeidel(A,B,maxi = 100,tol = 0.00001)

%************ + Comprobar características de la matriz + ******************
[m,n] = size(A);
X = zeros(1,n); %Vector que almacena los nuevos valores de la iteraci k-esima
P = zeros(1,n); %Vector que almacena los nuevos valores de la iteraci (k-1)-esima
k = 1;          %Contador de iteraciones

%Comprobar que la matriz sea simétrica
if (m!=n)
  msgID = 'GaussSeidel: Matriz inválida';
  msg = 'La matriz debe tener una diagonal estrictamente dominante.';
  error(msgID,msg)
endif

%Comprobar que la matriz tenga diagonal estrictamente dominante
es_domin = 1;

for i = 1:m
  
  ValDiag = abs(A(i,i));
  SumAdya = sum(abs(A(i,:))) - abs(A(i,i));
  
  if ( ValDiag < SumAdya && ValDiag != SumAdya )
    es_domin = 0;
    break;
  endif
  
endfor

if (~es_domin)
  msgID = 'GaussSeidel: Matriz inválida';
  msg = 'La matriz debe tener una diagonal estrictamente dominante.';
  error(msgID,msg)
endif
%*********************************************************************

%************ + Proceso iterativo de Gauss-Seidel + ******************
while (1)
  
  %Protección ante un número alto de iteraciones
  if (k == maxi)
    msgID = 'GaussSeidel: Iteraciones';
    msg = 'Numero alto de iteraciones, probablemente el método no converge.';
    error(msgID,msg)
    break;
  endif
  
  for j=1:n  %j equivale a cada fila  
    
    %Protección ante división para cero
    if (A(j,j) == 0)
      msgID = 'GaussSeidel: División para cero';
      msg = 'Uno de los elementos de la diagonal principal es cero.';
      error(msgID,msg)
    endif
    
    %Calculo iterativo
    if (j == 1)
      X(1) = ( B(1) - sum(A(1,2:n).*P(2:n)) ) ./ A(1,1);
    elseif(j == n)
      X(n) = ( B(n) - sum(A(n,1:n-1).*X(1:n-1)) ) ./ A(n,n);
    else
      X(j) = ( B(j) - sum(A(j,1:j-1).*X(1:j-1)) - sum(A(j,j+1:n).*P(j+1:n)) ) ./ A(j,j);
    endif
  endfor
  
  k+=1; %Aumento de iteración 
  
  %Evaluación de la distancia entre puntos (soluciones X y P)
  e = sum( abs( X - P ) );
  if (e <= tol)
    resps = X;
    break;
  endif
  
  %Ahora, hay que intercambiar el vector X y P
  P = X(:,:);
  
  %Almacenamiento de los datos por cada iteración
  data(k,:) = P;
endwhile

return
endfunction