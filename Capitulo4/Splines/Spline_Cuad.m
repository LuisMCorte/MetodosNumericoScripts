function[Coeficientes,l,n]=Spline_Cuad(x,y)
%Se recibe 2 vectores [x,y] de tipo int
%Se va a devolver una matriz de Coeficientes
 g = length(x); 
 h = length(y);
  %captura de errores 
  if g ~= h
    msgID = 'Spline_Cuad: Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensión incorrecta';
    error(msgID,msg)
  endif

  n  = length(x)-1;
  V=[zeros(n^2,1)]; %Creamos una columna de 0 para los coeficientes independientes

  Z = zeros(length(V)); %Matriz cuadratica de 0 de longitud V
  j=1; 
  f=1; 
  %Llenamos la Matriz para hallar los coeficientes  Z
  for i=2:2:2*n  
    Z(i,f:f+2) = [x(j)^2 x(j) 1]; % Operaciones para crear la matriz de coeficientes
    V(i) = y(j); % Se rellena la Matriz de Coeficientes independients
    j = j+1; 
    Z(i+1,f:f+2) = [x(j)^2 x(j) 1];
    V(i+1) = y(j);
    f =  f+3;
  end
  %Comprobamos la continuidad de los nodos interiores y agregamos a la Matriz Z
  j=1;
  l=2;
  for i=2*n+2:3*n  
    Z(i,j:j+1) = [2*x(l) 1];
    Z(i,j+3:j+4) = [-2*x(l) -1];
    j = j+3;
    l = l+1;
  end
  % Ajustamos el valor de la matriz de la columna 1; fila 1,  para el valor a1 =0
  Z(1,1)= (1);
  Coeficientes = Z\V; %Se resuelve la Matriz Aumentada para obtener los coeficientes
   for i=1:n
    splines = Coeficientes(j)*(l.^2) + Coeficientes(j+1)*l + Coeficientes(j+2);
   endfor
endfunction

