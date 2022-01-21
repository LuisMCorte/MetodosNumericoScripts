function[L U X]=LUCrout(a,b)
% Factorizaci�n LU de la Matriz por Crout
  n = size(a,1); 
  m = length(b);  
  
  %captura de errores 
  if n ~= m
    msgID = 'M�todo LUCrout: Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensi�n incorrecta';
    error(msgID,msg)
  endif
  
  
  L=zeros(n); 
  U=eye(n); %Creamos las matrices para reallizar la factorizaci�n
  
%Algoritmo de Crout
for k=1:n
  for i=k:n
    L(i,k)=a(i,k)-L(i,1:k-1)*U(1:k-1,k);
  end
  for i=k+1:n
      if (U(k,k)== 0)
      msgID = 'M�todo LUCrout : Multiplicaci�n L U';
      msg = 'Divisi�n para 0';
      error(msgID,msg)
      endif
    U(k,i)=(a(k,i)-L(k,1:k-1)*U(1:k-1,i))/L(k,k);
  end
  A = a;
  if L*U ~= A
    msgID = 'M�todo LUCrout : Multiplicaci�n L U';
    msg = 'La multiplicaci�n L U no da igual a la matriz A';
    error(msgID,msg)
  endif
endfor
C=[L b']; %Ly = b
Y=SustitucionP(C);
D=[U Y']; %Ux=y
X=SustitucionR(D);
end
