function [L U X]= Doolittle(a,b)
  
% Factorizaci�n LU de la Matriz por Crout
  n = size(a,1);
  m = length(b);
  
  %captura de errores 
  if n ~= m
    msgID = 'Factorizaci�n Doolittle : Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensi�n incorrecta';
    error(msgID,msg)
  endif
  
  U=zeros(n); 
  L=eye(n);  %Creamos las matrices para reallizar la factorizaci�n
  
%Algoritmo de Doolittle
for k=1:n
  %Te devuelve la matriz U(Triangular Inferior)
   for j=k:n
       U(k,j)=a(k,j)-L(k,1:k-1)*U(1:k-1,j);
   end
   %Te devuelve la matriz L (Triangular Superior)
   for i=k+1:n
     if (U(k,k)== 0)
      msgID = 'M�todo Doolittle : Multiplicaci�n L U';
      msg = 'Divisi�n para 0';
      error(msgID,msg)
     endif
    L(i,k)=(a(i,k)-L(i,1:k-1)*U(1:k-1,k))/U(k,k);
   end
  A = a;
  if L*U ~= A
    msgID = 'M�todo Doolittle : Multiplicaci�n L U';
    msg = 'La multiplicaci�n L U no da igual a la matriz A';
    error(msgID,msg)
  endif
end
C =[L b']; %Ly = b
Y=SustitucionP(C);
D =[U Y'];
X = SustitucionR(D); %Ux=y

