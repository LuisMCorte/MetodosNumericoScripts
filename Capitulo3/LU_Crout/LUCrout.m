function[L U]=LUCrout(a,b)
% Factorización LU de la Matriz por Crout
  n = size(a,1); 
  m = lenght(b);  
  
  %captura de errores 
  if n ~= m
    msgID = 'Gauss Pivote : Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensión incorrecta';
    error(msgID,msg)
  endif
  
  
  L=zeros(n); 
  U=eye(n); %Creamos las matrices para reallizar la factorización
  
%Algoritmo de Crout
for k=1:n
  for i=k:n
    L(i,k)=a(i,k)-L(i,1:k-1)*U(1:k-1,k);
  end
  for i=k+1:n
    U(k,i)=(a(k,i)-L(k,1:k-1)*U(1:k-1,i))/L(k,k);
  end
end
C=[L b']; %Ly = b
Y=SustitucionP(C);
D=[U Y']; %Ux=y
SustitucionR(D);