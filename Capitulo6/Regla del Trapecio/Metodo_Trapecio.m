function [error,s,x,y] =  Metodo_Trapecio(f,fe,b,a,n)
  if n==0
    msgID = 'Metodo_Trapecio: Ingreso de Datos';
    msg = 'El número de iteraciones no puede ser igual a 0';
    error(msgID,msg)
  endif
  h=(b-a)/(n);%Definimos el delta
  s=0; %Sumatoria de los intervalos
  for i=0:n
    xi = a+i*h; %Definimos los xi que vamos a tomar en las iteraciones
    delta = h/2;
    if (i==0 || i==n) %Si estoy en la primera o última itereacion el coeficiente que multiplica por 1
      coef = 1;
    else %Si no nos encontramos en la primera o última iteación multiplicamos por 2
      coef = 2;
    end
    prod = coef*f(xi);
    result=delta*prod; %la base por la altura del trapecio
    s=s+result; %Vamos acumulando los resultados en la sumatoria
  end
  x = linspace(a,b,n); %Vector para graficar
  y= [];
  hold on
  for i=1:length(x)
     y=[y,f(x(i))]; %Vector para graficar
  endfor
  error = ((-(b-a)^3)/(12*n^2))*(fe); %Calculamos el error
endfunction
