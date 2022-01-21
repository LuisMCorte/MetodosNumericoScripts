function[s,error]= Trapecio_Simple(f,a,b,fe)
  h=(b-a)/2;%Definimos el delta de la formula
  s= h*(f(a)+f(b)); %Fórmula para calcular el area 
  error = ((-(b-a)^3)/(12))*(fe); %Calculamos el error
endfunction