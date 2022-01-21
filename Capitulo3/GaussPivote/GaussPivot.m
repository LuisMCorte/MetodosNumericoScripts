%Gauss con Pivoteo   Sistemas de ecuaciones (didáctica).
%       gausspivote(A,b) llenar 
%       [A,b] = gausspivote(A,b)
%       A = matriz de coeficientes
%       b = vector independiente  
%   
%
%   See also Eliminación gaussiana parcial
%   
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/21 16:00 $
%   Built-in function.

function [resps] = gausspivote(A,b)
  
  n = length(b);                      %longitud del vector independiente
  dimA = size(A,1);                   %Longitud de la primera fila
  
  %Captura de errores
  if n ~= dimA
    msgID = 'Gauss Pivote : Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensión incorrecta';
    error(msgID,msg)
  endif
  
  for j = 1:n-1                       %ciclo for para recorrer filas
    
    %selección de la fila pivote
    pivot = abs(A(j,j));              %captura del valor pivote
    f = j;                            %captura de la fila pivote
    for k = j+1:n;                    %ciclo for para recorrer filas desde la segunda
      
      %Captura de errores (columna de ceros)
      if (A(:,k)) == zeros(n,1)
        msgID = 'Gauss Pivote : Coeficientes';
        msg = 'Error: Columna de pivote es de ceros';                              
        error(msgID,msg) 
      endif
      
      if abs(A(k,j)) > pivot          %verifica si el valor absoluto es el mayor
        pivot = abs(A(k,j));          %captura el nuevo valor de pivote
        f = k;                        %captura el numero de fila que contiene el pivote
      endif   
    endfor
    
    %Intercambio de filas
    for i = j:n                       %ciclo for para recorrer columnas
      bfr  = A(j,i);                  %la variable before(bfr) captura el valor de
                                      %la posicion en la matriz
      A(j,i) = A(f,i);                %este nuevo valor se guarda en la nueva fila
                                      %(intercambio)
      A(f,i) = bfr;                   %el valor de bfr se guarda en la fila anterior
    endfor
    
    %Intercabio de valor(filas) en el vector independiente
    bfr = b(j);                       %usamos la variable bfr para capturar valores
    b(j) = b(f);                      % y realizar el intercambio
    b(f) = bfr;
    
    %Metodo de Gauss(eliminación)
    for k = j+1:n                          %ciclo for para recorrer columnas
      
      %Captura de errores (Division para cero)
      if A(j,j) == 0
        msgID = 'Gauss Pivote : Coeficientes';
        msg = 'Error: El resto de la columna ya son ceros';                              
        error(msgID,msg)
      endif
      
      ceros = -A(k,j)/A(j,j);              %número para obtener ceros 
      for m = j:n                          %ciclo for que recorre la fila a hacer ceros    
        A(k,m) = A(k,m) + ceros*A(j,m);    %realiza las operaciones pertinentes
      endfor
      b(k) = b(k) + ceros*b(j);            %realiza las operaciones pertinentes en el
    endfor                                 %vector independiente
  endfor
  
  %Calculo de coeficientes
  resps = ResolverTI(A,b);
  
return
endfunction