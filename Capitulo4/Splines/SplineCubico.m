%Interpolacion Mediante Trazadores
%Descripción:
%Aproximacion una funcion polinomial a un conjunto de datos dados x,y
%Parametros:
%x= vector posición x de los puntos
%y= vector posición y de los puntos
function [c,n,h]= SplineCubico(x,y)

 n= length(x);
 m= length(y); 
   if n ~= m
    msgID = 'SplineCubico: Dimension Matriz';
    msg = 'La matriz aumentada tiene dimensión incorrecta';
    error(msgID,msg)
  endif
  w1=0;%segunda derivada del inicio igual a cero
  wn=0;%segunda derivada del final igual a cero
%Se crea un vector para almacenar los puntos para realizar el sistema de ecuaciones
  for i=1:n-1
    h(i)= x(i+1)-x(i);
  endfor
%segundas diferencias divididas
  for k=1:n-2
        V_In(k)=6*((y(k+2)-y(k+1))/h(k+1)-(y(k+1)-y(k))/h(k)) ;
  endfor
% Sistema de ecuaciones para hallar las segundas derivadas
  Ma_C(1,1)=2*(h(1)+ h(2) );
  Ma_C(1,2)= h(2);
  V_In(1)=V_In(1)-h(1)*w1;
  Ma_C(n-2,n-3)=h(n-2);
  Ma_C(n-2,n-2)=2*(h(n-2)+h(n-1));
  V_In(n-2)=V_In(n-2)-h(n-1)*wn;
%Construimos la Matriz con los valores encontrados
  for k=2:n-3
    Ma_C(k,k-1)=h(k);    
    Ma_C(k,k)=2*(h(k)+h(k+1));
    Ma_C(k,k+1)=h(k+1);
    V_In(k)=V_In(k);
  endfor
%Se resuelve la Matriz Aumentada
  Coeficientes=inv(Ma_C)*V_In';
  w(1)=w1;
  w(n)=wn;
  for j=2:n-1
    w(j)= Coeficientes(j-1);
  end
  %calculos de las primeras derivadas
  for k=1:n-1
    U(k)=(y(k+1)-y(k))/h(k)-(h(k)/6)*(2*w(k)+w(k+1));
  end
  %Se hallan los splines 
  for k=1:n-1
    c(k,1)=(w(k+1)-w(k))/(6*h(k)); %Coeficiente a
    c(k,2)=w(k)/2-3*x(k)*c(k,1); %Coeficiente b
    c(k,3)=U(k)-x(k)*w(k)+3*c(k,1)*x(k)^2; %Coeficiente c
    c(k,4)= -c(k,1)*x(k)^3 + (x(k)^2)*w(k)/2-x(k)*U(k)+y(k); %Coeficiente d
  endfor
endfunction
